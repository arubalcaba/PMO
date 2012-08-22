package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class QualityTargetController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [qualityTargetInstanceList: QualityTarget.list(params), qualityTargetInstanceTotal: QualityTarget.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[qualityTargetInstance: new QualityTarget(params)]
			break
		case 'POST':
	        def qualityTargetInstance = new QualityTarget(params)
            if(!params?.qualityMet)
            {
                qualityTargetInstance.qualityMet=false;
            }
            else
            {
                qualityTargetInstance.qualityMet=true;
            }
	        if (!qualityTargetInstance.save(flush: true,failOnError: true)) {
				response.status = 405;
				render "Unable to create Quality Traget";	   
	            return
	        }
			
			withFormat{
				html{
					flash.message = message(code: 'default.created.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), qualityTargetInstance.id])
					redirect action: 'show', id: qualityTargetInstance.id
				}
				json{
					response.status = 200;
					render text: qualityTargetInstance.id;
				}
			}
			
			break
		}
    }

    def show() {
        def qualityTargetInstance = QualityTarget.get(params.id)
        if (!qualityTargetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
            redirect action: 'list'
            return
        }

        [qualityTargetInstance: qualityTargetInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def qualityTargetInstance = QualityTarget.get(params.id)
	        if (!qualityTargetInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [qualityTargetInstance: qualityTargetInstance]
			break
		case 'POST':
			withFormat{
				html{
					def qualityTargetInstance = QualityTarget.get(params.id)
					if (!qualityTargetInstance) {
						flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
						redirect action: 'list'
						return
					}
		
					if (params.version) {
						def version = params.version.toLong()
						if (qualityTargetInstance.version > version) {
							qualityTargetInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
									  [message(code: 'qualityTarget.label', default: 'QualityTarget')] as Object[],
									  "Another user has updated this QualityTarget while you were editing")
							render view: 'edit', model: [qualityTargetInstance: qualityTargetInstance]
							return
						}
					}

					qualityTargetInstance.properties = params
		
					if (!qualityTargetInstance.save(flush: true)) {
						render view: 'edit', model: [qualityTargetInstance: qualityTargetInstance]
						return
					}
		
					flash.message = message(code: 'default.updated.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), qualityTargetInstance.id])
					redirect action: 'show', id: qualityTargetInstance.id
				}
				json{
					def qualityTargetInstance = QualityTarget.get(params.id)
					if (!qualityTargetInstance) {
						response.status = 405;
						render "Quality ${params.id} not found"
					}
					
					if (params.version) {
						def version = params.version.toLong()
						if (qualityTargetInstance.version > version) {
							qualityTargetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
									  [message(code: 'qualityTarget.label', default: 'QualityTarget')] as Object[],
									  "Another user has updated this QualityTarget while you were editing")
							render qualityTargetInstance.errors.allErrors as JSON;
						}
					}
					
					def columnId = params.columnId;
					if(params.columnId.equalsIgnoreCase("2"))
						qualityTargetInstance.qualityTarget = params.value;
					else if(params.columnId.equalsIgnoreCase("3"))
						qualityTargetInstance.qualityMeasurementProcess = params.value;
                    else if(params.columnId.equalsIgnoreCase("4"))
                    {
                        if(params.value.equalsIgnoreCase("Yes"))
                            qualityTarget.qualityMet.true;
                        else
                            qualityTarget.qualityMet=false;
                    }
						
					if (!qualityTargetInstance.save(flush: true)) {
							response.status = 404;
							message = "an error occurred";
							render message as JSON;
					}
					
					response.status = 200;
					render text:params.value
				}
			}
	        
			break
		}
    }

    def delete() {
		withFormat{
			html{
				def qualityTargetInstance = QualityTarget.get(params.id)
				if (!qualityTargetInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
					redirect action: 'list'
					return
				}
		
				try {
					qualityTargetInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
					redirect action: 'list'
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
					redirect action: 'show', id: params.id
				}
			}
			json{
				def qualityTargetInstance = QualityTarget.get(params.id)
				if (!qualityTargetInstance) {
					response.status = 405;
					render "Quality ${params.id} not found"
				}
				try {
					qualityTargetInstance.delete(flush: true)
					response.status = 200;
					render text:"ok";
				}
				catch (DataIntegrityViolationException e) {
					response.status = 405;
					render "{message(code: 'default.not.deleted.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])}"
				}
			}
		}
    }
	
	def dataTablesSource(){
		def projectInfo = ProjectInfo.get(params.projectInfoId);
		def qualityTargetList = projectInfo ? QualityTarget.findAllByProjectInfo(projectInfo):[];
		def jsonResponse = [:];
		jsonResponse.aaData=[];
		
		qualityTargetList?.each{ qualityTarget ->
			jsonResponse.aaData << [qualityTarget.id,
									qualityTarget.projectInfo.id,
									qualityTarget.qualityTarget,
									qualityTarget.qualityMeasurementProcess,
                                    qualityTarget.qualityMet?'yes':'no']
		}
		
		render jsonResponse as JSON;
	}
}
