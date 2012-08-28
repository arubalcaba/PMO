package com.parago.pmo
import org.springframework.dao.DataIntegrityViolationException

import grails.converters.JSON


class ProjectInvoiceController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [projectInvoiceInstanceList: ProjectInvoice.list(params), projectInvoiceInstanceTotal: ProjectInvoice.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[projectInvoiceInstance: new ProjectInvoice(params)]
			break
		case 'POST':
		    print "invoice params:\t"+ params
	        def projectInvoiceInstance = new ProjectInvoice();
			//projectInvoiceInstance.properties['projectInfo'] = params;
			def invoiceStatusInstance = InvoiceStatus.get(params?.invoiceStatus);
			def projectInfoInstance = ProjectInfo.get(params?.projectInfo.id);
					
			projectInvoiceInstance.billableAmount= params?.billableAmount.toDouble();
			projectInvoiceInstance.invoiceStatus =invoiceStatusInstance;
			projectInvoiceInstance.invoiceNote= params?.invoiceNote;
			projectInvoiceInstance.projectInfo =  projectInfoInstance;
			
			
			
	        if (!projectInvoiceInstance.save(flush: true,failOnError: true)) {
				response.status = 405;
				render "Unable to create Invoice";
				return
	        }
			
			withFormat{
				html{
					flash.message = message(code: 'default.created.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), projectInvoiceInstance.id])
					redirect action: 'show', id: projectInvoiceInstance.id
				}
				json{
					response.status=200;render text:projectInvoiceInstance.id
				}
			}
			break
		}
    }

    def show() {
        def projectInvoiceInstance = ProjectInvoice.get(params.id)
        if (!projectInvoiceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), params.id])
            redirect action: 'list'
            return
        }

        [projectInvoiceInstance: projectInvoiceInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def projectInvoiceInstance = ProjectInvoice.get(params.id)
	        if (!projectInvoiceInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [projectInvoiceInstance: projectInvoiceInstance]
			break
		case 'POST':
			withFormat{
				html{
					def projectInvoiceInstance = ProjectInvoice.get(params.id)
					if (!projectInvoiceInstance) {
						flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), params.id])
						redirect action: 'list'
						return
					}
		
					if (params.version) {
						def version = params.version.toLong()
						if (projectInvoiceInstance.version > version) {
							projectInvoiceInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
									  [message(code: 'projectInvoice.label', default: 'ProjectInvoice')] as Object[],
									  "Another user has updated this ProjectInvoice while you were editing")
							render view: 'edit', model: [projectInvoiceInstance: projectInvoiceInstance]
							return
						}
					}
		
					projectInvoiceInstance.properties = params
		
					if (!projectInvoiceInstance.save(flush: true)) {
						render view: 'edit', model: [projectInvoiceInstance: projectInvoiceInstance]
						return
					}
		
					flash.message = message(code: 'default.updated.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), projectInvoiceInstance.id])
					redirect action: 'show', id: projectInvoiceInstance.id
				}
				json{
					def projectInvoiceInstance = ProjectInvoice.get(params.id)
					if (!projectInvoiceInstance) {
						response.status = 405;
						render "Project Invoice ${params.id} not found";
					}
					if (params.version) {
						def version = params.version.toLong()
						if (projectInvoiceInstance.version > version) {
							projectInvoiceInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
									  [message(code: 'projectInvoice.label', default: 'ProjectInvoice')] as Object[],
									  "Another user has updated this ProjectInvoice while you were editing")
							render projectInvoiceInstance.errors.allErrors as JSON;
						}
					}
					def columnId = params.columnId;
					if(params.columnId.equalsIgnoreCase("2"))
						{
								projectInvoiceInstance.billableAmount = params.value.toDouble();
						}
					else if(params.columnId.equalsIgnoreCase("3"))
					     {
							 projectInvoiceInstance.invoiceStatus = InvoiceStatus.get(params.value);
					     }
					else
						projectInvoiceInstance.invoiceNote = params.value;
												
					if (!projectInvoiceInstance.save(flush: true)) {
						response.status = 404;
						message = "an error occurred";
						render message as JSON;
					}
					
					response.status = 200;
					render text:params.value;			
				}
			}
			break
		}
    }

    def delete() {
		withFormat{
			html{
				def projectInvoiceInstance = ProjectInvoice.get(params.id)
				if (!projectInvoiceInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), params.id])
					redirect action: 'list'
					return
				}
		
				try {
					projectInvoiceInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), params.id])
					redirect action: 'list'
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), params.id])
					redirect action: 'show', id: params.id
				}
			}
			json{
				def projectInvoiceInstance = ProjectInvoice.get(params.id)
				if (!projectInvoiceInstance) {
					response.status = 405;
					render "Project Invoice ${params.id} not found";
				}
				try{
						projectInvoiceInstance.delete(flush:true);
						response.status = 200;
						render text:"ok";
				}
				catch (DataIntegrityViolationException e) {
					message = message(code: 'default.not.deleted.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), params.id])
					response.status = 405;
					render message as JSON;
				}
			}
		}
        
    }
	
  def dataTablesSource(){
	  def projectInfo = ProjectInfo.get(params.projectInfoId);
	  def projectInvoiceList = projectInfo ? ProjectInvoice.findAllByProjectInfo(projectInfo):[];
	  def jsonResponse = [:];
	  jsonResponse.aaData=[];
	  
	  projectInvoiceList?.each{ projectInvoice ->
		  jsonResponse.aaData << [projectInvoice.id,
								  projectInvoice.projectInfo.id,
                                    projectInvoice.billableAmount,
								  projectInvoice.invoiceStatus.status,
								  projectInvoice.invoiceNote]
	  }
	  
	  render jsonResponse as JSON;
	   
  }	
}
