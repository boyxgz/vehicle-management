package com.surelution.vms

/**
 * 出险
 * @author admin
 *
 */
class Danger {

    static constraints = {
    }
	
	Date dangerDate //出险时间
    DrivingPermit drivingPermit
	Insure insure    //车辆保险信息
	String result    //出险后果，责任
}
