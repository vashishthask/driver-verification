package com.amigo.verifydriver

class DriverDetailsFromCitizen {
	String driverName
	String driverPhoneNumber
	String address
	String drivingLicenseNumber
	byte[] photo
	String photoType
	String status = Status.DETAILS_REPORTED
	String createdBy
	Date createdDate
	String submitterPhoneNumber
	String lastUpdatedBy
	Date lastUpdatedDate
	

    static constraints = {
		driverName()
		drivingLicenseNumber nullable:true
		photo (nullable:true, maxSize: 4096000 /* 4K */)
		photoType nullable:true
		driverPhoneNumber nullable:true
		address(nullable:true, maxSize:1000)
		createdDate nullable:true
		status()
		createdBy()
		createdDate nullable:true
		submitterPhoneNumber()
		lastUpdatedBy nullable:true
		lastUpdatedDate nullable:true
    }
}