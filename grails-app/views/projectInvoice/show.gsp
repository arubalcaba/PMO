
<%@ page import="com.parago.pmo.ProjectInvoice" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectInvoice.label', default: 'ProjectInvoice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
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
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${projectInvoiceInstance?.billableAmount}">
						<dt><g:message code="projectInvoice.billableAmount.label" default="Billable Amount" /></dt>
						
							<dd><g:fieldValue bean="${projectInvoiceInstance}" field="billableAmount"/></dd>
						
					</g:if>
				
					<g:if test="${projectInvoiceInstance?.invoiceStatus}">
						<dt><g:message code="projectInvoice.invoiceStatus.label" default="Invoice Status" /></dt>
						
							<dd><g:link controller="invoiceStatus" action="show" id="${projectInvoiceInstance?.invoiceStatus?.id}">${projectInvoiceInstance?.invoiceStatus?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${projectInvoiceInstance?.invoiceNote}">
						<dt><g:message code="projectInvoice.invoiceNote.label" default="Invoice Note" /></dt>
						
							<dd><g:fieldValue bean="${projectInvoiceInstance}" field="invoiceNote"/></dd>
						
					</g:if>
				
					<g:if test="${projectInvoiceInstance?.projectInfo}">
						<dt><g:message code="projectInvoice.projectInfo.label" default="Project Info" /></dt>
						
							<dd><g:link controller="projectInfo" action="show" id="${projectInvoiceInstance?.projectInfo?.id}">${projectInvoiceInstance?.projectInfo?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${projectInvoiceInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${projectInvoiceInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
