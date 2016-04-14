package com.surelution.vms

/**
 * 行车违章
 * @author admin
 *
 */
class VehicleIllgle {

    static constraints = {
		illgleTime nullable:true;
		location nullable:true;
		dealTime nullable:true;
		dealResult nullable:true;
		dealMan nullable:true;
		processingUnit nullable:true;
		image nullable:true;
		vehicleInUse nullable:true;
		vehicle nullable:true;
		voucherID unique:true
    }
	
	Date illgleTime  //违章时间
	VehicleInUse vehicleInUse //车辆出借记录
	Date dealTime //违章处理时间
	String dealResult //违章处理结果
	String dealMan   //处理人
	String location //违章地点
	String processingUnit //执法单位
	DynImage image	//违章单据
	
	boolean ischecked  //是否处理违章
	
	String illgleSituation	//违章情况
	String voucherID	//违章票据ID
	
	Vehicle vehicle
	
	
}
