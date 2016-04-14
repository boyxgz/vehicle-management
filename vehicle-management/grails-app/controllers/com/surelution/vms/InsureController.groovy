package com.surelution.vms


import org.springframework.dao.DataIntegrityViolationException

class InsureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max,String id) {
        params.max = Math.min(max ?: 10, 100)
		def insure = Insure.createCriteria().list {
			lt("expiredAt",new Date())
		}
		
		insure.each {
			it.states = Insure.InsureState.EXPIRE
		}
		println id
		def states = id != null?Insure.InsureState.valueOf(id):Insure.InsureState.EVER;
		def insureInstanceList
		
		if(states == Insure.InsureState.EVER){
			insureInstanceList = Insure.list()
		}else{
			insureInstanceList = Insure.createCriteria().list{
				eq("states",states)
			}
		}
//		if(Insure.InsureState.VALID.toString(id) == id){
//			insureInstanceList = Insure.createCriteria().list{
//				println eq("states",Insure.InsureState.VALID)
//			}
//			states = Insure.InsureState.VALID
//		}else if(Insure.InsureState.EXPIRE.toString(id) == id){
//			insureInstanceList = Insure.createCriteria().list{
//				eq("states",Insure.InsureState.EXPIRE)
//			}
//			states = Insure.InsureState.EXPIRE
//		}else{
//			insureInstanceList = Insure.list()
//			states = Insure.InsureState.EVER
//		}
        [insureInstanceList: insureInstanceList, insureInstanceTotal: Insure.count(),states:states]
    }
	

    def create() {
        [insureInstance: new Insure(params)]
    }

    def save() {
        def insureInstance = new Insure()
		insureInstance.vehicle = Vehicle.get(params.int("vehicle"))
		insureInstance.insurer = Insurer.get(params.int("insurer"))
		insureInstance.insureMan = params.insureMan
		insureInstance.insureMoney = params.double("insureMoney")
		insureInstance.insureType = params.insureType
		insureInstance.firstInsure = (params.firstInsure == 1 ? false : true)
		println insureInstance.firstInsure
		insureInstance.insureContractNo = params.insureContractNo
		insureInstance.effectivedAt = params.date("effectivedAt","yyyy.MM.dd")
		insureInstance.expiredAt = params.date("expiredAt","yyyy.MM.dd")
		insureInstance.insuredAt = params.date("insuredAt","yyyy.MM.dd")
		insureInstance.detail = params.detail
        if (!insureInstance.save(flush: true)) {
            render(view: "create", model: [insureInstance: insureInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'insure.label', default: 'Insure'), insureInstance.id])
        redirect(action: "show", id: insureInstance.id)
    }

    def show(Long id) {
        def insureInstance = Insure.get(id)
        if (!insureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'insure.label', default: 'Insure'), id])
            redirect(action: "list")
            return
        }

        [insureInstance: insureInstance]
    }

    def edit(Long id) {
        def insureInstance = Insure.get(id)
        if (!insureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'insure.label', default: 'Insure'), id])
            redirect(action: "list")
            return
        }

        [insureInstance: insureInstance]
    }

    def update(Long id, Long version) {
        def insureInstance = Insure.get(id)
        if (!insureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'insure.label', default: 'Insure'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (insureInstance.version > version) {
                insureInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'insure.label', default: 'Insure')] as Object[],
                          "Another user has updated this Insure while you were editing")
                render(view: "edit", model: [insureInstance: insureInstance])
                return
            }
        }

        insureInstance.properties = params

        if (!insureInstance.save(flush: true)) {
            render(view: "edit", model: [insureInstance: insureInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'insure.label', default: 'Insure'), insureInstance.id])
        redirect(action: "show", id: insureInstance.id)
    }

    def delete(Long id) {
        def insureInstance = Insure.get(id)
        if (!insureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'insure.label', default: 'Insure'), id])
            redirect(action: "list")
            return
        }

        try {
            insureInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'insure.label', default: 'Insure'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'insure.label', default: 'Insure'), id])
            redirect(action: "show", id: id)
        }
    }
}
