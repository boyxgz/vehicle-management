package com.surelution.vms

import java.util.Date;


/**
 * 投保
 * @author admin
 *
 */
class Insure {

    static constraints = {
    }
	
	static mapping = {
		detail type:'text'
	}

	Vehicle vehicle  
	String insureMan   //投保人
	double insureMoney  //投保金额
	String insureType   //保险类型
	boolean firstInsure //是否为第一次投保
	int insureContractNo  //保险合同编号 

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
}
