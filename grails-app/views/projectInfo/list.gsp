
<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="projectName" title="${message(code: 'projectInfo.projectName.label', default: 'Project Name')}" />
						
							<g:sortableColumn property="projectType" title="${message(code: 'projectInfo.projectType.label', default: 'Project Type')}" />
						
							<g:sortableColumn property="projectCode" title="${message(code: 'projectInfo.projectCode.label', default: 'Project Code')}" />
						
							<th class="header"><g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" /></th>
						
							<g:sortableColumn property="scrumMaster" title="${message(code: 'projectInfo.scrumMaster.label', default: 'Scrum Master')}" />
						
							<th class="header"><g:message code="projectInfo.status.label" default="Status" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${projectInfoInstanceList}" var="projectInfoInstance">
						<tr>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "projectName")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "projectType")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "projectCode")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "deliveryManager")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "scrumMaster")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "status")}</td>
						
							<td class="link">
								<g:link action="show" id="${projectInfoInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${projectInfoInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
