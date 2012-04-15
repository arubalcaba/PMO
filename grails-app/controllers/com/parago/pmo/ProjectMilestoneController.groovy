package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

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
	        def projectMilestoneInstance = new ProjectMilestone();
			projectMilestoneInstance.properties['name','complete','note'] = params;
			projectMilestoneInstance.date = Date.parse('MM/dd/yyyy',params.date);
	        if (!projectMilestoneInstance.save(flush: true)) {
	            render view: 'create', model: [projectMilestoneInstance: projectMilestoneInstance]
	            return
	        }
			withFormat{
				html{
					flash.message = message(code: 'default.created.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), projectMilestoneInstance.id])
					redirect action: 'show', id: projectMilestoneInstance.id
				}
				json{
					response.status = 200; render text:projectMilestoneInstance.id;
				}
			}
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
			withFormat{
				html{
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
		
					projectMilestoneInstance.properties['name','complete','note'] = params;
					projectMilestoneInstance.date = Date.parse('MM/dd/yyyy',params.date);
		
					if (!projectMilestoneInstance.save(flush: true)) {
						render view: 'edit', model: [projectMilestoneInstance: projectMilestoneInstance]
						return
					}
		
					flash.message = message(code: 'default.updated.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), projectMilestoneInstance.id])
					redirect action: 'show', id: projectMilestoneInstance.id
				}
				json{
					def projectMilestoneInstance = ProjectMilestone.get(params.id)
					if (!projectMilestoneInstance) {
						response.status = 405;
						render "Project Milestone ${params.id} not found";
					}
					if (params.version) {
						def version = params.version.toLong()
						if (projectMilestoneInstance.version > version) {
							projectMilestoneInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
									  [message(code: 'projectMilestone.label', default: 'ProjectMilestone')] as Object[],
									  "Another user has updated this ProjectMilestone while you were editing")
							render projectMilestoneInstance.errors.allErrors as JSON;
						}
					}
					
					def columnId = params.columnId;
					if(columnId == 2)
						projectMilestoneInstance.name = params.value;
					else if(columnId == 3)
						projectMilestoneInstance.complete = params.value;
					else if(columnId ==4)
						projectMilestoneInstance.date = Date.parse('MM/dd/yyyy',params.value);
					else
						projectMilestoneInstance.note = params.value;
					
					if (!projectMilestoneInstance.save(flush: true)) {
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
			json{
				def projectMilestoneInstance = ProjectMilestone.get(params.id)
				if (!projectMilestoneInstance) {
					response.status = 405;
					render "Project Milestone ${params.id} not found";
				}
				try {
					projectMilestoneInstance.delete(flush: true)
					response.status = 200;
					render text:"ok";
				}
				catch (DataIntegrityViolationException e) {
					message = message(code: 'default.not.deleted.message', args: [message(code: 'projectMilestone.label', default: 'ProjectMilestone'), params.id])
					response.status = 405;
					render message as JSON;
				}
			}
		}
    }
	
	def dataTablesSource(){
		def projectInfo = ProjectInfo.get(params.projectInfoId);
		def projectMilestoneList = projectInfo ? ProjectMilestone.findAllByProjectInfo(projectInfo):[];
		def jsonResponse = [:];
		jsonResponse.aaData=[];
		
		projectMilestoneList?.each{ projectMilestone ->
			jsonResponse.aaData << [projectMilestone.id,
									projectMilestone.projectInfo.id,
									projectMilestone.name,
									projectMilestone.complete?'yes':'no',
									projectMilestone.date.format('MM/dd/yyyy'),
									projectMilestone.note]
		}
		
		render jsonResponse as JSON;
	}
}
