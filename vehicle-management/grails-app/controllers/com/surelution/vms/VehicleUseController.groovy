package com.surelution.vms

import java.text.SimpleDateFormat;
import java.lang.String;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService;
import grails.util.Holders;
/**
 * 车辆使用
 * @author admin
 *
 */
class VehicleUseController {
	//static CommonsMultipartFile  photo
	
	def user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    def index() { }
	
	//借车页面
	def show(){
		def vehicleNO = params.vehicleNO
	    def vehicleList = Vehicle.createCriteria().list {
		    if(vehicleNO){
			   eq('vehicleNO',vehicleNO)
		    }
		   // eq('enabled',true)
	   }
	    [vehicleList:vehicleList]
	}
	
	
	//借车详细信息
	def showDrivingPermit(){
		
	}
	
	//还车页面
	def returnVehicle(){
		def carNO = params.carNO
		def dp = DrivingPermit.createCriteria().list{
			or{
				eq "dpNO",carNO
				eq "cardId",carNO
			}
		}[0]
		
		if(carNO!=null && dp!=null && dp.licensRevoked==true ){
			flash.message="该准驾证已经吊销"
		}else{
		    flash.message=""
		}
		
		def vehicleInUseList = VehicleInUse.createCriteria().list {
			if(dp){
			  eq('drivingPermit',dp)
			 }
		}
		flash.message = dp != null && vehicleInUseList.size() == 0 ? "没有借车信息！！！" : "";
		[vehicleInuseList:vehicleInUseList]
	}
	
	//显示还车详细信息
	def showDetails(){
	      
	}
	
	
	//借出车辆
	def lendVehicle(){
		def dpid = params.dpId
		def dp = DrivingPermit.get(dpid) 
		dp.borrowNum += 1
		dp.save(flush:true)
		
		def vehicleId = params.vehicleId
		def vehicle = Vehicle.get(vehicleId)
		vehicle.inuse  = true
		vehicle.save(flush:true)
		
		
		def borrowTime = params.date('borrowTime','yyyy.MM.dd HH:mm')
		def expectReturnTime = params.date('expectReturnTime',"yyyy.MM.dd HH:mm")
		def reason = params.reason
		//def receiveMile = params.double('receiveMile')
		
		/*photo = request.getFile("receivePic")
		def image = new DynImage()
		if(photo && !photo.empty){
			savePic(image)
			}*/
		
		def vehicleInUse = new VehicleInUse()
		vehicleInUse.drivingPermit = dp
		vehicleInUse.vehicle = vehicle
		vehicleInUse.borrowTime = borrowTime
		vehicleInUse.expectReturnTime = expectReturnTime
		
		vehicleInUse.borrowRecordMan = user.username
		//vehicleInUse.receiveMile = receiveMile
		vehicleInUse.borrowReason = reason
		//vehicleInUse.receivePic = image
		vehicleInUse.save(flush:true)
		redirect(action:'show')
	}
	
	//车辆归还
	def sendVehicle(){
		def vehicleInUseId = params.vehicleInUseId
		def returnT = params.returnTime
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy.MM.dd HH:mm");    
		def returnTime = fmt.parse(returnT)   
		
		def returnMile = params.double('returnMile')
		def receiveMile = params.double('receiveMile')
		def isDelay = params.delay
		def delayReason = params.delayReason
		
		/*photo = request.getFile('returnPic')
		def image = new DynImage()
		if(photo && !photo.empty){
			savePic(image)
		}*/
		
		def vehicleInUse = VehicleInUse.get(vehicleInUseId) 
		
		def vehicle = vehicleInUse.vehicle
		vehicle.inuse = false
		vehicle.save(flush:true)
		
		//判断上一次还车的里程数和这一次的接车里程数是否一致
		
		
		vehicleInUse.returnMile = returnMile
		vehicleInUse.returnTime = returnTime
		vehicleInUse.receiveMile = receiveMile
		vehicleInUse.returnRecordMan = user.username
	//	vehicleInUse.returnPic = image
		vehicleInUse.isReturn = true
		
		if(isDelay.equals('1')){
			vehicleInUse.isDelay =true   //1表示true,已经延期
		}else{
		    vehicleInUse.isDelay =false
		}
		vehicleInUse.delayReason = delayReason
		
		vehicleInUse.save(flush:true)
		redirect(action:'returnVehicle')
	}
	
