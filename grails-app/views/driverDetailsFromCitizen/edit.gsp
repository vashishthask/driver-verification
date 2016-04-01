<%@ page import="com.amigo.verifydriver.DriverDetailsFromCitizen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'driverDetailsFromCitizen.label', default: 'Driver Details')}" />
		<g:set var="app_targetUrl" value="${session.getAttribute('spring.security.targetUrl')}" scope="request" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-driverDetailsFromCitizen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="home" href="${app_targetUrl}"><g:message code="default.home.label"/></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-driverDetailsFromCitizen" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${driverDetailsFromCitizenInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${driverDetailsFromCitizenInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:driverDetailsFromCitizenInstance, action:'update']" method="POST"  enctype="multipart/form-data">
				<g:hiddenField name="version" value="${driverDetailsFromCitizenInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
