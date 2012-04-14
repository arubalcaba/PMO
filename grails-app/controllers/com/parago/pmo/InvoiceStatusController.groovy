package com.parago.pmo
import grails.converters.JSON



import org.springframework.dao.DataIntegrityViolationException

class InvoiceStatusController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceStatusInstanceList: InvoiceStatus.list(params), invoiceStatusInstanceTotal: InvoiceStatus.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[invoiceStatusInstance: new InvoiceStatus(params)]
			break
		case 'POST':
	        def invoiceStatusInstance = new InvoiceStatus(params)
	        if (!invoiceStatusInstance.save(flush: true)) {
	            render view: 'create', model: [invoiceStatusInstance: invoiceStatusInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), invoiceStatusInstance.id])
	        redirect action: 'show', id: invoiceStatusInstance.id
			break
		}
    }

    def show() {
        def invoiceStatusInstance = InvoiceStatus.get(params.id)
        if (!invoiceStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])
            redirect action: 'list'
            return
        }

        [invoiceStatusInstance: invoiceStatusInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def invoiceStatusInstance = InvoiceStatus.get(params.id)
	        if (!invoiceStatusInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [invoiceStatusInstance: invoiceStatusInstance]
			break
		case 'POST':
	        def invoiceStatusInstance = InvoiceStatus.get(params.id)
	        if (!invoiceStatusInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (invoiceStatusInstance.version > version) {
	                invoiceStatusInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'invoiceStatus.label', default: 'InvoiceStatus')] as Object[],
	                          "Another user has updated this InvoiceStatus while you were editing")
	                render view: 'edit', model: [invoiceStatusInstance: invoiceStatusInstance]
	                return
	            }
	        }

	        invoiceStatusInstance.properties = params

	        if (!invoiceStatusInstance.save(flush: true)) {
	            render view: 'edit', model: [invoiceStatusInstance: invoiceStatusInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), invoiceStatusInstance.id])
	        redirect action: 'show', id: invoiceStatusInstance.id
			break
		}
    }

    def delete() {
        def invoiceStatusInstance = InvoiceStatus.get(params.id)
        if (!invoiceStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])
            redirect action: 'list'
            return
        }

        try {
            invoiceStatusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	
	def listjson(){
		
		def invoiceStatusList = InvoiceStatus.getAll();
		def jsonResponse = [:];
		    jsonResponse.put("","");
			
			invoiceStatusList?.each{ status ->
				jsonResponse.put(status.id,status.status);
			}
			print jsonResponse as JSON
			render jsonResponse as JSON;

}
}
