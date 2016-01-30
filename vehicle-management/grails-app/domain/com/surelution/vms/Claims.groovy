package com.surelution.vms

/**
 * 理赔
 * @author admin
 *
 */
class Claims {

    static constraints = {
    }
	
	Danger danger   //出险信息
	Date claDate   //理赔时间
	String claMan  //理赔方
	double claMoney //理赔金额
	Date dateCreated
}
