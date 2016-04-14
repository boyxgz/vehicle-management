package com.surelution.vms

class Province {

    static constraints = {
		shortName nullable:true
		carorg nullable:true
		enginenoLength nullable:true
		framenoLength nullable:true
    }
	
	String name
	String shortName
	String carorg
	Integer enginenoLength
	Integer framenoLength
}
