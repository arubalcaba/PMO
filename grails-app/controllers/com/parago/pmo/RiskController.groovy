package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class RiskController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [riskInstanceList: Risk.list(params), riskInstanceTotal: Risk.count()]
    }

    def create() {
        [riskInstance: new Risk(params)]
    }

    def save() {
        def riskInstance = new Risk(params)
        if (!riskInstance.save(flush: true)) {
            render(view: "create", model: [riskInstance: riskInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'risk.label', default: 'Risk'), riskInstance.id])
        redirect(action: "show", id: riskInstance.id)
    }

    def show() {
        def riskInstance = Risk.get(params.id)
        if (!riskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect(action: "list")
            return
        }

        [riskInstance: riskInstance]
    }

    def edit() {
        def riskInstance = Risk.get(params.id)
        if (!riskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect(action: "list")
            return
        }

        [riskInstance: riskInstance]
    }

    def update() {
        def riskInstance = Risk.get(params.id)
        if (!riskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (riskInstance.version > version) {
                riskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'risk.label', default: 'Risk')] as Object[],
                          "Another user has updated this Risk while you were editing")
                render(view: "edit", model: [riskInstance: riskInstance])
                return
            }
        }

        riskInstance.properties = params

        if (!riskInstance.save(flush: true)) {
            render(view: "edit", model: [riskInstance: riskInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'risk.label', default: 'Risk'), riskInstance.id])
        redirect(action: "show", id: riskInstance.id)
    }

    def delete() {
        def riskInstance = Risk.get(params.id)
        if (!riskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect(action: "list")
            return
        }

        try {
            riskInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'risk.label', default: 'Risk'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
