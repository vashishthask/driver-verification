
<%@ page import="com.amigo.verifydriver.DriverDetailsFromCitizen"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'driverDetailsFromCitizen.label', default: 'Driver Details')}" />
<g:set var="entityNameDriver"
	value="${message(code: 'driver.label', default: 'Driver')}" />	
<g:set var="app_targetUrl" value="${session.getAttribute('spring.security.targetUrl')}" scope="request" />	
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-driverDetailsFromCitizen" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
				<li><a class="home" href="<%=request.contextPath%>${app_targetUrl}"><g:message code="default.home.label"/></a></li>

			<sec:ifAllGranted roles="ROLE_EXT_USER">
				<li><g:link class="create" action="create">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
			</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_USER">
				<li><g:link controller="driver" class="create" action="create"><g:message code="default.new.label" args="[entityNameDriver]" /></g:link></li>
				<li><g:link controller="driver" class="list" action="index"><g:message code="default.list.unverified.label" args="[entityNameDriver]" /></g:link></li>
				<li><g:link controller="driver" class="list" action="verified"><g:message code="default.list.verified.label" args="[entityNameDriver]" /></g:link></li>
				<li><g:link controller="driver" class="list" action="rejected"><g:message code="default.list.rejected.label" args="[entityNameDriver]" /></g:link></li>
			</sec:ifAllGranted>
			
		</ul>
	</div>
	<div id="list-driverDetailsFromCitizen" class="content scaffold-list"
		role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>
					<sec:ifAnyGranted roles="ROLE_VERIFIER,ROLE_USER">
						<g:sortableColumn property="createdBy"
							title="${message(code: 'driverDetailsFromCitizen.phoneNumber.label', default: 'Citizen Phone Number')}" />
					</sec:ifAnyGranted>
					<g:sortableColumn property="drivingLicenseNumber"
						title="${message(code: 'driverDetailsFromCitizen.drivingLicenseNumber.label', default: 'Driving License Number')}" />

					<g:sortableColumn property="driverName"
						title="${message(code: 'driverDetailsFromCitizen.driverName.label', default: 'Driver Name')}" />

					<g:sortableColumn property="photo"
						title="${message(code: 'driverDetailsFromCitizen.photo.label', default: 'Photo')}" />

					<g:sortableColumn property="driverPhoneNumber"
						title="${message(code: 'driverDetailsFromCitizen.driverPhoneNumber.label', default: 'Driver Phone Number')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${driverDetailsFromCitizenInstanceList}" status="i"
					var="driverDetailsFromCitizenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<sec:ifAnyGranted roles="ROLE_VERIFIER,ROLE_USER">
							<td>
								${fieldValue(bean: driverDetailsFromCitizenInstance, field: "createdBy")}
							</td>
						</sec:ifAnyGranted>
						<td>
							${fieldValue(bean: driverDetailsFromCitizenInstance, field: "drivingLicenseNumber")}
						</td>

						<td><g:link action="show"
								id="${driverDetailsFromCitizenInstance.id}">
								${fieldValue(bean: driverDetailsFromCitizenInstance, field: "driverName")}
							</g:link></td>

						<td><img class="avatar"
							src="${createLink(controller:'driverDetailsFromCitizen', action:'avatar_image', id:driverDetailsFromCitizenInstance.ident())}" /></td>

						<td>
							${fieldValue(bean: driverDetailsFromCitizenInstance, field: "driverPhoneNumber")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${driverDetailsFromCitizenInstanceCount ?: 0}" />
		</div>
	    <g:if test="${driverDetailsFromCitizenInstanceList}">
		    <export:formats formats="['excel', 'pdf']" />
	    </g:if>
	</div>
</body>
</html>
