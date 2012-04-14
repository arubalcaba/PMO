package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class AuditStatusController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [auditStatusInstanceList: AuditStatus.list(params), auditStatusInstanceTotal: AuditStatus.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[auditStatusInstance: new AuditStatus(params)]
			break
		case 'POST':
	        def auditStatusInstance = new AuditStatus(params)
	        if (!auditStatusInstance.save(flush: true)) {
	            render view: 'create', model: [auditStatusInstance: auditStatusInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'auditStatus.label', default: 'AuditStatus'), auditStatusInstance.id])
	        redirect action: 'show', id: auditStatusInstance.id
			break
		}
    }

    def show() {
        def auditStatusInstance = AuditStatus.get(params.id)
        if (!auditStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'auditStatus.label', default: 'AuditStatus'), params.id])
            redirect action: 'list'
            return
        }

        [auditStatusInstance: auditStatusInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def auditStatusInstance = AuditStatus.get(params.id)
	        if (!auditStatusInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auditStatus.label', default: 'AuditStatus'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [auditStatusInstance: auditStatusInstance]
			break
		case 'POST':
	        def auditStatusInstance = AuditStatus.get(params.id)
	        if (!auditStatusInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auditStatus.label', default: 'AuditStatus'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (auditStatusInstance.version > version) {
	                auditStatusInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'auditStatus.label', default: 'AuditStatus')] as Object[],
	                          "Another user has updated this AuditStatus while you were editing")
	                render view: 'edit', model: [auditStatusInstance: auditStatusInstance]
	                return
	            }
	        }

	        auditStatusInstance.properties = params

	        if (!auditStatusInstance.save(flush: true)) {
	            render view: 'edit', model: [auditStatusInstance: auditStatusInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'auditStatus.label', default: 'AuditStatus'), auditStatusInstance.id])
	        redirect action: 'show', id: auditStatusInstance.id
			break
		}
    }

    def delete() {
        def auditStatusInstance = AuditStatus.get(params.id)
        if (!auditStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'auditStatus.label', default: 'AuditStatus'), params.id])
            redirect action: 'list'
            return
        }

        try {
            auditStatusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'auditStatus.label', default: 'AuditStatus'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'auditStatus.label', default: 'AuditStatus'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
