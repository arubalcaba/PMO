package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class ProjectInfoController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [projectInfoInstanceList: ProjectInfo.list(params), projectInfoInstanceTotal: ProjectInfo.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[projectInfoInstance: new ProjectInfo(params)]
			break
		case 'POST':
	        def projectInfoInstance = new ProjectInfo(params)
	        if (!projectInfoInstance.save(flush: true)) {
	            render view: 'create', model: [projectInfoInstance: projectInfoInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'projectInfo.label', default: 'ProjectInfo'), projectInfoInstance.id])
	        redirect action: 'show', id: projectInfoInstance.id
			break
		}
    }

    def show() {
        def projectInfoInstance = ProjectInfo.get(params.id)
        if (!projectInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInfo.label', default: 'ProjectInfo'), params.id])
            redirect action: 'list'
            return
        }

        [projectInfoInstance: projectInfoInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def projectInfoInstance = ProjectInfo.get(params.id)
	        if (!projectInfoInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInfo.label', default: 'ProjectInfo'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [projectInfoInstance: projectInfoInstance]
			break
		case 'POST':
		    print params;
	        def projectInfoInstance = ProjectInfo.get(params.id)
	        if (!projectInfoInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInfo.label', default: 'ProjectInfo'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (projectInfoInstance.version > version) {
	                projectInfoInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'projectInfo.label', default: 'ProjectInfo')] as Object[],
	                          "Another user has updated this ProjectInfo while you were editing")
	                render view: 'edit', model: [projectInfoInstance: projectInfoInstance]
	                return
	            }
	        }
	        projectInfoInstance.properties = params	
			print params?.plannedReleaseDate	
			
			if(params?.plannedReleaseDate)
			{
				
				projectInfoInstance?.plannedReleaseDate=Date.parse("MM/dd/yyyy",params?.plannedReleaseDate);
				print projectInfoInstance?.plannedReleaseDate;
				projectInfoInstance.clearErrors();
			}
			
			
			

	        if (!projectInfoInstance.save(flush: true)) {
	            render view: 'edit', model: [projectInfoInstance: projectInfoInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'projectInfo.label', default: 'Project: '), projectInfoInstance.projectName])
	        redirect action: 'show', id: projectInfoInstance.id
			break
		}
    }

    def delete() {
        def projectInfoInstance = ProjectInfo.get(params.id)
        if (!projectInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInfo.label', default: 'ProjectInfo'), params.id])
            redirect action: 'list'
            return
        }

        try {
            projectInfoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectInfo.label', default: 'ProjectInfo'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectInfo.label', default: 'ProjectInfo'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
