package com.surelution.vms

import org.springframework.web.multipart.commons.CommonsMultipartFile;
import grails.util.Holders;
class DynImage {

    static constraints = {
    }
	
	String picUrl   //照片路径
	String originPicName   //照片原始名称
	Date dateCreated   
	
	public static DynImage saveImage(CommonsMultipartFile photo){
		DynImage image = new DynImage()
		def imagePath = Holders.config.grails.dynImage.rootPath
		def imageUuid = UUID.randomUUID().toString()
		def imageUrl = "${imagePath}/${imageUuid}"
		if(photo && !photo.empty){
			def name = photo.getOriginalFilename()
			image.picUrl = imageUrl
			image.originPicName = name
			println "Save Image"
			image.save(flush:true)
			photo.transferTo(new File(imageUrl))
		}
		
		return image
	}
}