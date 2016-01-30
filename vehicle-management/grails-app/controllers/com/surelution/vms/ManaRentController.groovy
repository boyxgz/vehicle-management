package com.surelution.vms

import grails.util.Holders;

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
		def recordTime = new Date()
		def insureEndDate = params.date('insureEndDate','yyyy.MM.dd')
		def vOwner = params.vOwner
		def vehicleType = params.vehicleType
		def price = params.double('price')
		def vehicleModel = params.vehicleModel
		def vehicleNO = params.vehicleNO
		def vehicleBrand = params.vehicleBrand
		def gotDate = params.date('gotDate','yyyy.MM.dd')
		def rentTo = params.date('rentTo','yyyy.MM.dd')
		def manufacturer = params.manufacturer
		def rentMan = params.rentMan
		def status = 'NORMAL'
		def inuse = false
		def enabled = params.enabled
		
		def image = new DynImage()
		CommonsMultipartFile  photo =  request.getFile("rentPhoto")
		def location = Holders.config.grails.dynImage.rootPath
		def uuid = UUID.randomUUID().toString()
		def picUrl = "${location}${uuid}"
		println picUrl
		
		if(photo && !photo.empty){
			def name = photo.getOriginalFilename()
			image.picUrl = picUrl
			image.originPicName = name
			image.save(flush:true)
			photo.transferTo(new File(picUrl))
		}
		def vehicleSource = new RentVehicle()
		vehicleSource.gotDate = gotDate
		vehicleSource.rentTo = rentTo
		vehicleSource.manufacturer = manufacturer
		vehicleSource.rentMan = rentMan
		vehicleSource.title = "租赁"
		vehicleSource.rentPhoto = image
		vehicleSource.save(flush:true)
		
		def image1 = new DynImage()
		CommonsMultipartFile  photo1 =  request.getFile("vehiclePhoto")
		def location1 = Holders.config.grails.dynImage.rootPath
		def uuid1= UUID.randomUUID().toString()
		def picUrl1 = "${location}${uuid}"
		println picUrl
		
		if(photo1 && !photo1.empty){
			def name = photo.getOriginalFilename()
			image1.picUrl = picUrl
			image1.originPicName = name
			image1.save(flush:true)
			photo1.transferTo(new File(picUrl))
		}
		def vehicle = new Vehicle()
		vehicle.recordTime = recordTime
		vehicle.vOwner = vOwner
		vehicle.vehicleType = vehicleType
		vehicle.price = price
		vehicle.vehicleModel = vehicleModel
		vehicle.vehicleNO = vehicleNO
		vehicle.statu = status
		vehicle.vehicleBrand = vehicleBrand
		vehicle.insureEndDate = insureEndDate
		vehicle.vsource = vehicleSource
		/*if(inuse.equals('1')){
			vehicle.inuse=true   //1表示true 正在使用
		}else{
		   vehicle.inuse=false
		}*/
		if(enabled.equals('1')){
			vehicle.enabled = true    //1表示true 有使用权
		}else{
		  vehicle.enabled =false
		}
		vehicle.vehiclePhoto = image1
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
