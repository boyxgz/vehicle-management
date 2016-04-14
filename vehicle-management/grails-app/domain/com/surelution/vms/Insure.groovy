package com.surelution.vms

import java.util.Date;


/**
 * 投保
 * @author admin
 *
 */
class Insure {

    static constraints = {
		insureMan nullable:true
		detail nullable:true
    }
	
	static mapping = {
		detail type:'text'
	}

	Vehicle vehicle  
	String insureMan   //投保人
	double insureMoney  //投保金额
	InsureType insureType   //保险类型
	boolean firstInsure //是否为第一次投保
	String insureContractNo  //保险合同编号 

	/**
	 * 保险公司
	 */
	Insurer insurer
	
	/**
	 * 保险生效日期
	 */
	Date  effectivedAt
	
	/**
	 * 保险到期日期
	 */
	Date expiredAt
	
	/**
	 * 投保日期
	 */
	Date insuredAt
	
	String detail
	
	InsureState states = InsureState.VALID
	
	enum InsureState{
		EXPIRE,     //到期的
		VALID,		//有效的
		EVER
		public String toString(){
			KeyedMessage.findByKey("InsureState-" + name())?.message
		}
		
		public String toString(String name){
			super.toString()
		}
		
	}
	
	/**
	 * 保险类型
	 *
	 */
	enum InsureType{
		must,business
		
		public String toString(){
			KeyedMessage.findByKey("InsureType-" + name())?.message
		}
	}
	
}
