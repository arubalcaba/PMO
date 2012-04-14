
<%@ page import="com.parago.pmo.ProjectInvoice" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectInvoice.label', default: 'ProjectInvoice')}" />
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
						
							<g:sortableColumn property="billableAmount" title="${message(code: 'projectInvoice.billableAmount.label', default: 'Billable Amount')}" />
						
							<th class="header"><g:message code="projectInvoice.invoiceStatus.label" default="Invoice Status" /></th>
						
							<g:sortableColumn property="invoiceNote" title="${message(code: 'projectInvoice.invoiceNote.label', default: 'Invoice Note')}" />
						
							<th class="header"><g:message code="projectInvoice.projectInfo.label" default="Project Info" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${projectInvoiceInstanceList}" var="projectInvoiceInstance">
						<tr>
						
							<td>${fieldValue(bean: projectInvoiceInstance, field: "billableAmount")}</td>
						
							<td>${fieldValue(bean: projectInvoiceInstance, field: "invoiceStatus")}</td>
						
							<td>${fieldValue(bean: projectInvoiceInstance, field: "invoiceNote")}</td>
						
							<td>${fieldValue(bean: projectInvoiceInstance, field: "projectInfo")}</td>
						
							<td class="link">
								<g:link action="show" id="${projectInvoiceInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${projectInvoiceInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
