package com.surelution.vms

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import grails.util.Holders;

class VehicleIllgleMenagementController {
	
	static CommonsMultipartFile  photo
	
    VehicleInUse vehicleInUse
	
    def index() { }
	
	/**
	 * 功能：违章登记
	 * 在save()中,保存违章信息
	 * @return
	 */
	def checkIn(){
		String vehicleNO = params.vehicleNOCheckIn
		Vehicle vehicleCheckIn = Vehicle.findByVehicleNO(vehicleNO)
		if(vehicleNO != null && vehicleCheckIn == null){
			flash.message = "无此车牌号！请输入正确的车牌号码。"
		}
		[vehicleCheckIn:vehicleCheckIn]
	}
	
	/**
	 * 违章处理
	 * @return
	 */
	def dispose(){
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
	
	def list(Integer max){
		
		params.max = Math.min(max ?: 8, 100)
		if(!params.offset) params.offset = 0
		if(!params.sort) params.sort = "id"
		if(!params.order) params.order = 'desc'
		
		def voucherid = params.voucherID
		def illgle = voucherid ? VehicleIllgle.findByVoucherID(voucherid):VehicleIllgle.list(params)
		[illgle:illgle,illgleCount:VehicleIllgle.count()]
	}
	/**
	 * 保存违章信息
	 * @return
	 */
	def save(){
		DynImage image = DynImage.saveImage(request.getFile("illeglePic"))
		
		String vehicleNO = params.vehicleNOSave
		def vehicle = Vehicle.findByVehicleNO(vehicleNO)
		
		def illgleTime = params.date('illgleTime','yyyy.MM.dd HH:mm')
		vehicleInUse = VehicleInUse.createCriteria().list{
			eq("vehicle",vehicle)
			gt("returnTime",illgleTime)
			lt("borrowTime",illgleTime)
		}[0]
		def vehicleillgle = new VehicleIllgle();
		if(vehicleInUse == null){
			vehicleillgle.vehicle = vehicle
		}else{
			vehicleillgle.vehicleInUse = vehicleInUse
		}
		vehicleillgle.illgleTime = illgleTime
		vehicleillgle.voucherID = params.voucherID
		vehicleillgle.location = params.location;
		vehicleillgle.processingUnit = params.processingUnit
		vehicleillgle.illgleSituation = params.illgleSituation
		vehicleillgle.image = image
		if(vehicleillgle.vehicle != null || vehicleillgle.vehicleInUse != null){
			if(vehicleillgle.save(flush:true)){
				flash.message = vehicleInUse ? "保存成功":"保存成功，但是在该违章时刻，车辆未曾借出，请仔细核对。"
				redirect(action:'list')
			}else{
				flash.message = "保存失败！！！可能违章单号以存在。"
				println flash.message
				redirect(action:'checkIn')
			}
		}
		else{
			flash.message = "违章单号以存在"
			println flash.message
			redirect(action:'checkIn')
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
	
	def showPic(long id){
		def picId = id
		def illgle = VehicleIllgle.get(picId)
		def img = illgle.image
		def imgUrl = img.picUrl
		File file = new File(imgUrl)
		
		def os = response.outputStream
		os << file.bytes
		os.flush
		return
	}
	
	/**
	 * modal调用用的，显示违章凭证图片
	 * @return
	 */
	def show(){}
}
