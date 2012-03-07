
<%@ page import="com.parago.pmo.ChangeOrder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'changeOrder.label', default: 'ChangeOrder')}" />
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
						
							<g:sortableColumn property="changeOrderName" title="${message(code: 'changeOrder.changeOrderName.label', default: 'Change Order Name')}" />
						
							<g:sortableColumn property="link" title="${message(code: 'changeOrder.link.label', default: 'Link')}" />
						
							<th class="header"><g:message code="changeOrder.projectInfo.label" default="Project Info" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${changeOrderInstanceList}" var="changeOrderInstance">
						<tr>
						
							<td>${fieldValue(bean: changeOrderInstance, field: "changeOrderName")}</td>
						
							<td>${fieldValue(bean: changeOrderInstance, field: "link")}</td>
						
							<td>${fieldValue(bean: changeOrderInstance, field: "projectInfo")}</td>
						
							<td class="link">
								<g:link action="show" id="${changeOrderInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${changeOrderInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
