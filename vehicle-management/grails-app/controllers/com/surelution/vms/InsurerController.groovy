package com.surelution.vms

import org.springframework.dao.DataIntegrityViolationException

class InsurerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [insurerInstanceList: Insurer.list(params), insurerInstanceTotal: Insurer.count()]
    }

    def create() {
        [insurerInstance: new Insurer(params)]
    }

    def save() {
        def insurerInstance = new Insurer(params)
        if (!insurerInstance.save(flush: true)) {
            render(view: "create", model: [insurerInstance: insurerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'insurer.label', default: 'Insurer'), insurerInstance.id])
        redirect(action: "show", id: insurerInstance.id)
    }

    def show(Long id) {
        def insurerInstance = Insurer.get(id)
        if (!insurerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'insurer.label', default: 'Insurer'), id])
            redirect(action: "list")
            return
        }

        [insurerInstance: insurerInstance]
    }

    def edit(Long id) {
        def insurerInstance = Insurer.get(id)
        if (!insurerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'insurer.label', default: 'Insurer'), id])
            redirect(action: "list")
            return
        }

        [insurerInstance: insurerInstance]
    }

    def update(Long id, Long version) {
        def insurerInstance = Insurer.get(id)
        if (!insurerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'insurer.label', default: 'Insurer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (insurerInstance.version > version) {
                insurerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'insurer.label', default: 'Insurer')] as Object[],
                          "Another user has updated this Insurer while you were editing")
                render(view: "edit", model: [insurerInstance: insurerInstance])
                return
            }
        }

        insurerInstance.properties = params

        if (!insurerInstance.save(flush: true)) {
            render(view: "edit", model: [insurerInstance: insurerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'insurer.label', default: 'Insurer'), insurerInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def insurerInstance = Insurer.get(id)
        if (!insurerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'insurer.label', default: 'Insurer'), id])
            redirect(action: "list")
            return
        }

        try {
            insurerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'insurer.label', default: 'Insurer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'insurer.label', default: 'Insurer'), id])
            redirect(action: "show", id: id)
        }
    }
}
