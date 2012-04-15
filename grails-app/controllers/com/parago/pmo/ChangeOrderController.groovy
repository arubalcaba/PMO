package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ChangeOrderController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [changeOrderInstanceList: ChangeOrder.list(params), changeOrderInstanceTotal: ChangeOrder.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[changeOrderInstance: new ChangeOrder(params)]
			break
		case 'POST':
			
	        def changeOrderInstance = new ChangeOrder(params)
	        if (!changeOrderInstance.save(flush: true)) {
	            render view: 'create', model: [changeOrderInstance: changeOrderInstance]
	            return
	        }	
			withFormat{
				html{
					flash.message = message(code: 'default.created.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), changeOrderInstance.id])
					redirect action: 'show', id: changeOrderInstance.id
				}
				json{
					response.status = 200;render text:changeOrderInstance.id
				}
			}
			break
		}
    }

    def show() {
        def changeOrderInstance = ChangeOrder.get(params.id)
        if (!changeOrderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
            redirect action: 'list'
            return
        }

        [changeOrderInstance: changeOrderInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def changeOrderInstance = ChangeOrder.get(params.id)
	        if (!changeOrderInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [changeOrderInstance: changeOrderInstance]
			break
		case 'POST':
			withFormat{
				html{
					def changeOrderInstance = ChangeOrder.get(params.id)
					if (!changeOrderInstance) {
						flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
						redirect action: 'list'
						return
					}
		
					if (params.version) {
						def version = params.version.toLong()
						if (changeOrderInstance.version > version) {
							changeOrderInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
									  [message(code: 'changeOrder.label', default: 'ChangeOrder')] as Object[],
									  "Another user has updated this ChangeOrder while you were editing")
							render view: 'edit', model: [changeOrderInstance: changeOrderInstance]
							return
						}
					}
		
					changeOrderInstance.properties = params
		
					if (!changeOrderInstance.save(flush: true)) {
						render view: 'edit', model: [changeOrderInstance: changeOrderInstance]
						return
					}
		
					flash.message = message(code: 'default.updated.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), changeOrderInstance.id])
					redirect action: 'show', id: changeOrderInstance.id
				}
				json{
					def changeOrderInstance = ChangeOrder.get(params.id)
					if (!changeOrderInstance) {
						response.status = 405;
						render "Change Order ${params.id} not found"
					}
					
					if (params.version) {
						def version = params.version.toLong()
						if (changeOrderInstance.version > version) {
							changeOrderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
									  [message(code: 'changeOrder.label', default: 'ChangeOrder')] as Object[],
									  "Another user has updated this ChangeOrder while you were editing")
							render changeOrderInstance.errors.allErrors as JSON;
						}
					}
					
					def columnId = params.columnId;
					if(columnId == 2)
						changeOrderInstance.changeOrderName = params.value;
					else if(columnId == 3)
						changeOrderInstance.costImpact = params.value;
					else if(columnId == 4)
						changeOrderInstance.scheduleImpact = params.value;
					else
						changeOrderInstance.link = params.value;
					
						if (!changeOrderInstance.save(flush: true)) {
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
				def changeOrderInstance = ChangeOrder.get(params.id)
				if (!changeOrderInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
					redirect action: 'list'
					return
				}
		
				try {
					changeOrderInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
					redirect action: 'list'
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
					redirect action: 'show', id: params.id
				}
			}
			json{
				def changeOrderInstance = ChangeOrder.get(params.id)
				if (!changeOrderInstance) {
					response.status = 405;
					render "Change Order ${params.id} not found"
				}
				try
				{
					changeOrderInstance.delete(flush:true);
					response.status = 200;
					render text:"ok";
				}
				catch (DataIntegrityViolationException e) {
					message = message(code: 'default.not.deleted.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
					response.status = 405;
					render message as JSON;
				}
			}
		}
    }
	
	def dataTablesSource(){
		def projectInfo = ProjectInfo.get(params.projectInfoId);
		def changeOrderList = projectInfo ? ChangeOrder.findAllByProjectInfo(projectInfo):[];
		def jsonResponse = [:];
		jsonResponse.aaData=[];
		
		changeOrderList?.each{ changeOrder ->
			jsonResponse.aaData << [changeOrder.id,
									changeOrder.projectInfo.id,
									changeOrder.changeOrderName,
									changeOrder.costImpact,
									changeOrder.scheduleImpact,
									changeOrder.link]
		}
		
		render jsonResponse as JSON;
	}
}
