
<%@ page import="com.parago.pmo.Risk" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'risk.label', default: 'Risk')}" />
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
						
							<th class="header"><g:message code="risk.projectInfo.label" default="Project Info" /></th>
						
							<g:sortableColumn property="risk" title="${message(code: 'risk.risk.label', default: 'Risk')}" />
						
							<g:sortableColumn property="riskMigrationStrategy" title="${message(code: 'risk.riskMigrationStrategy.label', default: 'Risk Migration Strategy')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${riskInstanceList}" var="riskInstance">
						<tr>
						
							<td>${fieldValue(bean: riskInstance, field: "projectInfo")}</td>
						
							<td>${fieldValue(bean: riskInstance, field: "risk")}</td>
						
							<td>${fieldValue(bean: riskInstance, field: "riskMigrationStrategy")}</td>
						
							<td class="link">
								<g:link action="show" id="${riskInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${riskInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
