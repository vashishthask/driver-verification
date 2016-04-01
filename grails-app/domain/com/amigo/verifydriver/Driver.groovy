package com.amigo.verifydriver

import org.apache.commons.lang.builder.ToStringBuilder

import com.amigo.verifydriver.embedded.Referral

class Driver {

	String name
	byte[] photo
	String photoType
	String fatherName

	String drivingLicenseNumber
	String licensePlaceOfIssue
	Date drivingLicenseExpiryDate
	
	String mobileNumber
	String driverType
	Date dateOfBirth
	String gender
	

	String voterIdProof
	String aadharIdProof
	String panIdProof
	String passportNumberIdProof

	
	Integer numberOfDependents

	String placeOfBirth
	String criminalRecord
	String currentAddress
	String permanentAddress

	
	String mobileNumberRegistrationPlace
	String landLineNumber


	String listOfSchoolsWorking

	String vehicleOwnerName
	String vehicleDetails
	String vehicleOwnerAddress
	String vehicleRegistrationNumber
	Status status = Status.DETAILS_CAPTURED
	String createdBy
	Date createdDate
	String verifiedBy
	Date verifiedDate
	String lastUpdatedBy
	Date lastUpdatedDate
	

	Referral referral

	static embedded = ['referral']

	static constraints = {
		name()
		photo(maxSize: 4096000 /* 4K */)
		photoType(nullable:true)
		fatherName()
		drivingLicenseNumber()
		licensePlaceOfIssue()
		drivingLicenseExpiryDate()
		voterIdProof(nullable:true)
		aadharIdProof(nullable:true)
		panIdProof(nullable:true)
		passportNumberIdProof(nullable:true)

		dateOfBirth()
		gender inList:[
			"Male",
			"Female",
			"Others"
		]
		numberOfDependents(nullable:true)

		placeOfBirth(nullable:true)
		criminalRecord(nullable:true, maxSize:1000)
		currentAddress(nullable:true, maxSize:1000)
		permanentAddress(nullable:true, maxSize:1000)

		mobileNumber()
		mobileNumberRegistrationPlace(nullable:true)
		landLineNumber(nullable:true)

		driverType inList:[
			"Employed/Contracted",
			"Individual"
		]

		listOfSchoolsWorking(nullable:true,maxSize: 1000)

		vehicleOwnerName(nullable:true)
		vehicleDetails(nullable:true)
		vehicleOwnerAddress(nullable:true, maxSize:1000)
		vehicleRegistrationNumber(nullable:true)
		referral nullable:true
		status()
		createdBy nullable:true
		createdDate nullable:true
		verifiedBy nullable:true
		verifiedDate nullable:true
		lastUpdatedBy nullable:true
		lastUpdatedDate nullable:true
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

