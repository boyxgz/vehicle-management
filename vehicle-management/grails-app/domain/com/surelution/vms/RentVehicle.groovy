package com.surelution.vms

import java.util.Date;


/**
 * 租赁车辆
 * @author admin
 *
 */
class RentVehicle extends VehicleSource {

    static constraints = {
    }
	
	Date rentTo    //租赁时长
	String manufacturer //租赁厂家
	String rentMan //租赁人
	DynImage rentPhoto //租赁凭证
	String title     //来源名称
	Date   gotDate        //租入日期
}
