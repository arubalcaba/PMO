package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class RiskController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [riskInstanceList: Risk.list(params), riskInstanceTotal: Risk.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[riskInstance: new Risk(params)]
			break
		case 'POST':
	        def riskInstance = new Risk(params)
	        if (!riskInstance.save(flush: true)) {
	            render view: 'create', model: [riskInstance: riskInstance]
	            return
	        }
			withFormat{
				html{
					flash.message = message(code: 'default.created.message', args: [message(code: 'risk.label', default: 'Risk'), riskInstance.id])
					redirect action: 'show', id: riskInstance.id
				}
				json{
					response.status = 200;render text: riskInstance.id
				}
			}
			break
		}
    }

    def show() {
        def riskInstance = Risk.get(params.id)
        if (!riskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect action: 'list'
            return
        }

        [riskInstance: riskInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def riskInstance = Risk.get(params.id)
	        if (!riskInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [riskInstance: riskInstance]
			break
		case 'POST':
			withFormat{
				html{
					def riskInstance = Risk.get(params.id)
					if (!riskInstance) {
						flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
						redirect action: 'list'
						return
					}
		
					if (params.version) {
						def version = params.version.toLong()
						if (riskInstance.version > version) {
							riskInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
									  [message(code: 'risk.label', default: 'Risk')] as Object[],
									  "Another user has updated this Risk while you were editing")
							render view: 'edit', model: [riskInstance: riskInstance]
							return
						}
					}
		
					riskInstance.properties = params
		
					if (!riskInstance.save(flush: true)) {
						render view: 'edit', model: [riskInstance: riskInstance]
						return
					}
		
					flash.message = message(code: 'default.updated.message', args: [message(code: 'risk.label', default: 'Risk'), riskInstance.id])
					redirect action: 'show', id: riskInstance.id
				}
				json{
					def riskInstance = Risk.get(params.id)
					if (!riskInstance) {
						response.status = 405;
						render "Risk ${params.id} not found";
					}
		
					if (params.version) {
						def version = params.version.toLong()
						if (riskInstance.version > version) {
							riskInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
									  [message(code: 'risk.label', default: 'Risk')] as Object[],
									  "Another user has updated this Risk while you were editing")
							render riskInstance.errors.allErrors as JSON
						}
					}
		
					def columnId = params.columnId;
					if(columnId == 2)
						riskInstance.risk = params.value;
					else
						riskInstance.riskMigrationStrategy = params.value;
		
					if (!riskInstance.save(flush: true)) {
						response.status = 405;
						render "Risk could not be saved" as JSON
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
				def riskInstance = Risk.get(params.id)
				if (!riskInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
					redirect action: 'list'
					return
				}
		
				try {
					riskInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
					redirect action: 'list'
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
					redirect action: 'show', id: params.id
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
					render text:"ok";
				}
				catch (DataIntegrityViolationException e) {
					response.status = 405;
					render "{message(code: 'default.not.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])}" as JSON;
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
