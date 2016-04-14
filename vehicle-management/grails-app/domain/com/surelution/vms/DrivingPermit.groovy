package com.surelution.vms


/**
 * 准驾证类
 * @author admin
 *
 */
class DrivingPermit {
	
    static constraints = {
		trainingDate nullable:true
		delayTo nullable:true
		revokeDate nullable:true
		birthDay nullable:true
		score nullable:true
		description nullable:true
		dlicense nullable:true
		permitPic nullable:true
    }
	
	String name  		//驾驶员姓名
	String dpNO         //准驾证编号
	String cardId		//卡的ID
	Date  issueDate       //核发日期
	
	Date trainingDate   //培训日期
	Date delayTo       	//延期时长
	Date revokeDate    	//吊销日期
	Date birthDay			//出生日期
	int  score          //考核成绩
	String description  	//描述
	String dlicense  //驾驶证
	DynImage permitPic		//驾驶证的照片
	
	boolean delay = false      //是否延期
	boolean licensRevoked = false  	//是否吊销
	int  borrowNum = 0  //借车次数
	String dlligle = " "  //违章情况
	int numbIllgle
	boolean enabled = true  //是否可以使用
	
	Sex sex   				//性别
	enum Sex{
		man,woman
		
		public String toString() {
			KeyedMessage.findByKey("Person-" + name())?.message
		}
	}
	
	
	
	
	/*Date  validityDate     //有效年限*/
	
	
	
	
	
}
