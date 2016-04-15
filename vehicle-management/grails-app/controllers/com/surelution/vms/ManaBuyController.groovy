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
	def list(Integer max){
		params.max = Math.min(max ?: 6, 100)
		def statu
		String vehicleNO = params.vehicleNO
		def province
		def areaCode
		def no
		if(vehicleNO != null && vehicleNO.length() > 3){
			province = new String(vehicleNO.charAt(0))
			areaCode = new String(vehicleNO.charAt(1))
			no = vehicleNO.substring(2)
		}
	   def vehicleType = params.vehicleType
	   def sta = params.status
	   if(sta){
	    statu  = Vehicle.PrerepairStatus.valueOf(sta)
	   }
	   def vehicleResult = Vehicle.createCriteria().list(params) {
		   if(vehicleNO){
			   createAlias("province", "p")
			   and{
				   eq("no",no)
				   eq("areaCode",areaCode)
				   eq("p.name",province)				   
			   }
		   }
		   if(vehicleType){
			   eq('vehicleType',vehicleType)
		   }
		   if(sta){
			   eq('statu',statu)
		   }
	   }

	   [vehicleResult:vehicleResult, vehicleCount:Vehicle.count()]
	}
	
	//添加购入车辆
	def saveVehicle(){
		//图片存储
		def billPhoto = DynImage.saveImage(request.getFile("billPhoto"))
		def vehiclePhoto = DynImage.saveImage(request.getFile("vehiclePhoto"))
		
		//VehicleSource Save
		def vehicleSource = new BuyVehicle()
		vehicleSource.gotDate = params.date("gotDate","yyyy.MM.dd")
		vehicleSource.buyMan = params.buyMan
		vehicleSource.title = "购买"
		vehicleSource.manufacturer = params.manufacturer
		vehicleSource.billPhoto = billPhoto
		vehicleSource.save(flush:true)
		def vehicle = new Vehicle()
		vehicle.vehicleBrand = params.vehicleBrand
		vehicle.vehicleType = params.vehicleType
		vehicle.vehicleModel = params.vehicleModel
		vehicle.carFrame = params.carFrame
		vehicle.price = params.double("price")
		vehicle.vehiclePhoto = vehiclePhoto
		vehicle.recordTime = new Date()
		vehicle.vsource = vehicleSource
		vehicle.emissionStand = params.emissionStand
		vehicle.emissionValidity = params.date("emissionValidity","yyyy.MM.dd")
		vehicle.no = params.no
		vehicle.areaCode = params.areaCode
		vehicle.province = Province.get(params.int("province"))
		if(params.enabled.equals('1')){
			vehicle.enabled = true
		}else{
		    vehicle.enabled = false   //1表示true 有使用权
		}
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
		[vehicleSource:Vehicle.get(id)]
	}
	
	def vehicleSourceEdit(long id){
		[vehicleSource:Vehicle.get(id)]
	}
	
	def vehicleSourceUpdate(long id){
		
		def vehicle = Vehicle.get(id)
		vehicle.province.name = Province.get(params.province).name
		vehicle.areaCode = params.areaCode
		vehicle.no = params.no
		vehicle.vehicleType = params.vehicleType
		vehicle.vehicleBrand = params.vehicleBrand
		vehicle.vehicleModel = params.vehicleModel
		vehicle.carFrame = params.carFrame
		vehicle.price = params.double("price")
		vehicle.vehiclePhoto = DynImage.saveImage(request.getFile("vehiclePhoto"))
		vehicle.save(flush:true)
		
		def vehicleBuy = BuyVehicle.get(vehicle.vsource.id)
		if(vehicleBuy){
			vehicleBuy.gotDate = params.date('gotDateBuy','yyyy.MM.dd')
			vehicleBuy.buyMan = params.buyMan
			vehicleBuy.manufacturer = params.manufacturer
			vehicleBuy.billPhoto = DynImage.saveImage(request.getFile("billPhoto"))
			def tf = VehicleTransfer.get(vehicle?.transfer?.id)
			if(tf?.isTransfer == true){
				tf.transferDate = params.date("transferDate","yyyy.MM.dd")
				tf.transferMan = params.transferMan
				tf.transferReason = params.transferReason
				tf.money = params.double("money")
				tf.contractNO = params.contractNO
				tf.save(flush:true)
			}
			def sc = VehicleScrapped.get(vehicle?.scrapped?.id)
			if(sc){
				sc.scrapTime = sc.isScrapped ? params.date("scrapTime",'yyyy.MM.dd'):sc.scrapTime
				sc.save(flush:true)
			}
			vehicleBuy.save(flush:true)
		}
		
		def vehicleRent = RentVehicle.get(vehicle.vsource.id)
		if(vehicleRent){
			vehicleRent.gotDate = params.date("gotDateRent","yyyy.MM.dd")
			vehicleRent.rentMan = params.rentMan
			vehicleRent.rentTo = params.date("rentTo","yyyy.MM.dd")
			vehicleRent.rentPhoto = DynImage.saveImage(request.getFile("rentPhoto"))
			vehicleRent.save(flush:true)
		}
		
		
		redirect(action:'showVehicleSource',id:id)
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
