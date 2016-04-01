<%@ page import="com.amigo.verifydriver.DriverDetailsFromCitizen" %>



<div class="fieldcontain ${hasErrors(bean: driverDetailsFromCitizenInstance, field: 'driverName', 'error')} required">
	<label for="driverName">
		<g:message code="driverDetailsFromCitizen.driverName.label" default="Driver Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="driverName" required="" value="${driverDetailsFromCitizenInstance?.driverName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverDetailsFromCitizenInstance, field: 'drivingLicenseNumber', 'error')} ">
	<label for="drivingLicenseNumber">
		<g:message code="driverDetailsFromCitizen.drivingLicenseNumber.label" default="Driving License Number" />
		
	</label>
	<g:textField name="drivingLicenseNumber" value="${driverDetailsFromCitizenInstance?.drivingLicenseNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverDetailsFromCitizenInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="driverDetailsFromCitizen.photo.label" default="Photo" />
		
	</label>
	<input type="file" id="photo" name="photo" />

</div>


<div class="fieldcontain ${hasErrors(bean: driverDetailsFromCitizenInstance, field: 'driverPhoneNumber', 'error')} ">
	<label for="driverPhoneNumber">
		<g:message code="driverDetailsFromCitizen.driverPhoneNumber.label" default="Driver Phone Number" />
		
	</label>
	<g:textField name="driverPhoneNumber" value="${driverDetailsFromCitizenInstance?.driverPhoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverDetailsFromCitizenInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="driverDetailsFromCitizen.address.label" default="Address" />
		
	</label>
	<g:textArea name="address" cols="40" rows="5" maxlength="1000" value="${driverDetailsFromCitizenInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverDetailsFromCitizenInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="driverDetailsFromCitizen.createdBy.label" default="Submitter Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="createdBy" required="" value="${driverDetailsFromCitizenInstance?.createdBy}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: driverDetailsFromCitizenInstance, field: 'submitterPhoneNumber', 'error')} ">
	<label for="submitterPhoneNumber">
		<g:message code="driverDetailsFromCitizen.submitterPhoneNumber.label" default="Submitter Phone Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="submitterPhoneNumber" required="" value="${driverDetailsFromCitizenInstance?.submitterPhoneNumber}"/>

</div>
<div class="fieldcontain ">
    <label for="captcha">
    	<g:message code="captcha.message.label" default="Type the text"/>
    	<span class="required-indicator">*</span>
    </label>
    <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}" />
	<g:textField name="captcha" required="" />
</div>

