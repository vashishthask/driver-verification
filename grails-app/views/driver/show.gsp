<%@ page import="com.amigo.verifydriver.Driver"%>
<%@ page import="com.amigo.verifydriver.Status"%>
<%@ page import="grails.plugin.springsecurity.SecurityTagLib" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'driver.label', default: 'Driver')}" />
	

<g:set var="state" value="${driverInstance?.status.getState()}" />
	
<g:set var="entityState"
	value="${message(code: 'state.label', default:state )}" />
<g:set var="app_targetUrl" value="${session.getAttribute('spring.security.targetUrl')}" scope="request" />	

<g:set var="referralLabel"
	value="${message(code: 'referral.label', default: 'Referral')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-driver" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
				<li><a class="home" href="<%=request.contextPath%>${app_targetUrl}"><g:message code="default.home.label"/></a></li>

			<li><g:link class="list" action="index">
					<g:message code="default.list.unverified.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="list" action="verified">
					<g:message code="default.list.verified.label" args="[entityName]" />
				</g:link></li>	
			<li><g:link class="list" action="rejected"><g:message code="default.list.rejected.label" args="[entityName]" /></g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
			</ul>
	</div>
	<div id="show-driver" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.details.state.label" args="[entityState, entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list driver">

			<g:if test="${driverInstance?.name}">
				<li class="fieldcontain"><span id="name-label"
					class="property-label"><g:message code="driver.name.label"
							default="Name" /></span> <span class="property-value"
					aria-labelledby="name-label"><g:fieldValue
							bean="${driverInstance}" field="name" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="driver.photo.label" default="Photo" /></span>
					<span class="property-value" aria-labelledby="relation-label"><img class="avatar" src="${createLink(controller:'driver', action:'avatar_image', id:driverInstance.ident())}" /></span>
					
					
				</li>
			</g:if>

			<g:if test="${driverInstance?.fatherName}">
				<li class="fieldcontain"><span id="fatherName-label"
					class="property-label"><g:message
							code="driver.fatherName.label" default="Father Name" /></span> <span
					class="property-value" aria-labelledby="fatherName-label"><g:fieldValue
							bean="${driverInstance}" field="fatherName" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.drivingLicenseNumber}">
				<li class="fieldcontain"><span id="drivingLicenseNumber-label"
					class="property-label"><g:message
							code="driver.drivingLicenseNumber.label"
							default="Driving License Number" /></span> <span class="property-value"
					aria-labelledby="drivingLicenseNumber-label"><g:fieldValue
							bean="${driverInstance}" field="drivingLicenseNumber" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.licensePlaceOfIssue}">
				<li class="fieldcontain"><span id="licensePlaceOfIssue-label"
					class="property-label"><g:message
							code="driver.licensePlaceOfIssue.label"
							default="License Place Of Issue" /></span> <span class="property-value"
					aria-labelledby="licensePlaceOfIssue-label"><g:fieldValue
							bean="${driverInstance}" field="licensePlaceOfIssue" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.drivingLicenseExpiryDate}">
				<li class="fieldcontain"><span
					id="drivingLicenseExpiryDate-label" class="property-label"><g:message
							code="driver.drivingLicenseExpiryDate.label"
							default="Driving License Expiry Date" /></span> <span
					class="property-value"
					aria-labelledby="drivingLicenseExpiryDate-label"><g:formatDate
							date="${driverInstance?.drivingLicenseExpiryDate}" /></span></li>
			</g:if>
			
			<g:if test="${driverInstance?.voterIdProof}">
				<li class="fieldcontain"><span id="voterIdProof-label"
					class="property-label"><g:message
							code="driver.voterIdProof.label" default="Voter Id Proof" /></span> <span
					class="property-value" aria-labelledby="voterIdProof-label"><g:fieldValue
							bean="${driverInstance}" field="voterIdProof" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.aadharIdProof}">
				<li class="fieldcontain"><span id="aadharIdProof-label"
					class="property-label"><g:message
							code="driver.aadharIdProof.label" default="Aadhar Id Proof" /></span> <span
					class="property-value" aria-labelledby="aadharIdProof-label"><g:fieldValue
							bean="${driverInstance}" field="aadharIdProof" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.panIdProof}">
				<li class="fieldcontain"><span id="panIdProof-label"
					class="property-label"><g:message
							code="driver.panIdProof.label" default="Pan Id Proof" /></span> <span
					class="property-value" aria-labelledby="panIdProof-label"><g:fieldValue
							bean="${driverInstance}" field="panIdProof" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.passportNumberIdProof}">
				<li class="fieldcontain"><span id="passportNumberIdProof-label"
					class="property-label"><g:message
							code="driver.passportNumberIdProof.label"
							default="Passport Number Id Proof" /></span> <span
					class="property-value"
					aria-labelledby="passportNumberIdProof-label"><g:fieldValue
							bean="${driverInstance}" field="passportNumberIdProof" /></span></li>
			</g:if>


			<g:if test="${driverInstance?.dateOfBirth}">
				<li class="fieldcontain"><span id="dateOfBirth-label"
					class="property-label"><g:message
							code="driver.dateOfBirth.label" default="Date Of Birth" /></span> <span
					class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate
							date="${driverInstance?.dateOfBirth}" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.gender}">
				<li class="fieldcontain"><span id="gender-label"
					class="property-label"><g:message code="driver.gender.label"
							default="Gender" /></span> <span class="property-value"
					aria-labelledby="gender-label"><g:fieldValue
							bean="${driverInstance}" field="gender" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.numberOfDependents}">
				<li class="fieldcontain"><span id="numberOfDependents-label"
					class="property-label"><g:message
							code="driver.numberOfDependents.label"
							default="Number Of Dependents" /></span> <span class="property-value"
					aria-labelledby="numberOfDependents-label"><g:fieldValue
							bean="${driverInstance}" field="numberOfDependents" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.placeOfBirth}">
				<li class="fieldcontain"><span id="placeOfBirth-label"
					class="property-label"><g:message
							code="driver.placeOfBirth.label" default="Place Of Birth" /></span> <span
					class="property-value" aria-labelledby="placeOfBirth-label"><g:fieldValue
							bean="${driverInstance}" field="placeOfBirth" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.criminalRecord}">
				<li class="fieldcontain"><span id="criminalRecord-label"
					class="property-label"><g:message
							code="driver.criminalRecord.label" default="Criminal Record" /></span>

					<span class="property-value" aria-labelledby="criminalRecord-label"><g:fieldValue
							bean="${driverInstance}" field="criminalRecord" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.currentAddress}">
				<li class="fieldcontain"><span id="currentAddress-label"
					class="property-label"><g:message
							code="driver.currentAddress.label" default="Current Address" /></span>

					<span class="property-value" aria-labelledby="currentAddress-label"><g:fieldValue
							bean="${driverInstance}" field="currentAddress" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.permanentAddress}">
				<li class="fieldcontain"><span id="permanentAddress-label"
					class="property-label"><g:message
							code="driver.permanentAddress.label" default="Permanent Address" /></span>

					<span class="property-value"
					aria-labelledby="permanentAddress-label"><g:fieldValue
							bean="${driverInstance}" field="permanentAddress" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.mobileNumber}">
				<li class="fieldcontain"><span id="mobileNumber-label"
					class="property-label"><g:message
							code="driver.mobileNumber.label" default="Mobile Number" /></span> <span
					class="property-value" aria-labelledby="mobileNumber-label"><g:fieldValue
							bean="${driverInstance}" field="mobileNumber" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.mobileNumberRegistrationPlace}">
				<li class="fieldcontain"><span
					id="mobileNumberRegistrationPlace-label" class="property-label"><g:message
							code="driver.mobileNumberRegistrationPlace.label"
							default="Mobile Number Registration Place" /></span> <span
					class="property-value"
					aria-labelledby="mobileNumberRegistrationPlace-label"><g:fieldValue
							bean="${driverInstance}" field="mobileNumberRegistrationPlace" /></span>

				</li>
			</g:if>

			<g:if test="${driverInstance?.landLineNumber}">
				<li class="fieldcontain"><span id="landLineNumber-label"
					class="property-label"><g:message
							code="driver.landLineNumber.label" default="Land Line Number" /></span>

					<span class="property-value" aria-labelledby="landLineNumber-label"><g:fieldValue
							bean="${driverInstance}" field="landLineNumber" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.driverType}">
				<li class="fieldcontain"><span id="driverType-label"
					class="property-label"><g:message
							code="driver.driverType.label" default="Driver Type" /></span> <span
					class="property-value" aria-labelledby="driverType-label"><g:fieldValue
							bean="${driverInstance}" field="driverType" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.listOfSchoolsWorking}">
				<li class="fieldcontain"><span id="listOfSchoolsWorking-label"
					class="property-label"><g:message
							code="driver.listOfSchoolsWorking.label"
							default="List Of Schools Working" /></span> <span
					class="property-value" aria-labelledby="listOfSchoolsWorking-label"><g:fieldValue
							bean="${driverInstance}" field="listOfSchoolsWorking" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.vehicleOwnerName}">
				<li class="fieldcontain"><span id="vehicleOwnerName-label"
					class="property-label"><g:message
							code="driver.vehicleOwnerName.label" default="Vehicle Owner Name" /></span>

					<span class="property-value"
					aria-labelledby="vehicleOwnerName-label"><g:fieldValue
							bean="${driverInstance}" field="vehicleOwnerName" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.vehicleDetails}">
				<li class="fieldcontain"><span id="vehicleDetails-label"
					class="property-label"><g:message
							code="driver.vehicleDetails.label" default="Vehicle Details" /></span>

					<span class="property-value" aria-labelledby="vehicleDetails-label"><g:fieldValue
							bean="${driverInstance}" field="vehicleDetails" /></span></li>
			</g:if>
			
			<g:if test="${driverInstance?.vehicleRegistrationNumber}">
				<li class="fieldcontain"><span id="vehicleRegistrationNumber-label"
					class="property-label"><g:message
							code="driver.vehicleRegistrationNumber.label" default="Vehicle Registration Number" /></span>

					<span class="property-value" aria-labelledby="vehicleRegistrationNumber-label"><g:fieldValue
							bean="${driverInstance}" field="vehicleRegistrationNumber" /></span></li>
			</g:if>

			<g:if test="${driverInstance?.vehicleOwnerAddress}">
				<li class="fieldcontain"><span id="vehicleOwnerAddress-label"
					class="property-label"><g:message
							code="driver.vehicleOwnerAddress.label"
							default="Vehicle Owner Address" /></span> <span class="property-value"
					aria-labelledby="vehicleOwnerAddress-label"><g:fieldValue
							bean="${driverInstance}" field="vehicleOwnerAddress" /></span></li>
			</g:if>
		</ol>
		<g:if test="${driverInstance?.referral}">
			<h1>
				<g:message code="default.details.label" args="[referralLabel]" />
			</h1>
			<ol class="property-list referral">


				<g:if test="${driverInstance.referral?.referralLandLineNumber}">
					<li class="fieldcontain"><span id="referral-label"
						class="property-label"><g:message
								code="driver.referral.referralLandLineNumber.label"
								default="Land Line Number" /></span> <span class="property-value"
						aria-labelledby="referralLandLineNumber-label"><g:fieldValue
								bean="${driverInstance}" field="referral.referralLandLineNumber" /></span></li>
				</g:if>

				<g:if test="${driverInstance.referral?.referralMobilePhoneNumber}">
					<li class="fieldcontain"><span id="referral-label"
						class="property-label"><g:message
								code="driver.referral.referralMobilePhoneNumber.label"
								default="Mobile Number" /></span> <span class="property-value"
						aria-labelledby="referralMobilePhoneNumber-label"><g:fieldValue
								bean="${driverInstance}"
								field="referral.referralMobilePhoneNumber" /></span></li>
				</g:if>

				<g:if test="${driverInstance.referral?.referralName}">
					<li class="fieldcontain"><span id="referral-label"
						class="property-label"><g:message
								code="driver.referral.referralName.label"
								default="Referral Name" /></span> <span class="property-value"
						aria-labelledby="referralName-label"><g:fieldValue
								bean="${driverInstance}" field="referral.referralName" /></span></li>
				</g:if>

				<g:if test="${driverInstance.referral?.referralPhoto}">
					<li class="fieldcontain"><span id="referral-label"
						class="property-label"><g:message
								code="driver.referral.referralPhoto.label"
								default="Referral Photo" /></span> <span class="property-value"
						aria-labelledby="referralPhoto-label"><img class="avatar"
							src="${createLink(controller:'driver', action:'avatar_image2', id:driverInstance.ident())}" /></span></li>
				</g:if>

				<g:if test="${driverInstance.referral?.relation}">
					<li class="fieldcontain"><span id="referral-label"
						class="property-label"><g:message
								code="driver.referral.relation.label" default="Relation" /></span> <span
						class="property-value" aria-labelledby="relation-label"><g:fieldValue
								bean="${driverInstance}" field="referral.relation" /></span></li>
				</g:if>
		</g:if>

		</ol>
		<g:if test="${driverInstance.status != Status.VERIFIED}">
		<g:form url="[resource:driverInstance]"
			method="POST">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${driverInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<sec:ifAllGranted roles="ROLE_VERIFIER">
				    <g:actionSubmit class="verify" action="verify" name="Verify"
					    value="${message(code: 'default.button.verify.label', default: 'Verify')}"
					    onclick="return confirm('${message(code: 'default.button.verify.confirm.message', default: 'Are you sure?')}');" />
				</sec:ifAllGranted>
				<sec:ifAllGranted roles="ROLE_VERIFIER">
				    <g:actionSubmit class="reject" action="reject" name="Reject"
					    value="${message(code: 'default.button.reject.label', default: 'Reject')}"
					    onclick="return confirm('${message(code: 'default.button.reject.confirm.message', default: 'Are you sure?')}');" />
				</sec:ifAllGranted>
				
				<g:actionSubmit class="delete" action="delete" name="Delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
		</g:if>
	</div>
</body>
</html>
