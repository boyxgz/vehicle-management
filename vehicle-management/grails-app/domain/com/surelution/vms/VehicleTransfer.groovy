package com.surelution.vms

class VehicleTransfer {

    static constraints = {
		contractNO nullable:true
    }
	
	boolean isTransfer  //是否转让
	Date transferDate  //转让时间
	String transferMan  //转让人
	String transferReason //转让原因
	double money   //转让金额
    int   contractNO  //转让合同编号
	
	Date dateCreated
}
