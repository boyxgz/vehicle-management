package com.surelution.vms

import java.util.Date;

/**
 * 车辆购买
 * @author admin
 *
 */
class BuyVehicle extends VehicleSource {
    
    static constraints = {
		billPhoto nullable:true
    }
	
	Date   gotDate        //购入日期
	DynImage billPhoto  //购买发票
	String manufacturer  //购买厂家
	String buyMan    //购买人
	String title     //来源名称
	
	
	 
	
	
}
