package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class ProjectMilestoneController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [projectMilestoneInstanceList: ProjectMilestone.list(params), projectMilestoneInstanceTotal: ProjectMilestone.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[projectMilestoneInstance: new ProjectMilestone(params)]
			break
		case 'POST':
	        def projectMilestoneInstance = new ProjectMilestone(params)
	        if (!projectMilestoneInstance.save(flush: true)) {
	            render view: 'create', model: [projectMilestoneInstance: projectMilestoneInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), projectMilestoneInstance.id])
	        redirect action: 'show', id: projectMilestoneInstance.id
			break
		}
    }

    def show() {
        def projectMilestoneInstance = ProjectMilestone.get(params.id)
        if (!projectMilestoneInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), params.id])
            redirect action: 'list'
            return
        }

        [projectMilestoneInstance: projectMilestoneInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def projectMilestoneInstance = ProjectMilestone.get(params.id)
	        if (!projectMilestoneInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [projectMilestoneInstance: projectMilestoneInstance]
			break
		case 'POST':
	        def projectMilestoneInstance = ProjectMilestone.get(params.id)
	        if (!projectMilestoneInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (projectMilestoneInstance.version > version) {
	                projectMilestoneInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'projectMilestone.label', default: 'ProjectMilestone')] as Object[],
	                          "Another user has updated this ProjectMilestone while you were editing")
	                render view: 'edit', model: [projectMilestoneInstance: projectMilestoneInstance]
	                return
	            }
	        }

	        projectMilestoneInstance.properties = params

	        if (!projectMilestoneInstance.save(flush: true)) {
	            render view: 'edit', model: [projectMilestoneInstance: projectMilestoneInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), projectMilestoneInstance.id])
	        redirect action: 'show', id: projectMilestoneInstance.id
			break
		}
    }

    def delete() {
        def projectMilestoneInstance = ProjectMilestone.get(params.id)
        if (!projectMilestoneInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), params.id])
            redirect action: 'list'
            return
        }

        try {
            projectMilestoneInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
