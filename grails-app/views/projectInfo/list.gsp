
<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'DT_bootstrap.css')}" type="text/css">
        <script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"  type="text/javascript"></script>
        <script  rel="javascript" src="${resource(dir: 'js', file: 'DT_bootstrap.js')}"  type="text/javascript"></script>
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
				
				<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
					<thead>

						<tr>
							<th><g:message code="projectInfo.projectName.label" default="Project Name" /></th>
                            <th><g:message code="projectInfo.projectType.label" default="Project Type" /></th>
                            <th><g:message code="projectInfo.projectCode.label" default="Project Code" /></th>
                            <th><g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" /></th>
                            <th><g:message code="projectInfo.scrumMaster.label" default="Scrum Master" /></th>
                            <th><g:message code="projectInfo.status.label" default="Status" /></th>
                            <th><g:message code="projectInfo.priority.label" default="Priority" /></th>
                            <th>Action</th>

                            %{--<g:sortableColumn property="projectName" title="${message(code: 'projectInfo.projectName.label', default: 'Project Name')}" />
						
							<g:sortableColumn property="projectType" title="${message(code: 'projectInfo.projectType.label', default: 'Project Type')}" />
						
							<g:sortableColumn property="projectCode" title="${message(code: 'projectInfo.projectCode.label', default: 'Project Code')}" />

                            <g:sortableColumn property="deliveryManager" title="${message(code: 'projectInfo.deliveryManager.label', default: 'Delivery Manager')}" />

							<g:sortableColumn property="scrumMaster" title="${message(code: 'projectInfo.scrumMaster.label', default: 'Scrum Master')}" />

                            <g:sortableColumn property="status" title="${message(code: 'projectInfo.status.label', default: 'Status')}" />

                           <g:sortableColumn property="priority" title="${message(code: 'projectInfo.priority.label', default: 'Priority')}" />--}%
						</tr>
					</thead>
					<tbody>
					<g:each in="${projectInfoInstanceList}" var="projectInfoInstance">
					    <g:if test="${projectInfoInstance?.billable_flag.equalsIgnoreCase("Y")}">
						<tr>
						
							<td><g:link action="show" id="${projectInfoInstance.id}" >${fieldValue(bean: projectInfoInstance, field: "projectName")}</g:link></td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "projectType")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "projectCode")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "deliveryManager")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "scrumMaster")}</td>
						
							<td>${fieldValue(bean: projectInfoInstance, field: "status")}</td>
                            <td>${fieldValue(bean: projectInfoInstance, field: "priority")}</td>
						
							<td class="link">
								<g:link action="show" id="${projectInfoInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
						</g:if>
					</g:each>
					</tbody>
				</table>
				%{--<div class="pagination">
					<bootstrap:paginate total="${projectInfoInstanceTotal}" />
				</div>--}%
			</div>

		</div>
	</body>
</html>
