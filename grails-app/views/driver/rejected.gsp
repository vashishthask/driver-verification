
<%@ page import="com.amigo.verifydriver.Driver" %>
<%@ page import="com.amigo.verifydriver.Constants" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'driver.label', default: 'Driver')}" />
		<g:set var="app_targetUrl" value="${session.getAttribute('spring.security.targetUrl')}" scope="request" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="fp.js"/>
		<asset:stylesheet src="fp.css"/>
	</head>
	<body>
		<a href="#list-driver" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="<%=request.contextPath%>${app_targetUrl}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="index"><g:message code="default.list.unverified.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="verified"><g:message code="default.list.verified.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-driver" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.rejected.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					    <g:sortableColumn property="id" title="${message(code: 'driver.id.label', default: 'Id')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'driver.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="photo" title="${message(code: 'driver.photo.label', default: 'Photo')}" />
					
						<g:sortableColumn property="drivingLicenseNumber" title="${message(code: 'driver.drivingLicenseNumber.label', default: 'Driving License Number')}" />
					
						<g:sortableColumn property="mobileNumber" title="${message(code: 'driver.mobileNumber.label', default: 'Mobile Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${driverInstanceList}" status="i" var="driverInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					    <td>${fieldValue(bean: driverInstance, field: "id")}</td>
					
						<td><g:link action="show" id="${driverInstance.id}">${fieldValue(bean: driverInstance, field: "name")}</g:link></td>
					
						<td><img class="avatar"
						src="${createLink(controller:'driver', action:'avatar_image', id:driverInstance.ident())}" /></td>
										
						<td>${fieldValue(bean: driverInstance, field: "drivingLicenseNumber")}</td>
					
						<td>${fieldValue(bean: driverInstance, field: "mobileNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${driverInstanceCount == null ? Driver.count(): driverInstanceCount}" maxsteps="${Constants.PAGE_SIZE}" params="${filterParams}" />
				<filterpane:filterButton text="Filter Results" />
			</div>
			<g:if test="${driverInstanceList}">
			    <export:formats formats="['excel', 'pdf']" />
			</g:if>
		</div>
		<filterpane:filterPane domain="com.amigo.verifydriver.Driver" 
			filterProperties="name,mobileNumber,drivingLicenseNumber,voterIdProof,aadharIdProof"
			additionalProperties="id" action="filterRejected"/>	</body>
</html>
