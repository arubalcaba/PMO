package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ImpedimentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [impedimentInstanceList: Impediment.list(params), impedimentInstanceTotal: Impediment.count()]
    }

    def create() {
        [impedimentInstance: new Impediment(params)]
    }

    def save() {
        def impedimentInstance = new Impediment(params)
        if (!impedimentInstance.save(flush: true)) {
            render(view: "create", model: [impedimentInstance: impedimentInstance])
            return
        }

		withFormat{
			html{
				flash.message = message(code: 'default.created.message', args: [message(code: 'impediment.label', default: 'Impediment'), impedimentInstance.id])
				redirect(action: "show", id: impedimentInstance.id)
			}
			json{
				response.status = 200;render text:impedimentInstance.id
			}
		}
		
    }

    def show() {
        def impedimentInstance = Impediment.get(params.id)
        if (!impedimentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
            redirect(action: "list")
            return
        }

        [impedimentInstance: impedimentInstance]
    }

    def edit() {
        def impedimentInstance = Impediment.get(params.id)
        if (!impedimentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
            redirect(action: "list")
            return
        }

        [impedimentInstance: impedimentInstance]
    }

    def update() {
		withFormat{
			html{
				def impedimentInstance = Impediment.get(params.id)
				if (!impedimentInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
					redirect(action: "list")
					return
				}
		
				if (params.version) {
					def version = params.version.toLong()
					if (impedimentInstance.version > version) {
						impedimentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
								  [message(code: 'impediment.label', default: 'Impediment')] as Object[],
								  "Another user has updated this Impediment while you were editing")
						render(view: "edit", model: [impedimentInstance: impedimentInstance])
						return
					}
				}
		
				impedimentInstance.properties = params
		
				if (!impedimentInstance.save(flush: true)) {
					render(view: "edit", model: [impedimentInstance: impedimentInstance])
					return
				}
		
				flash.message = message(code: 'default.updated.message', args: [message(code: 'impediment.label', default: 'Impediment'), impedimentInstance.id])
				redirect(action: "show", id: impedimentInstance.id)
			}
			json{
				def impedimentInstance = Impediment.get(params.id)
				if (!impedimentInstance) {
					response.status = 405;
					render "Impediment ${params.id} not found"
				}
		
				if (params.version) {
					def version = params.version.toLong()
					if (impedimentInstance.version > version) {
						impedimentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
								  [message(code: 'impediment.label', default: 'Impediment')] as Object[],
								  "Another user has updated this Impediment while you were editing")
						render impedimentInstance.errors.allErrors as JSON;
					}
				}
				def columnId = params.columnId;
				if(columnId == 2)
					impedimentInstance.impediment = params.value
				else
					impedimentInstance.remediationPlan = params.value 
				
					if (!impedimentInstance.save(flush: true)) {
						response.status = 404;
							message = "an error occurred";
							render message as JSON;
					}
				response.status = 200;
				render text:params.value
			}
			
		}
       
    }

    def delete() {
		withFormat{
			html{
				def impedimentInstance = Impediment.get(params.id)
				if (!impedimentInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
					redirect(action: "list")
					return
				}
		
				try {
					impedimentInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
					redirect(action: "list")
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
					redirect(action: "show", id: params.id)
				}
			}
			json{
				def impedimentInstance = Impediment.get(params.id)
				if (!impedimentInstance) {
					response.status = 405;
					render "Impediment ${params.id} not found"
				}
		
				try {
					impedimentInstance.delete(flush: true)
					response.status = 200;
					render text:"ok";
				}
				catch (DataIntegrityViolationException e) {
					response.status = 405;
					render "${message(code: 'default.not.deleted.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])}"
				}
			}
		}
    }
	def dataTablesSource(){
		def projectInfo = ProjectInfo.get(params.projectInfoId);
		def impedimentList = projectInfo ? Impediment.findAllByProjectInfo(projectInfo):[];
		def jsonResponse = [:];
		jsonResponse.aaData=[];
		
		impedimentList.each {impediment -> 
			jsonResponse.aaData << [
									impediment.id,
									impediment.projectInfo.id,
									impediment.impediment,
									impediment.remediationPlan]
				
		}
		render jsonResponse as JSON;
	}
}
