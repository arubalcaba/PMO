package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class ScheduleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [scheduleInstanceList: Schedule.list(params), scheduleInstanceTotal: Schedule.count()]
    }

    def create() {
        [scheduleInstance: new Schedule(params)]
    }

    def save() {
        def scheduleInstance = new Schedule(params)
        if (!scheduleInstance.save(flush: true)) {
            render(view: "create", model: [scheduleInstance: scheduleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'schedule.label', default: 'Schedule'), scheduleInstance.id])
        redirect(action: "show", id: scheduleInstance.id)
    }

    def show() {
        def scheduleInstance = Schedule.get(params.id)
        if (!scheduleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'schedule.label', default: 'Schedule'), params.id])
            redirect(action: "list")
            return
        }

        [scheduleInstance: scheduleInstance]
    }

    def edit() {
        def scheduleInstance = Schedule.get(params.id)
        if (!scheduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schedule.label', default: 'Schedule'), params.id])
            redirect(action: "list")
            return
        }

        [scheduleInstance: scheduleInstance]
    }

    def update() {
        def scheduleInstance = Schedule.get(params.id)
        if (!scheduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schedule.label', default: 'Schedule'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (scheduleInstance.version > version) {
                scheduleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'schedule.label', default: 'Schedule')] as Object[],
                          "Another user has updated this Schedule while you were editing")
                render(view: "edit", model: [scheduleInstance: scheduleInstance])
                return
            }
        }

        scheduleInstance.properties = params

        if (!scheduleInstance.save(flush: true)) {
            render(view: "edit", model: [scheduleInstance: scheduleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'schedule.label', default: 'Schedule'), scheduleInstance.id])
        redirect(action: "show", id: scheduleInstance.id)
    }

    def delete() {
        def scheduleInstance = Schedule.get(params.id)
        if (!scheduleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'schedule.label', default: 'Schedule'), params.id])
            redirect(action: "list")
            return
        }

        try {
            scheduleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'schedule.label', default: 'Schedule'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'schedule.label', default: 'Schedule'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
