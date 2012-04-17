package com.parago.pmo

import grails.converters.JSON

import org.springframework.dao.DataIntegrityViolationException

class MilestoneController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [milestoneInstanceList: Milestone.list(params), milestoneInstanceTotal: Milestone.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[milestoneInstance: new Milestone(params)]
			break
		case 'POST':
	        def milestoneInstance = new Milestone(params)
	        if (!milestoneInstance.save(flush: true)) {
	            render view: 'create', model: [milestoneInstance: milestoneInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'milestone.label', default: 'Milestone'), milestoneInstance.id])
	        redirect action: 'show', id: milestoneInstance.id
			break
		}
    }

    def show() {
        def milestoneInstance = Milestone.get(params.id)
        if (!milestoneInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestone.label', default: 'Milestone'), params.id])
            redirect action: 'list'
            return
        }

        [milestoneInstance: milestoneInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def milestoneInstance = Milestone.get(params.id)
	        if (!milestoneInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestone.label', default: 'Milestone'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [milestoneInstance: milestoneInstance]
			break
		case 'POST':
	        def milestoneInstance = Milestone.get(params.id)
	        if (!milestoneInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestone.label', default: 'Milestone'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (milestoneInstance.version > version) {
	                milestoneInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'milestone.label', default: 'Milestone')] as Object[],
	                          "Another user has updated this Milestone while you were editing")
	                render view: 'edit', model: [milestoneInstance: milestoneInstance]
	                return
	            }
	        }

	        milestoneInstance.properties = params

	        if (!milestoneInstance.save(flush: true)) {
	            render view: 'edit', model: [milestoneInstance: milestoneInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'milestone.label', default: 'Milestone'), milestoneInstance.id])
	        redirect action: 'show', id: milestoneInstance.id
			break
		}
    }

    def delete() {
        def milestoneInstance = Milestone.get(params.id)
        if (!milestoneInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestone.label', default: 'Milestone'), params.id])
            redirect action: 'list'
            return
        }

        try {
            milestoneInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'milestone.label', default: 'Milestone'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'milestone.label', default: 'Milestone'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	def listjson(){
		
		def milestoneList = Milestone.getAll();
	
		def jsonResponse = [:];
			jsonResponse.put(" "," ");
			
			milestoneList ?.each{ milestone ->
				jsonResponse.put(milestone.id,milestone.milestone);
			}
			print jsonResponse as JSON
			String str= jsonResponse as JSON;
			str=str.replaceAll("\"","'");
			print str;
			render str;

}
	def selectjson(){
		
		def milestoneList = Milestone.getAll();
		def jsonResponse = [:];
			jsonResponse.option=[];
			milestoneList?.each{ milestone ->
				jsonResponse.option <<[milestone.id,milestone.milestone]

					}
			print jsonResponse as JSON
			render jsonResponse as JSON;
}
}
