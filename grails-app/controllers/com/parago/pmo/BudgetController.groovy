package com.parago.pmo

import org.springframework.dao.DataIntegrityViolationException

class BudgetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [budgetInstanceList: Budget.list(params), budgetInstanceTotal: Budget.count()]
    }

    def create() {
        [budgetInstance: new Budget(params)]
    }

    def save() {
        def budgetInstance = new Budget(params)
        if (!budgetInstance.save(flush: true)) {
            render(view: "create", model: [budgetInstance: budgetInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'budget.label', default: 'Budget'), budgetInstance.id])
        redirect(action: "show", id: budgetInstance.id)
    }

    def show() {
        def budgetInstance = Budget.get(params.id)
        if (!budgetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'budget.label', default: 'Budget'), params.id])
            redirect(action: "list")
            return
        }

        [budgetInstance: budgetInstance]
    }

    def edit() {
        def budgetInstance = Budget.get(params.id)
        if (!budgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'budget.label', default: 'Budget'), params.id])
            redirect(action: "list")
            return
        }

        [budgetInstance: budgetInstance]
    }

    def update() {
        def budgetInstance = Budget.get(params.id)
        if (!budgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'budget.label', default: 'Budget'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (budgetInstance.version > version) {
                budgetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'budget.label', default: 'Budget')] as Object[],
                          "Another user has updated this Budget while you were editing")
                render(view: "edit", model: [budgetInstance: budgetInstance])
                return
            }
        }

        budgetInstance.properties = params

        if (!budgetInstance.save(flush: true)) {
            render(view: "edit", model: [budgetInstance: budgetInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'budget.label', default: 'Budget'), budgetInstance.id])
        redirect(action: "show", id: budgetInstance.id)
    }

    def delete() {
        def budgetInstance = Budget.get(params.id)
        if (!budgetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'budget.label', default: 'Budget'), params.id])
            redirect(action: "list")
            return
        }

        try {
            budgetInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'budget.label', default: 'Budget'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'budget.label', default: 'Budget'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
