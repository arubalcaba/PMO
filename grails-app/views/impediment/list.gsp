
<%@ page import="com.parago.pmo.Impediment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'impediment.label', default: 'Impediment')}" />
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
						
							<g:sortableColumn property="impediment" title="${message(code: 'impediment.impediment.label', default: 'Impediment')}" />
						
							<g:sortableColumn property="remediationPlan" title="${message(code: 'impediment.remediationPlan.label', default: 'Remediation Plan')}" />
						
							<th class="header"><g:message code="impediment.projectInfo.label" default="Project Info" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${impedimentInstanceList}" var="impedimentInstance">
						<tr>
						
							<td>${fieldValue(bean: impedimentInstance, field: "impediment")}</td>
						
							<td>${fieldValue(bean: impedimentInstance, field: "remediationPlan")}</td>
						
							<td>${fieldValue(bean: impedimentInstance, field: "projectInfo")}</td>
						
							<td class="link">
								<g:link action="show" id="${impedimentInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${impedimentInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
