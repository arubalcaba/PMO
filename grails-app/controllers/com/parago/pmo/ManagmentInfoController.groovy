package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class ManagmentInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [managmentInfoInstanceList: ManagmentInfo.list(params), managmentInfoInstanceTotal: ManagmentInfo.count()]
    }

    def create() {
        [managmentInfoInstance: new ManagmentInfo(params)]
    }

    def save() {
        def managmentInfoInstance = new ManagmentInfo(params)
        if (!managmentInfoInstance.save(flush: true)) {
            render(view: "create", model: [managmentInfoInstance: managmentInfoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'managmentInfo.label', default: 'ManagmentInfo'), managmentInfoInstance.id])
        redirect(action: "show", id: managmentInfoInstance.id)
    }

    def show() {
        def managmentInfoInstance = ManagmentInfo.get(params.id)
        if (!managmentInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'managmentInfo.label', default: 'ManagmentInfo'), params.id])
            redirect(action: "list")
            return
        }

        [managmentInfoInstance: managmentInfoInstance]
    }

    def edit() {
        def managmentInfoInstance = ManagmentInfo.get(params.id)
        if (!managmentInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managmentInfo.label', default: 'ManagmentInfo'), params.id])
            redirect(action: "list")
            return
        }

        [managmentInfoInstance: managmentInfoInstance]
    }

    def update() {
        def managmentInfoInstance = ManagmentInfo.get(params.id)
        if (!managmentInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managmentInfo.label', default: 'ManagmentInfo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (managmentInfoInstance.version > version) {
                managmentInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'managmentInfo.label', default: 'ManagmentInfo')] as Object[],
                          "Another user has updated this ManagmentInfo while you were editing")
                render(view: "edit", model: [managmentInfoInstance: managmentInfoInstance])
                return
            }
        }

        managmentInfoInstance.properties = params

        if (!managmentInfoInstance.save(flush: true)) {
            render(view: "edit", model: [managmentInfoInstance: managmentInfoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'managmentInfo.label', default: 'ManagmentInfo'), managmentInfoInstance.id])
        redirect(action: "show", id: managmentInfoInstance.id)
    }

    def delete() {
        def managmentInfoInstance = ManagmentInfo.get(params.id)
        if (!managmentInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'managmentInfo.label', default: 'ManagmentInfo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            managmentInfoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'managmentInfo.label', default: 'ManagmentInfo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'managmentInfo.label', default: 'ManagmentInfo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
