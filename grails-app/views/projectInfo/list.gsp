
<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="projectName" title="${message(code: 'projectInfo.projectName.label', default: 'Project Name')}" />
					
						<th><g:message code="projectInfo.projectType.label" default="Project Type" /></th>
					
						<th><g:message code="projectInfo.projectCode.label" default="Project Code" /></th>
					
						<th><g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" /></th>
					
						<th><g:message code="projectInfo.scrumMaster.label" default="Scrum Master" /></th>
					
						<th><g:message code="projectInfo.status.label" default="Status" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectInfoInstanceList}" status="i" var="projectInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectInfoInstance.id}">${fieldValue(bean: projectInfoInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectInfoInstance, field: "projectType")}</td>
					
						<td>${fieldValue(bean: projectInfoInstance, field: "projectCode")}</td>
					
						<td>${fieldValue(bean: projectInfoInstance, field: "deliveryManager")}</td>
					
						<td>${fieldValue(bean: projectInfoInstance, field: "scrumMaster")}</td>
					
						<td>${fieldValue(bean: projectInfoInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
