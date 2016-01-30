package com.surelution.vms

class KeyedMessage {

    static constraints = {
		key unique:true
		description nullable:true
    }
	
	static mapping = {
		key column:'_key'
	}
	
	String key
	String message
	String description
}
