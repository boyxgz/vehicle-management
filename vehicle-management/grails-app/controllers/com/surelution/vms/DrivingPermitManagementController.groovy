package com.surelution.vms

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
		
		def dpNO = params.dp
		def trainingDate = params.date('trainingDate','yyyy.MM.dd')
		def issueDate = params.date('issueDate','yyyy.MM.dd')
		/*def validityDate = params.date('validityDate','yyyy.MM.dd')*/
		def score = params.int('score')
		def name = params.name
		def descitption = params.description
		def sex = params.sex
		def dlicense = params.dlicense
		def age = params.int('age')
		
		def d = new DrivingPermit()
		d.dpNO = dpNO 
		d.trainingDate = trainingDate
		/*d.validityDate = validityDate*/
		d.issueDate = issueDate
		d.score = score
		d.delay = false
		d.licensRevoked = false
		d.name = name
		d.description = descitption
		d.sex = sex
		d.age = age
		d.dlicense = dlicense
		d.borrowNum = 0
		d.dlligle = " "
		d.enabled = true;
		
		
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
	
	
	
	
	
	
}
