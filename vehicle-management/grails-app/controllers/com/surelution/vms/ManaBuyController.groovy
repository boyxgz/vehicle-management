package com.surelution.vms

import grails.util.Holders;

import java.awt.geom.Arc2D.Double;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


/**
 * 购入车辆管理
 * @author admin
 *
 */
class ManaBuyController {

    def index() { }
	
	
	def showVehicle(){}
	
	def showVehicleScrapped(long id){
        //车辆报废显示		
		def vehicle = Vehicle.get(id)
		[vehicle:vehicle]
	}

	//购入车辆显示列表
	def list(){
	   def statu
	   def vehicleNO = params.vehicleNO
	   def vehicleType = params.vehicleType
	   def sta = params.status
	   if(sta){
	    statu  = Vehicle.PrerepairStatus.valueOf(sta)
	   }
	   def vehicleResult = Vehicle.createCriteria().list {
		   if(vehicleNO){
			   eq('vehicleNO',vehicleNO)
		   }
		   if(vehicleType){
			   eq('vehicleType',vehicleType)
		   }
		   if(sta){
			   eq('statu',statu)
		   }
	   }

	   [vehicleResult:vehicleResult]
	}
	
	//添加购入车辆
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
		def manufacturer = params.manufacturer
		def buyMan = params.buyMan
		def status = 'NORMAL'
		def inuse = false
		def enabled = params.enabled
		
		
		def image = new DynImage()
		CommonsMultipartFile photo =  request.getFile("billPhoto")
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
		def vehicleSource = new BuyVehicle()
		vehicleSource.gotDate = gotDate
		vehicleSource.manufacturer = manufacturer
		vehicleSource.buyMan = buyMan
		vehicleSource.title = "购买"
		vehicleSource.billPhoto = image
		
		//println vehicleSource.errors
		vehicleSource.save(flush:true)
		
		def image1 = new DynImage()
		CommonsMultipartFile photo1 =  request.getFile("vehiclePhoto")
		def location1 = Holders.config.grails.dynImage.rootPath
		def uuid1 = UUID.randomUUID().toString()
		def picUrl1 = "${location}${uuid}"
		println picUrl
		
		if(photo1 && !photo.empty){
			def name = photo1.getOriginalFilename()
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
		vehicle.vehicleBrand = vehicleBrand
		vehicle.statu = status
		vehicle.insureEndDate = insureEndDate
		vehicle.vsource = vehicleSource
		/*if(inuse.equals('1')){
			vehicle.inuse=true   //1表示true 正在使用
		}else{
		    vehicle.inuse=false
		}*/
		if(enabled.equals('1')){
			vehicle.enabled = true
		}else{
		    vehicle.enabled = false   //1表示true 有使用权
		}
		vehicle.vehiclePhoto = image1
		println vehicle.save(flush:true)
		if(vehicle.save(flush:true)){
			redirect(action:'list')
		}else{
		  flash.message="该车牌号码已经添加!"
		  redirect(action:'list')
		}
		
	}
	
	//编辑购入车辆
	def editVehicle(){}
	
	//更新购入车辆
	def updateVehicle(){}
	
	//删除购入车辆
	def deleteVehicle(long id){
		/*def vehicle = Vehicle.get(id)
		def vsource = vehicle.vsource*/
		
	}
	
	def showTansfer(){}
	
	//车辆转让
	def vehicleTransfer(){
		def vehicleId = params.vehicleId
		def transferTime = params.date('transferTime','yyyy.MM.dd')
		def tansferMan = params.tansferMan
		def transferReason = params.transferReason
		def money = params.double('money')
		def contractNO = params.int('contractNO')
		def transfer = new VehicleTransfer()
		transfer.isTransfer = true
		transfer.transferDate = transferTime
		transfer.transferMan = tansferMan
		transfer.transferReason = transferReason
		transfer.money = money
		transfer.contractNO = contractNO
		transfer.save(flush:true)
		
		def vehicle = Vehicle.get(vehicleId)
		vehicle.transfer = transfer
		vehicle.save(flush:true)
		redirect(action:'list')
	}
	
	//车辆报废
	def vehicleScrapped(){     
		def vehicleId = params.vehicleId      
		def scrappedTime = params.date('scrappedTime','yyyy.MM.dd')        
		def scrapped = new VehicleScrapped()
		scrapped.isScrapped = true
		scrapped.scrapTime = scrappedTime
		scrapped.save(flush:true)
		
		def vehicle = Vehicle.get(vehicleId)
		vehicle.scrapped = scrapped
		vehicle.save(flush:true)
		redirect(action:'list')
	}
	
	
	def showVehicleSource(long id){
		def vehicleSource = Vehicle.get(id)
		[vehicleSource:vehicleSource]
	}
	
	
	//保存图片的方法
	def  savePic(DynImage image){
		CommonsMultipartFile  photo
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
	
	//显示购车发票图片
	def showBillPhoto(long id){
		def vehicleSource = VehicleSource.get(id)
		def pc = vehicleSource.billPhoto
		
		def picUrl = pc.picUrl
		File file = new File(picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
	
}
