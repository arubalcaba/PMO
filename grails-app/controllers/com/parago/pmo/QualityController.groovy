package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class QualityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [qualityInstanceList: Quality.list(params), qualityInstanceTotal: Quality.count()]
    }

    def create() {
        [qualityInstance: new Quality(params)]
    }

    def save() {
        def qualityInstance = new Quality(params)
        if (!qualityInstance.save(flush: true)) {
            render(view: "create", model: [qualityInstance: qualityInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'quality.label', default: 'Quality'), qualityInstance.id])
        redirect(action: "show", id: qualityInstance.id)
    }

    def show() {
        def qualityInstance = Quality.get(params.id)
        if (!qualityInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'quality.label', default: 'Quality'), params.id])
            redirect(action: "list")
            return
        }

        [qualityInstance: qualityInstance]
    }

    def edit() {
        def qualityInstance = Quality.get(params.id)
        if (!qualityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'quality.label', default: 'Quality'), params.id])
            redirect(action: "list")
            return
        }

        [qualityInstance: qualityInstance]
    }

    def update() {
        def qualityInstance = Quality.get(params.id)
        if (!qualityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'quality.label', default: 'Quality'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (qualityInstance.version > version) {
                qualityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'quality.label', default: 'Quality')] as Object[],
                          "Another user has updated this Quality while you were editing")
                render(view: "edit", model: [qualityInstance: qualityInstance])
                return
            }
        }

        qualityInstance.properties = params

        if (!qualityInstance.save(flush: true)) {
            render(view: "edit", model: [qualityInstance: qualityInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'quality.label', default: 'Quality'), qualityInstance.id])
        redirect(action: "show", id: qualityInstance.id)
    }

    def delete() {
        def qualityInstance = Quality.get(params.id)
        if (!qualityInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'quality.label', default: 'Quality'), params.id])
            redirect(action: "list")
            return
        }

        try {
            qualityInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'quality.label', default: 'Quality'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'quality.label', default: 'Quality'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
