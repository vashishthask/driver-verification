
<%@ page import="com.amigo.verifydriver.DriverDetailsFromCitizen"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'driverDetailsFromCitizen.label', default: 'Driver Details')}" />
<g:set var="entityNameDriver"
	value="${message(code: 'driverDetailsFromCitizen.label', default: 'Driver')}" />
<g:set var="app_targetUrl" value="${session.getAttribute('spring.security.targetUrl')}" scope="request" />	
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-driverDetailsFromCitizen" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
				<li><a class="home" href="<%=request.contextPath%>${app_targetUrl}"><g:message code="default.home.label"/></a></li>

				<li><g:link class="create" action="create">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
			<sec:ifAllGranted roles="ROLE_USER">
				<li><g:link controller="driver" class="list" action="index">
						<g:message code="default.list.unverified.label"
							args="[entityNameDriver]" />
					</g:link></li>
				<li><g:link controller="driver" class="list" action="verified">
						<g:message code="default.list.verified.label"
							args="[entityNameDriver]" />
					</g:link></li>
				<li><g:link controller="driver" class="create" action="create">
						<g:message code="default.new.label" args="[entityNameDriver]" />
					</g:link></li>
			</sec:ifAllGranted>
		</ul>
	</div>
	<div id="show-driverDetailsFromCitizen" class="content scaffold-show"
		role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list driverDetailsFromCitizen">

			<g:if test="${driverDetailsFromCitizenInstance?.driverName}">
				<li class="fieldcontain"><span id="driverName-label"
					class="property-label"><g:message
							code="driverDetailsFromCitizen.driverName.label"
							default="Driver Name" /></span> <span class="property-value"
					aria-labelledby="driverName-label"><g:fieldValue
							bean="${driverDetailsFromCitizenInstance}" field="driverName" /></span>

				</li>
			</g:if>

			<g:if
				test="${driverDetailsFromCitizenInstance?.drivingLicenseNumber}">
				<li class="fieldcontain"><span id="drivingLicenseNumber-label"
					class="property-label"><g:message
							code="driverDetailsFromCitizen.drivingLicenseNumber.label"
							default="Driving License Number" /></span> <span class="property-value"
					aria-labelledby="drivingLicenseNumber-label"><g:fieldValue
							bean="${driverDetailsFromCitizenInstance}"
							field="drivingLicenseNumber" /></span></li>
			</g:if>

			<g:if test="${driverDetailsFromCitizenInstance?.photo}">
				<li class="fieldcontain"><span id="photo-label"
					class="property-label"><g:message
							code="driverDetailsFromCitizen.photo.label" default="Photo" /></span> <span
					class="property-value" aria-labelledby="relation-label"><img
						class="avatar"
						src="${createLink(controller:'driverDetailsFromCitizen', action:'avatar_image', id:driverDetailsFromCitizenInstance.ident())}" /></span>
				</li>
			</g:if>

			<g:if test="${driverDetailsFromCitizenInstance?.driverPhoneNumber}">
				<li class="fieldcontain"><span id="driverPhoneNumber-label"
					class="property-label"><g:message
							code="driverDetailsFromCitizen.driverPhoneNumber.label"
							default="Driver Phone Number" /></span> <span class="property-value"
					aria-labelledby="driverPhoneNumber-label"><g:fieldValue
							bean="${driverDetailsFromCitizenInstance}"
							field="driverPhoneNumber" /></span></li>
			</g:if>


			<g:if test="${driverDetailsFromCitizenInstance?.createdBy}">
				<li class="fieldcontain"><span id="citizenPhoneNumber-label"
					class="property-label"><g:message
							code="driverDetailsFromCitizen.citizenPhoneNumber.label"
							default="Submitter Phone Number" /></span> <span class="property-value"
					aria-labelledby="citizenPhoneNumber-label"><g:fieldValue
							bean="${driverDetailsFromCitizenInstance}" field="submitterPhoneNumber" /></span></li>
			</g:if>


		</ol>
		<g:form
			url="[resource:driverDetailsFromCitizenInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<sec:ifAllGranted roles="ROLE_USER">
					<g:link controller="driver" class="edit" action="adddetails"
						params="[driverDetailsFromCitizenId:driverDetailsFromCitizenInstance.ident()]">
						<g:message code="default.button.adddriverdetails.label"
							default="Add Driver Details" />
					</g:link>
				</sec:ifAllGranted>
				<g:link class="edit" action="edit"
					resource="${driverDetailsFromCitizenInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
