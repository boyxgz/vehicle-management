package com.surelution.vms

/**
 * 保险公司
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class Insurer {

    static constraints = {
		tel nullable:true
    }
	
	String name
	String tel
}