	//查询还车信息
	def showReturnVehicle(long id){
		def vehicleInUse = VehicleInUse.get(id)
		[vehicleInUse:vehicleInUse]
	}
	
   //查询借车信息
	def showlend(long id){
		def vehicle = Vehicle.get(id)
		def vehicleInUse = VehicleInUse.findByVehicleAndIsReturn(vehicle,false)
		[vehicleInUse:vehicleInUse] 
	}
	
	//检查驾驶员信息
	def checkDrivingPermit(){
		def drivingPermit = params.drivingPermit
//		def dp = DrivingPermit.findByDpNO(drivingPermit)
		def dp = DrivingPermit.createCriteria().list{
			or{
				eq("dpNO",drivingPermit)
				eq("cardId",drivingPermit)
			}
		}
		if(dp[0] == null || dp[0].licensRevoked==true || dp[0].enabled==false){
			render false
		}else if(dp[0].delay==true && dp[0].delayTo<new Date()){
			render false
		}else{
		   render dp[0].collect(){['id':dp[0].id,'name':dp[0].name,'dlicense':dp[0].dlicense,'dpNO':dp[0].dpNO,'enabled':dp[0].enabled?"正常":""]} as JSON
		
		   }
	}
	
	def pushData(){
		def vehicle = Vehicle.createCriteria().list {
			like("vehicleNO","%"+params.keyword+"%");
		}
		def vehicleNo = [];
		vehicleNo = vehicle.collect(){
			[vehicle:it.vehicleNO];
		}
		render vehicleNo as JSON
	}
	
	def reportFrom(Integer max){
		params.max = Math.min(max ?: 10, 100)
		//params.dpNO/params.vehicleNO/params.startDate/params.endDate
		def startDate = params.date("startDate","yyyy.MM.dd")
		def endDate = params.date("endDate","yyyy.MM.dd")
		if(startDate == null){
			startDate = new Date(0)
		}
		if(endDate == null){
			endDate = new Date()
		}
		def dpNO = params.dpNO
		
		String vehicleNO = params.vehicleNO
		def province
		def areaCode
		def no
		if(vehicleNO != null && vehicleNO.length() > 3){
			province = new String(vehicleNO.charAt(0))
			areaCode = new String(vehicleNO.charAt(1))
			no = vehicleNO.substring(2)
		}
		def vehicleInUse
		vehicleInUse = VehicleInUse.createCriteria().list {
			createAlias("drivingPermit", "dp")
			createAlias("vehicle","v")
			createAlias("v.province","p")
			if(dpNO){
				or{
					eq("dp.dpNO",dpNO)
					eq "dp.cardId",dpNO
				}
			}
			if(vehicleNO != null && vehicleNO.length() > 3){
				and{
					eq("v.no",no)
					eq("p.name",province)
					eq("v.areaCode",areaCode)
				}
			}
			between("borrowTime",startDate,endDate)
		}
		
		[vehicleInUse:vehicleInUse,vehicleInUseTotal:VehicleInUse.count()]
		
		/*if(startDate != null && endDate != null){
			vehicleInUse = VehicleInUse.createCriteria().list{
				between("borrowTime", startDate, endDate)
				
			}
		}else if(startDate != null){
			vehicleInUse = VehicleInUse.createCriteria().list {
				gt("borrowTime", startDate)
			}
		}else if(endDate != null){
			vehicleInUse = VehicleInUse.createCriteria().list{
				lt("borrowTime", endDate)
			}
		}*/
		
	}
}
