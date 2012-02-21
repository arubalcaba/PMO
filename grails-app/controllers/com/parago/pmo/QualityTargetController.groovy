package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class QualityTargetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [qualityTargetInstanceList: QualityTarget.list(params), qualityTargetInstanceTotal: QualityTarget.count()]
    }

    def create() {
        [qualityTargetInstance: new QualityTarget(params)]
    }

    def save() {
        def qualityTargetInstance = new QualityTarget(params)
        if (!qualityTargetInstance.save(flush: true)) {
            render(view: "create", model: [qualityTargetInstance: qualityTargetInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), qualityTargetInstance.id])
        redirect(action: "show", id: qualityTargetInstance.id)
    }

    def show() {
        def qualityTargetInstance = QualityTarget.get(params.id)
        if (!qualityTargetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
            redirect(action: "list")
            return
        }

        [qualityTargetInstance: qualityTargetInstance]
    }

    def edit() {
        def qualityTargetInstance = QualityTarget.get(params.id)
        if (!qualityTargetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
            redirect(action: "list")
            return
        }

        [qualityTargetInstance: qualityTargetInstance]
    }

    def update() {
        def qualityTargetInstance = QualityTarget.get(params.id)
        if (!qualityTargetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (qualityTargetInstance.version > version) {
                qualityTargetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'qualityTarget.label', default: 'QualityTarget')] as Object[],
                          "Another user has updated this QualityTarget while you were editing")
                render(view: "edit", model: [qualityTargetInstance: qualityTargetInstance])
                return
            }
        }

        qualityTargetInstance.properties = params

        if (!qualityTargetInstance.save(flush: true)) {
            render(view: "edit", model: [qualityTargetInstance: qualityTargetInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), qualityTargetInstance.id])
        redirect(action: "show", id: qualityTargetInstance.id)
    }

    def delete() {
        def qualityTargetInstance = QualityTarget.get(params.id)
        if (!qualityTargetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
            redirect(action: "list")
            return
        }

        try {
            qualityTargetInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'qualityTarget.label', default: 'QualityTarget'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
