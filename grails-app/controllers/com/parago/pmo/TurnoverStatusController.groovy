package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class TurnoverStatusController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [turnoverStatusInstanceList: TurnoverStatus.list(params), turnoverStatusInstanceTotal: TurnoverStatus.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[turnoverStatusInstance: new TurnoverStatus(params)]
			break
		case 'POST':
	        def turnoverStatusInstance = new TurnoverStatus(params)
	        if (!turnoverStatusInstance.save(flush: true)) {
	            render view: 'create', model: [turnoverStatusInstance: turnoverStatusInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'turnoverStatus.label', default: 'TurnoverStatus'), turnoverStatusInstance.id])
	        redirect action: 'show', id: turnoverStatusInstance.id
			break
		}
    }

    def show() {
        def turnoverStatusInstance = TurnoverStatus.get(params.id)
        if (!turnoverStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'turnoverStatus.label', default: 'TurnoverStatus'), params.id])
            redirect action: 'list'
            return
        }

        [turnoverStatusInstance: turnoverStatusInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def turnoverStatusInstance = TurnoverStatus.get(params.id)
	        if (!turnoverStatusInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turnoverStatus.label', default: 'TurnoverStatus'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [turnoverStatusInstance: turnoverStatusInstance]
			break
		case 'POST':
	        def turnoverStatusInstance = TurnoverStatus.get(params.id)
	        if (!turnoverStatusInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turnoverStatus.label', default: 'TurnoverStatus'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (turnoverStatusInstance.version > version) {
	                turnoverStatusInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'turnoverStatus.label', default: 'TurnoverStatus')] as Object[],
	                          "Another user has updated this TurnoverStatus while you were editing")
	                render view: 'edit', model: [turnoverStatusInstance: turnoverStatusInstance]
	                return
	            }
	        }

	        turnoverStatusInstance.properties = params

	        if (!turnoverStatusInstance.save(flush: true)) {
	            render view: 'edit', model: [turnoverStatusInstance: turnoverStatusInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'turnoverStatus.label', default: 'TurnoverStatus'), turnoverStatusInstance.id])
	        redirect action: 'show', id: turnoverStatusInstance.id
			break
		}
    }

    def delete() {
        def turnoverStatusInstance = TurnoverStatus.get(params.id)
        if (!turnoverStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'turnoverStatus.label', default: 'TurnoverStatus'), params.id])
            redirect action: 'list'
            return
        }

        try {
            turnoverStatusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'turnoverStatus.label', default: 'TurnoverStatus'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'turnoverStatus.label', default: 'TurnoverStatus'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
