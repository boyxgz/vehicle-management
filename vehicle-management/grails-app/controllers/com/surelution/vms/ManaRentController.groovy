package com.surelution.vms

import grails.util.Holders;

import org.springframework.validation.Errors;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


/**
 * 租赁车辆管理
 * @author admin
 *
 */
class ManaRentController {
	
    def index() { }
	
	def showVehicle(){}
	
	//添加租赁车辆
	def saveVehicle(){
		//先获取两张图片的信息
		def rentPhoto = DynImage.saveImage(request.getFile("rentPhoto"))
		
		def vehiclePhoto = DynImage.saveImage(request.getFile("vehiclePhoto"))
		
		//先保存RentVehicle的信息
		def vehicleSource = new RentVehicle()
		vehicleSource.gotDate = params.date("gotDate","yyyy.MM.dd")
		vehicleSource.rentTo = params.date("rentTo","yyyy.MM.dd")
		vehicleSource.manufacturer = params.manufacturer
		vehicleSource.rentPhoto = rentPhoto
		vehicleSource.title = "租赁"
		vehicleSource.rentMan = params.rentMan
		vehicleSource.save(flush:true)
		
		//保存Vehicle
		def vehicle = new Vehicle()
		vehicle.recordTime = new Date()
		vehicle.vehicleBrand = params.vehicleBrand
		vehicle.vehicleType = params.vehicleType
		vehicle.vehicleModel = params.vehicleModel
		vehicle.carFrame = params.carFrame
		vehicle.price = params.double("price")
		vehicle.emissionStand = params.emissionStand
		vehicle.emissionValidity = params.date("emissionValidity","yyyy.MM.dd")
		vehicle.vehiclePhoto = vehiclePhoto
		vehicle.vsource = vehicleSource
		vehicle.no = params.no
		vehicle.areaCode = params.areaCode
		vehicle.province = Province.get(params.int("province"))
		
		/*if(inuse.equals('1')){
			vehicle.inuse=true   //1表示true 正在使用
		}else{
		   vehicle.inuse=false
		}*/
		if(params.enabled.equals('1')){
			vehicle.enabled = true    //1表示true 有使用权
		}else{
		  vehicle.enabled =false
		}
		vehicle.save(flush:true)
		
	    redirect(action:'list',controller:'manaBuy')
	}
	
	//停止租赁
	def vehicleStopRent(long id){
		def stopRent = new VehicleStopRent()
		stopRent.isStopRent = true
		stopRent.stopRentTime = new Date()
		stopRent.save(flush:true)
		def vehicle = Vehicle.get(id)
		vehicle.stopRent = stopRent
		vehicle.save(flush:true)
		redirect(action:'list',controller:'manaBuy')
	}
	
	//显示公车图片的方法
	def showPic(long id){
		def vehicle = Vehicle.get(id)
		def pc = vehicle.vehiclePhoto
		
		def picUrl = pc.picUrl
		File file = new File(picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
	
	//显示租赁凭证图片
	def showRentPhoto(long id){
		def vehicleSource = VehicleSource.get(id)
		def pc = vehicleSource.rentPhoto
		
		def picUrl = pc.picUrl
		File file = new File(picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
}
