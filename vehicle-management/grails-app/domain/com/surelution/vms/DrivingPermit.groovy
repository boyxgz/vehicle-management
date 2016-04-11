package com.surelution.vms


/**
 * 准驾证类
 * @author admin
 *
 */
class DrivingPermit {
	
    static constraints = {
		delayTo nullable:true;
		revokeDate nullable:true;
//		age nullable:true;
		dpNO unique:true
    }
	
	String dpNO         //准驾证编号
	Date trainingDate   //培训日期
	int  score          //考核成绩
	boolean delay       //是否延期
	boolean licensRevoked  //是否吊销
	Date delayTo       //延期时长
	Date revokeDate    //吊销日期
	
	
	String name  //驾驶员姓名
	String description   //描述
//	int age    //年龄
	Date birthDay	//出生日期
	Sex sex   //性别
	enum Sex{
		man,woman
		
		public String toString() {
			KeyedMessage.findByKey("Person-" + name())?.message
		}
	}
	String dlicense  //驾驶证
	int  borrowNum   //借车次数
	String dlligle   //违章情况
	int numbIllgle
	/*Date  validityDate     //有效年限*/
	Date  issueDate       //核发日期
	
	boolean enabled   //是否可以使用
	
	DynImage permitPic		//驾驶证的照片
}
