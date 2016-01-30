package com.surelution.vms

import grails.plugin.springsecurity.SpringSecurityService;

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.core.context.SecurityContextHolder;

class UserController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
		//list方法将数据库中方法全部取出来，count方法返回数据库中数据记录的条数
    }

    def create() {
        [userInstance: new User(params)]
    }
	
    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'),""])
        redirect(action: "list", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            redirect(action:'list')
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def updatepassword(){
		
	}
	
	def changePassWord(){
		def newPw1 = params.newPw1
		def newPw2 = params.newPw2
		if(newPw1 != newPw2) {
			flash.message="两次输入的密码不一致，请重新操作"
			redirect(action:'list')
			return
		}
		def user = SpringSecurityService.getCurrentUser()
		user = User.findByUsername(user.username)
		if(user) {
			if(SpringSecurityService.passwordEncoder.isPasswordValid(user.password, params.password, null)) {
				user.password = newPw1
				user.save(flush:true)
				flash.message="密码修改成功"	
				redirect(action:'list')
				return
			} else {	
			flash.message="您的原始密码输入错误！"
				redirect(action:'list')
				return
			}
		}
	}
}
