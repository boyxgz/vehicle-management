package com.surelution.vms

import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.util.Holders;

class DrivingPermitManagementController {

    def index() { }
	
	def DriviLicense(Integer max){
		//准驾证管理
		def dpList;
		def vehicleIllgle = VehicleIllgle.list();
		def dpNO = params.dpNO;
		if(dpNO == null){
			dpList = DrivingPermit.list();
			for(def i=0; i<dpList.size(); i++){
				def dp = dpList.get(i);
				dp.numbIllgle = 0;
				println dp
				for(def j=0; j<vehicleIllgle.size(); j++){
					def vI = vehicleIllgle.get(j);
					if(vI.vehicleInUse != null && vI.vehicleInUse.drivingPermit != null && vI.vehicleInUse.drivingPermit.dpNO == dp.dpNO){
						dp.numbIllgle++;
						println dp.numbIllgle;
					}
				}
			}
		}
		else{
			dpList = DrivingPermit.findByDpNO(dpNO);
			if(dpList == null){
				flash.message = "无此准驾证，请核对后查询!";
			}
			else{
				flash.message = "";
				dpList.numbIllgle = 0;
				for(def i=0; i<vehicleIllgle.size(); i++){
					def vI = vehicleIllgle.get(i);
					if(vI.vehicleInUse && vI.vehicleInUse.drivingPermit != null && vI.vehicleInUse.drivingPermit.dpNO == dpList.dpNO){
						dpList.numbIllgle++;
					}
				}
			}
		}
		
		[dpList:dpList]
	}
	
	def checkin(){
		//准驾证核发
	}
	
	def saveDrivingPermit(){
		
		def permitPic = new DynImage()
		CommonsMultipartFile pic = request.getFile('permitPic')
		def location = Holders.config.grails.dynImage.rootPath
		def uuid = UUID.randomUUID().toString()
		def picUrl = "${location}/${uuid}"
		if(pic && !pic.empty){
			def name = pic.getOriginalFilename()
			permitPic.picUrl = picUrl
			permitPic.originPicName = name
			permitPic.save(flush:true)
			pic.transferTo(new File(picUrl))
		}
		
		def dpNO = params.dp
		def trainingDate = params.date('trainingDate','yyyy.MM.dd')
		def issueDate = params.date('issueDate','yyyy.MM.dd')
		/*def validityDate = params.date('validityDate','yyyy.MM.dd')*/
		def score = params.int('score')
		def name = params.name
		def description = params.description
		def sex = params.sex
		def dlicense = params.dlicense
//		def age = params.int('age')
		
		def d = new DrivingPermit()
		d.dpNO = dpNO 
		d.trainingDate = trainingDate
		/*d.validityDate = validityDate*/
		d.issueDate = issueDate
		d.score = score
		d.delay = false
		d.licensRevoked = false
		d.name = name
		d.description = description
		d.sex = sex
		d.birthDay = params.date('birthDay','yyyy.MM.dd')
		d.dlicense = dlicense
		d.borrowNum = 0
		d.dlligle = " "
		d.enabled = true
		d.permitPic = permitPic
		
		
		if(d.save(flush: true)){
			redirect(action:'DriviLicense')
		}else{
		   flash.message="该准驾证已经添加！"
		   redirect(action:'DriviLicense')
		}
		
		
		
	}
	
	def postpone(){
		//延期
		def dpNO = params.dpNO
		def dp = DrivingPermit.createCriteria().list {
			if(dpNO){
				eq('dpNO',dpNO)
			}
		}
		 
		[dp:dp]
	}
	
	
	def updatimepostpone(){
		//延期的modal框跳转
	}
	
	def updatepostpone(){
		//延期更新
		def delayto = params.date('delayTo','yyyy.MM.dd');
		def delaytoid = params.delayToid;
		println delayto
		def dp = DrivingPermit.get(delaytoid);
		dp.delayTo = delayto;
		dp.delay = true;
		redirect(action:'postpone');
	}
	
	def revoke(){
		//吊销
		def dpNO = params.dpNO
		 def dp = DrivingPermit.createCriteria().list {
			 if(dpNO){
				 eq('dpNO',dpNO)
			 }
		 }
		
		[dp:dp]
	}
	
	def updatimerevoke(){
		//吊销的modal框跳转
	}
	
	def updaterevoke(){
		//吊销时间更新更新
		def revokeid = params.revokeId;
		def revoketime = new Date();
		println revoketime;
		
		def drivingPermit = DrivingPermit.get(revokeid);
		drivingPermit.revokeDate = revoketime;
		drivingPermit.licensRevoked = true;
		redirect(action:'revoke');
	}
	
	def showDrivi(long id){
		def drivi = DrivingPermit.get(id);
		if(!drivi){
			flash.message = "为找到该条目"
			redirect(action: "list")
		}
		[drivi:drivi]
	}
	
	def edit(long id){
		def drivi = DrivingPermit.get(id);
		if(!drivi){
			flash.message = "未找到"
		}
		[drivi:drivi]
	}
	
	def update(){
		def drivi = DrivingPermit.get(params.id);
		
		def permitPic = new DynImage()
		CommonsMultipartFile pic = request.getFile('permitPic')
		def location = Holders.config.grails.dynImage.rootPath
		def uuid = UUID.randomUUID().toString()
		def picUrl = "${location}/${uuid}"
		if(pic && !pic.empty){
			def name = pic.getOriginalFilename()
			permitPic.picUrl = picUrl
			permitPic.originPicName = name
			permitPic.save(flush:true)
			pic.transferTo(new File(picUrl))
			drivi.permitPic = permitPic;
		}
		
		drivi.name = params.name;
		drivi.dpNO = params.dpNO;
		drivi.sex = params.sex;
		drivi.birthDay = params.date('birthDay','yyyy-MM-dd');
		drivi.dlicense = params.dlicense;
		drivi.score = params.int('score');
		drivi.trainingDate = params.date('trainingDate','yyyy-MM-dd');
		drivi.issueDate = params.date('issueDate','yyyy-MM-dd');
		drivi.revokeDate = params.date('revokeDate','yyyy-MM-dd');
		drivi.delayTo = params.date('delayTo','yyyy-MM-dd');
		drivi.description = params.descirption;
		drivi.save(flush:true);
		redirect(action:"showDrivi",id:params.id)
	}
	
	def showPic(long id){
		def drivi = DrivingPermit.get(id)
		
		File file = new File(drivi.permitPic.picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
}
