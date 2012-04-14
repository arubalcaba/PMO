package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

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
	        def projectInvoiceInstance = new ProjectInvoice(params)
	        if (!projectInvoiceInstance.save(flush: true)) {
	            render view: 'create', model: [projectInvoiceInstance: projectInvoiceInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'projectInvoice.label', default: 'ProjectInvoice'), projectInvoiceInstance.id])
	        redirect action: 'show', id: projectInvoiceInstance.id
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
			break
		}
    }

    def delete() {
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
}
