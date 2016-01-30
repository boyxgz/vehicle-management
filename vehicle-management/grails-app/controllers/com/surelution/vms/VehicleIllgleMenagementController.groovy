package com.surelution.vms

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import grails.util.Holders;

class VehicleIllgleMenagementController {
	
	static CommonsMultipartFile  photo
	
    VehicleInUse vehiInUse
	
    def index() { }
	
	def checkIn(){
		//违章登记
		def vehicleid = params.vehicleNO
		def vehi = Vehicle.findByVehicleNO(vehicleid)
		if(vehicleid != null && vehi == null){
			flash.message = "无此车牌号！请输入正确的车牌号码。"
		}else{
		  flash.message=""
		}
		[vehi:vehi]
	}
	
	def dispose(){
		
		println params.voucherID
		//违章处理
		def voucherid;
		def illgle;
		def vehicle;
		if(voucherid==null){
			flash.message=""
		}
		if(voucherid!=null && illgle==null){
			flash.message="该违章单号没有违章信息，请检查违章单号是否正确"
		}
		if(params.voucherID){
			voucherid = params.voucherID;
			illgle = VehicleIllgle.findByVoucherID(voucherid);
		}
		else{
			voucherid = params.voucherID;
			illgle = VehicleIllgle.findByVoucherID(voucherid);
		}
		if(illgle){
		    if(illgle.ischecked){
				flash.message="该违章已经处理！";
			}
			if(illgle.vehicleInUse){
				vehicle = illgle.vehicleInUse.vehicle;
			}
			else{
				vehicle = illgle.vehicle
			}
			[illgle:illgle,vehicle:vehicle]
		}

	}
	
	def disp(){
	}
	
	def list(){
		def voucherid = params.voucherID
		
		def illgle
		if(voucherid){
			illgle = VehicleIllgle.findByVoucherID(voucherid);
		}
		else{
			illgle = VehicleIllgle.list();
		}
		[illgle:illgle]
	}
	def save(){
		def illgletime = params.date('illgletime','yyyy.MM.dd hh:mm');
		
		def vehicleNO = params.vehicleNO
		def voucherid = params.voucherID
		def location = params.location;
		def processingunit = params.processingUnit
		def illglesituation = params.illgleSituation
		def vehicle = Vehicle.get(vehicleNO)
		def vehicleInUse = VehicleInUse.findAllByVehicle(vehicle)
		vehicleInUse.each{vehi->
			if(vehi.borrowTime<=illgletime && vehi.returnTime>=illgletime){
				vehiInUse = vehi
			}
		}
		def vehicleillgle = new VehicleIllgle();
		
		if(vehiInUse==null){
			vehicleillgle.vehicle = vehicle
		}else{
			//flash.message="保存成功"
			vehicleillgle.vehicleInUse = vehiInUse
		}
		
		def image = new DynImage()
		photo =  request.getFile("illeglePic")
		if(photo && !photo.empty){
			savePic(image)
		}
		vehicleillgle.illgleTime = illgletime
		vehicleillgle.voucherID = voucherid
		vehicleillgle.location = location
		vehicleillgle.processingUnit = processingunit
		vehicleillgle.illgleSituation = illglesituation
		vehicleillgle.image = image
		if(vehicleillgle.vehicle != null || vehicleillgle.vehicleInUse != null){
			if(vehicleillgle.save(flush:true)){
				redirect(action:'list')
			}else{
			    flash.message="该单号已经添加"
				redirect(action:'list')
			}
		}
		else{
			//flash.message = "找不到车牌号，请输入正确的车牌号码，重新提交。"
			redirect(action:'checkIn')
		}

	}
	
	//保存图片的方法
	def static savePic(DynImage image){
		def location = Holders.config.grails.dynImage.rootPath
		def uuid = UUID.randomUUID().toString()
		def picUrl = "${location}${uuid}"
		
		if(photo && !photo.empty){
			def name = photo.getOriginalFilename()
			image.picUrl = picUrl
			image.originPicName = name
			image.save(flush:true)
			photo.transferTo(new File(picUrl))
		}
	}
	
	def updata(){
		def dealtime = params.date('dealTime','yyyy.MM.dd hh:mm')
		def dealman = params.dealMan
		def dealresult = params.dealResult
		
		def voucherid = params.voucherID;
		def illgle = VehicleIllgle.findByVoucherID(voucherid);
		if(illgle){
			flash.message="违章处理成功";
			illgle.dealMan = dealman
			illgle.dealResult = dealresult
			illgle.dealTime = dealtime
			illgle.ischecked = true
			illgle.save(flush:true)
		}
		else{
			flash.message="该违章情况已经处理，请到违章列表查询"
		}
		redirect(action:'dispose')
	}

	def showimage(long id){
		def illgle = VehicleIllgle.get(id)
		def img = illgle.image
		def imgUrl = img.picUrl
		File file = new File(imgUrl)
		
		def os = response.outputStream
		os << file.bytes
		os.flush
		return
	}
	
	def showPic(){
		def picId = params.id
		def illgle = VehicleIllgle.get(picId)
		println illgle;
		def img = illgle.image
		def imgUrl = img.picUrl
		File file = new File(imgUrl)
		
		def os = response.outputStream
		os << file.bytes
		os.flush
		return
	}
	
	
	def show(){
		
	}
}
