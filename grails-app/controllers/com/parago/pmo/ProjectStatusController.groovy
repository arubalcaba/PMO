package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class ProjectStatusController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [projectStatusInstanceList: ProjectStatus.list(params), projectStatusInstanceTotal: ProjectStatus.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[projectStatusInstance: new ProjectStatus(params)]
			break
		case 'POST':
	        def projectStatusInstance = new ProjectStatus(params)
	        if (!projectStatusInstance.save(flush: true)) {
	            render view: 'create', model: [projectStatusInstance: projectStatusInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), projectStatusInstance.id])
	        redirect action: 'show', id: projectStatusInstance.id
			break
		}
    }

    def show() {
        def projectStatusInstance = ProjectStatus.get(params.id)
        if (!projectStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), params.id])
            redirect action: 'list'
            return
        }

        [projectStatusInstance: projectStatusInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def projectStatusInstance = ProjectStatus.get(params.id)
	        if (!projectStatusInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [projectStatusInstance: projectStatusInstance]
			break
		case 'POST':
	        def projectStatusInstance = ProjectStatus.get(params.id)
	        if (!projectStatusInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (projectStatusInstance.version > version) {
	                projectStatusInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'projectStatus.label', default: 'ProjectStatus')] as Object[],
	                          "Another user has updated this ProjectStatus while you were editing")
	                render view: 'edit', model: [projectStatusInstance: projectStatusInstance]
	                return
	            }
	        }

	        projectStatusInstance.properties = params

	        if (!projectStatusInstance.save(flush: true)) {
	            render view: 'edit', model: [projectStatusInstance: projectStatusInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), projectStatusInstance.id])
	        redirect action: 'show', id: projectStatusInstance.id
			break
		}
    }

    def delete() {
        def projectStatusInstance = ProjectStatus.get(params.id)
        if (!projectStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), params.id])
            redirect action: 'list'
            return
        }

        try {
            projectStatusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
