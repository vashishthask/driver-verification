<%@ page import="com.amigo.verifydriver.Driver" %>



<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="driver.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${driverInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="driver.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="photo" required="" name="photo" />

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'fatherName', 'error')} required">
	<label for="fatherName">
		<g:message code="driver.fatherName.label" default="Father Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fatherName" required="" value="${driverInstance?.fatherName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'drivingLicenseNumber', 'error')} required">
	<label for="drivingLicenseNumber">
		<g:message code="driver.drivingLicenseNumber.label" default="Driving License Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="drivingLicenseNumber" required="" value="${driverInstance?.drivingLicenseNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'licensePlaceOfIssue', 'error')} required">
	<label for="licensePlaceOfIssue">
		<g:message code="driver.licensePlaceOfIssue.label" default="License Place Of Issue" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="licensePlaceOfIssue" required="" value="${driverInstance?.licensePlaceOfIssue}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'drivingLicenseExpiryDate', 'error')} required">
	<label for="drivingLicenseExpiryDate">
		<g:message code="driver.drivingLicenseExpiryDate.label" default="Driving License Expiry Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="drivingLicenseExpiryDate" precision="day"  value="${driverInstance?.drivingLicenseExpiryDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'voterIdProof', 'error')} ">
	<label for="voterIdProof">
		<g:message code="driver.voterIdProof.label" default="Voter Id Proof" />
		
	</label>
	<g:textField name="voterIdProof" value="${driverInstance?.voterIdProof}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'aadharIdProof', 'error')} ">
	<label for="aadharIdProof">
		<g:message code="driver.aadharIdProof.label" default="Aadhar Id Proof" />
		
	</label>
	<g:textField name="aadharIdProof" value="${driverInstance?.aadharIdProof}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'panIdProof', 'error')} ">
	<label for="panIdProof">
		<g:message code="driver.panIdProof.label" default="Pan Id Proof" />
		
	</label>
	<g:textField name="panIdProof" value="${driverInstance?.panIdProof}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'passportNumberIdProof', 'error')} ">
	<label for="passportNumberIdProof">
		<g:message code="driver.passportNumberIdProof.label" default="Passport Number Id Proof" />
		
	</label>
	<g:textField name="passportNumberIdProof" value="${driverInstance?.passportNumberIdProof}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth">
		<g:message code="driver.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
		
	</label>
	<g:datePicker name="dateOfBirth" precision="day" required=""  value="${driverInstance?.dateOfBirth}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="driver.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${driverInstance.constraints.gender.inList}" required="" value="${driverInstance?.gender}" valueMessagePrefix="driver.gender"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'numberOfDependents', 'error')} ">
	<label for="numberOfDependents">
		<g:message code="driver.numberOfDependents.label" default="Number Of Dependents" />
	</label>
	<g:field name="numberOfDependents" type="number" value="${driverInstance.numberOfDependents}" />

</div>


