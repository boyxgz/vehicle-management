package com.surelution.vms


/**
 * 投保
 * @author admin
 *
 */
class Insure {

    static constraints = {
    }
	
	Vehicle vehicle  
	Date insureDate   //投保时间
	String insureMan   //投保人
	double insureMoney  //投保金额
	String insureType   //保险类型
	boolean firstInsure //是否为第一次投保
	int insureNum      //投保次数
	int insureContractNo  //保险合同编号 
}
