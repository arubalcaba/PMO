package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class ImpedimentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [impedimentInstanceList: Impediment.list(params), impedimentInstanceTotal: Impediment.count()]
    }

    def create() {
        [impedimentInstance: new Impediment(params)]
    }

    def save() {
        def impedimentInstance = new Impediment(params)
        if (!impedimentInstance.save(flush: true)) {
            render(view: "create", model: [impedimentInstance: impedimentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'impediment.label', default: 'Impediment'), impedimentInstance.id])
        redirect(action: "show", id: impedimentInstance.id)
    }

    def show() {
        def impedimentInstance = Impediment.get(params.id)
        if (!impedimentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
            redirect(action: "list")
            return
        }

        [impedimentInstance: impedimentInstance]
    }

    def edit() {
        def impedimentInstance = Impediment.get(params.id)
        if (!impedimentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
            redirect(action: "list")
            return
        }

        [impedimentInstance: impedimentInstance]
    }

    def update() {
        def impedimentInstance = Impediment.get(params.id)
        if (!impedimentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (impedimentInstance.version > version) {
                impedimentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'impediment.label', default: 'Impediment')] as Object[],
                          "Another user has updated this Impediment while you were editing")
                render(view: "edit", model: [impedimentInstance: impedimentInstance])
                return
            }
        }

        impedimentInstance.properties = params

        if (!impedimentInstance.save(flush: true)) {
            render(view: "edit", model: [impedimentInstance: impedimentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'impediment.label', default: 'Impediment'), impedimentInstance.id])
        redirect(action: "show", id: impedimentInstance.id)
    }

    def delete() {
        def impedimentInstance = Impediment.get(params.id)
        if (!impedimentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            impedimentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'impediment.label', default: 'Impediment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
