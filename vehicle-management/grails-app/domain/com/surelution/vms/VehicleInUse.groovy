package com.surelution.vms


/**
 * 车辆出借，归还
 * @author admin
 *
 */
class VehicleInUse {

    static constraints = {
		returnTime nullable:true
		returnRecordMan nullable:true
		returnMile nullable:true
		/*returnPic nullable:true*/
		isDelay nullable:true
		delayReason nullable:true
		receiveMile nullable:true
    }
	
	DrivingPermit drivingPermit
	Vehicle vehicle  //车辆信息
	Date borrowTime  //借出时间
	Date expectReturnTime  //预计归还时间
	String borrowRecordMan // 借出记录人
	String borrowReason   //出借事由
	
	Date returnTime  //归还时间
	String returnRecordMan  //归还记录人
	
	double receiveMile   //接车里程数
	double returnMile    //交车里程数
	
	//DynImage  receivePic //接车里程数照片
	//DynImage  returnPic  //交车里程数照片
	
	boolean  isDelay   //车辆归还是否延期
	String delayReason  //延期理由
	
	boolean isReturn //是否归还
	
	
}