<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'placeOfBirth', 'error')} ">
	<label for="placeOfBirth">
		<g:message code="driver.placeOfBirth.label" default="Place Of Birth" />
		
	</label>
	<g:textField name="placeOfBirth" value="${driverInstance?.placeOfBirth}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'criminalRecord', 'error')} ">
	<label for="criminalRecord">
		<g:message code="driver.criminalRecord.label" default="Criminal Record" />
		
	</label>
	<g:textArea name="criminalRecord" cols="40" rows="5" maxlength="1000" value="${driverInstance?.criminalRecord}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'currentAddress', 'error')} ">
	<label for="currentAddress">
		<g:message code="driver.currentAddress.label" default="Current Address" />
		
	</label>
	<g:textArea name="currentAddress" cols="40" rows="5" maxlength="1000" value="${driverInstance?.currentAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'permanentAddress', 'error')} ">
	<label for="permanentAddress">
		<g:message code="driver.permanentAddress.label" default="Permanent Address" />
		
	</label>
	<g:textArea name="permanentAddress" cols="40" rows="5" maxlength="1000" value="${driverInstance?.permanentAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'mobileNumber', 'error')} required">
	<label for="mobileNumber">
		<g:message code="driver.mobileNumber.label" default="Mobile Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mobileNumber" required="" value="${driverInstance?.mobileNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'mobileNumberRegistrationPlace', 'error')}">
	<label for="mobileNumberRegistrationPlace">
		<g:message code="driver.mobileNumberRegistrationPlace.label" default="Mobile Number Registration Place" />
	</label>
	<g:textField name="mobileNumberRegistrationPlace" value="${driverInstance?.mobileNumberRegistrationPlace}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'landLineNumber', 'error')} ">
	<label for="landLineNumber">
		<g:message code="driver.landLineNumber.label" default="Land Line Number" />
		
	</label>
	<g:textField name="landLineNumber" value="${driverInstance?.landLineNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'driverType', 'error')} required">
	<label for="driverType">
		<g:message code="driver.driverType.label" default="Driver Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="driverType" from="${driverInstance.constraints.driverType.inList}" required="" value="${driverInstance?.driverType}" valueMessagePrefix="driver.driverType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'listOfSchoolsWorking', 'error')} ">
	<label for="listOfSchoolsWorking">
		<g:message code="driver.listOfSchoolsWorking.label" default="List Of Schools Working" />
	</label>
	<g:textArea name="listOfSchoolsWorking" cols="40" rows="5" maxlength="1000" value="${driverInstance?.listOfSchoolsWorking}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'vehicleOwnerName', 'error')} ">
	<label for="vehicleOwnerName">
		<g:message code="driver.vehicleOwnerName.label" default="Vehicle Owner Name" />
	</label>
	<g:textField name="vehicleOwnerName" value="${driverInstance?.vehicleOwnerName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'vehicleDetails', 'error')} ">
	<label for="vehicleDetails">
		<g:message code="driver.vehicleDetails.label" default="Vehicle Details" />
	</label>
	<g:textField name="vehicleDetails" value="${driverInstance?.vehicleDetails}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'vehicleRegistrationNumber', 'error')} ">
	<label for="vehicleRegistrationNumber">
		<g:message code="driver.vehicleRegistrationNumber.label" default="Vehicle Registration Number" />
	</label>
	<g:textField name="vehicleRegistrationNumber" value="${driverInstance?.vehicleRegistrationNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'vehicleOwnerAddress', 'error')} ">
	<label for="vehicleOwnerAddress">
		<g:message code="driver.vehicleOwnerAddress.label" default="Vehicle Owner Address" />
		
	</label>
	<g:textArea name="vehicleOwnerAddress" cols="40" rows="5" maxlength="1000" value="${driverInstance?.vehicleOwnerAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'referral.referralLandLineNumber', 'error')} ">
	<label for="referral.referralLandLineNumber">
		<g:message code="driver.referral.referralLandLineNumber.label" default="Referral Land Line Number" />
		
	</label>
	<g:textField name="referral.referralLandLineNumber" value="${driverInstance.referral?.referralLandLineNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'referral.referralMobilePhoneNumber', 'error')}">
	<label for="referral.referralMobilePhoneNumber">
		<g:message code="driver.referral.referralMobilePhoneNumber.label" default="Referral Mobile Phone Number" />
	</label>
	<g:textField name="referral.referralMobilePhoneNumber" value="${driverInstance.referral?.referralMobilePhoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'referral.referralName', 'error')} ">
	<label for="referral.referralName">
		<g:message code="driver.referral.referralName.label" default="Referral Name" />
	</label>
	<g:textField name="referral.referralName" value="${driverInstance.referral?.referralName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'referral.referralPhoto', 'error')} ">
	<label for="referral.referralPhoto">
		<g:message code="driver.referral.referralPhoto.label" default="Referral Photo" />
		
	</label>
	<input type="file" id="referralPhoto" name="referral.referralPhoto" />

</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'referral.relation', 'error')} ">
	<label for="referral.relation">
		<g:message code="driver.referral.relation.label" default="Relation" />
	</label>
	<g:textField name="referral.relation" value="${driverInstance.referral?.relation}"/>

</div>
</fieldset>
