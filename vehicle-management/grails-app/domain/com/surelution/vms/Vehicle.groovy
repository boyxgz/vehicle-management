package com.surelution.vms

/**
 * 车辆信息
 * @author admin
 *
 */
class Vehicle {

    static constraints = {
		vehiclePhoto nullable:true
		stopRent nullable:true
		transfer nullable:true
		scrapped nullable:true
		obdId nullable:true
		province nullable:true
		areaCode nullable:true
		no nullable:true
		carFrame nullable:true
		price nullable:true
		emissionStand nullable:true
		emissionValidity nullable:true
    }
	
	
	String  vehicleBrand  	//品牌型号
	String  vehicleType 	//规格型号
	String  vehicleModel 	//发动机号
	VehicleSource vsource 	//车辆来源
	Date recordTime  //车辆记录在册时间

	DynImage vehiclePhoto  	//车辆照片
	String carFrame			//车架号
	Double price //价格
	String  obdId			//车载设备ID
	
	String  emissionStand	//排放标准
	Date emissionValidity	//排放有效期

	boolean inuse = false 	//是否在用，借出和归还状态,新建时默认为false，表示未在使用
	boolean enabled   		//是否有使用权
	
	VehicleStopRent stopRent   //停止租赁
	VehicleTransfer transfer   //车辆转让
	VehicleScrapped scrapped   //车辆报废
	
	PrerepairStatus statu = "NORMAL"
	
	/**
	 * 以下三个字段组成车牌号码
	 */
	Province province	//车牌所在省份
	String areaCode		//
	String no
	
	enum PrerepairStatus{
		NORMAL,     //正常
		PREINUSE,    //报修可以使用
		PRENOTINUSE  //报修不可以使用
		
	    public String toString() {
			KeyedMessage.findByKey("PrerepairStatus-" + name())?.message
		}
	}
	
	public static Vehicle findByVehicleNO(String vehicleNO){
		println vehicleNO
		def province
		def areaCode
		def no
		if(vehicleNO != null && vehicleNO.length() > 3){
			province = new String(vehicleNO.charAt(0))
			areaCode = new String(vehicleNO.charAt(1))
			no = vehicleNO.substring(2)
		}
		Vehicle vehicle = Vehicle.createCriteria().list{
			createAlias("province","p")
			eq("p.name",province)
			eq("areaCode",areaCode)
			eq("no",no)
		}[0]
		return vehicle
	}
	
	public static String vehicleNO(Vehicle vehicle){
		if(!vehicle){
			return ""
		}else{
			String vehicleNO = vehicle.province.name + vehicle.areaCode + vehicle.no;
			return vehicleNO
		}
	} 
}
