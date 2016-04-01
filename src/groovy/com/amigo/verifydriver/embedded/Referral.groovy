package com.amigo.verifydriver.embedded

class Referral {
	String referralName
	String referralMobilePhoneNumber
	String referralLandLineNumber
	String relation
	byte[] referralPhoto
	String referralPhotoType
	
	static constraints = {
		referralName(nullable:true)
		referralMobilePhoneNumber(nullable:true)
		referralLandLineNumber(nullable:true)
		relation(nullable:true)
		referralPhoto(nullable:true, maxSize: 4096000 /* 4K */)
		referralPhotoType(nullable:true)
	}
	
//	static belongsTo = Driver
	
	String toString(){
		referralName
	}
}
