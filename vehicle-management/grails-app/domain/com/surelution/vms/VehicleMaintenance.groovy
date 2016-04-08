package com.surelution.vms

/**
 * 车辆常规保养
 * @author admin
 *
 */
class VehicleMaintenance {

    static constraints = {
    }
	
	Vehicle vehicle  //车辆信息
	
	DrivingPermit drivingPermit   //驾驶员信息

	String maintaintenanceItem   //保养项目
	
	Double maintaintenanceFee    //保养金额
	      
}
