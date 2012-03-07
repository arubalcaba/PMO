package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class ChangeOrderController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [changeOrderInstanceList: ChangeOrder.list(params), changeOrderInstanceTotal: ChangeOrder.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[changeOrderInstance: new ChangeOrder(params)]
			break
		case 'POST':
	        def changeOrderInstance = new ChangeOrder(params)
	        if (!changeOrderInstance.save(flush: true)) {
	            render view: 'create', model: [changeOrderInstance: changeOrderInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), changeOrderInstance.id])
	        redirect action: 'show', id: changeOrderInstance.id
			break
		}
    }

    def show() {
        def changeOrderInstance = ChangeOrder.get(params.id)
        if (!changeOrderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
            redirect action: 'list'
            return
        }

        [changeOrderInstance: changeOrderInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def changeOrderInstance = ChangeOrder.get(params.id)
	        if (!changeOrderInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [changeOrderInstance: changeOrderInstance]
			break
		case 'POST':
	        def changeOrderInstance = ChangeOrder.get(params.id)
	        if (!changeOrderInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (changeOrderInstance.version > version) {
	                changeOrderInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'changeOrder.label', default: 'ChangeOrder')] as Object[],
	                          "Another user has updated this ChangeOrder while you were editing")
	                render view: 'edit', model: [changeOrderInstance: changeOrderInstance]
	                return
	            }
	        }

	        changeOrderInstance.properties = params

	        if (!changeOrderInstance.save(flush: true)) {
	            render view: 'edit', model: [changeOrderInstance: changeOrderInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), changeOrderInstance.id])
	        redirect action: 'show', id: changeOrderInstance.id
			break
		}
    }

    def delete() {
        def changeOrderInstance = ChangeOrder.get(params.id)
        if (!changeOrderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
            redirect action: 'list'
            return
        }

        try {
            changeOrderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'changeOrder.label', default: 'ChangeOrder'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
