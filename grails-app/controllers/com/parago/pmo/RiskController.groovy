package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class RiskController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [riskInstanceList: Risk.list(params), riskInstanceTotal: Risk.count()]
    }

    def create() {
        [riskInstance: new Risk(params)]
    }

    def save() {
		println params
        def riskInstance = new Risk(params)
		println(params.toString());
        if (!riskInstance.save(flush: true)) {
			withFormat{
				html{ render(view: "create", model: [riskInstance: riskInstance])
					return}
				json{response.status = 500}
			}
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'risk.label', default: 'Risk'), riskInstance.id])
		withFormat{
			html{redirect(action: "show", id: riskInstance.id)}
			json{response.status = 200;render riskInstance.id as JSON}
		}
    }

    def show() {
        def riskInstance = Risk.get(params.id)
        if (!riskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect(action: "list")
            return
        }

        [riskInstance: riskInstance]
    }

    def edit() {
        def riskInstance = Risk.get(params.id)
        if (!riskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect(action: "list")
            return
        }

        [riskInstance: riskInstance]
    }

    def update() {
		withFormat{
			html{
				def riskInstance = Risk.get(params.id)
				if (!riskInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
					redirect(action: "list")
					return
				}
		
				if (params.version) {
					def version = params.version.toLong()
					if (riskInstance.version > version) {
						riskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
								  [message(code: 'risk.label', default: 'Risk')] as Object[],
								  "Another user has updated this Risk while you were editing")
						render(view: "edit", model: [riskInstance: riskInstance])
						return
					}
				}
		
				riskInstance.properties = params
		
				if (!riskInstance.save(flush: true)) {
					render(view: "edit", model: [riskInstance: riskInstance])
					return
				}
		
				flash.message = message(code: 'default.updated.message', args: [message(code: 'risk.label', default: 'Risk'), riskInstance.id])
				redirect(action: "show", id: riskInstance.id)
			}
			json{
				println params
				def riskInstance = Risk.get(params.id)
				println riskInstance
				if (!riskInstance) {
					response.status = 405;
					render "Risk ${params.id} not found";
				}
				
				if (params.version) {
					def version = params.version.toLong()
					if (riskInstance.version > version) {
						riskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
								  [message(code: 'risk.label', default: 'Risk')] as Object[],
								  "Another user has updated this Risk while you were editing")
						render(riskInstance.errors.allErrors as JSON)
					}
				}
				
				def columnId = params.columnId;
				if(columnId == 2)
					riskInstance.risk = params.value;
				else
					riskInstance.riskMigrationStrategy = params.value;
				
				if (!riskInstance.save(flush: true)) {
						response.status = 404;
						message = "an error occurred";
						render message as JSON;
				}
					
				response.status = 200;
				render params.value
			}
		}
    }

    def delete() {
		
		withFormat{
			html{
				def riskInstance = Risk.get(params.id)
				if (!riskInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
					redirect(action: "list")
					return
				}
		
				try {
					riskInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
					redirect(action: "list")
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
					redirect(action: "show", id: params.id)
				}
			}
			json{
				def riskInstance = Risk.get(params.id)
				if (!riskInstance) {
					response.status = 405;
					message = "Risk ${params.id} not found"
					render message as JSON;
				}
				
				try {
					riskInstance.delete(flush: true)
					response.status = 200;
					render "${message(code: 'default.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])}"
				}
				catch (DataIntegrityViolationException e) {
					message = message(code: 'default.not.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
					response.status = 405;
					render message as JSON;
				}
				
			}
		}
    }
	
	def dataTablesSource(){
		println params;
		def projectInfo = ProjectInfo.get(params.projectInfoId);
		println projectInfo;
		def riskList = projectInfo ? Risk.findAllByProjectInfo(projectInfo) : [];
		def jsonRiskResponse = [:]
		jsonRiskResponse.aaData=[];
		
		riskList?.each{ risk ->
			jsonRiskResponse.aaData << [risk.id,
										risk.projectInfo.id,
										risk.risk,
										risk.riskMigrationStrategy]
		}

		render jsonRiskResponse as JSON
	}
}
