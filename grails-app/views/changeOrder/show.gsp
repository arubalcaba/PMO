
<%@ page import="com.parago.pmo.ChangeOrder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'changeOrder.label', default: 'ChangeOrder')}" />
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
				
					<g:if test="${changeOrderInstance?.changeOrderName}">
						<dt><g:message code="changeOrder.changeOrderName.label" default="Change Order Name" /></dt>
						
							<dd><g:fieldValue bean="${changeOrderInstance}" field="changeOrderName"/></dd>
						
					</g:if>
				
					<g:if test="${changeOrderInstance?.link}">
						<dt><g:message code="changeOrder.link.label" default="Link" /></dt>
						
							<dd><g:fieldValue bean="${changeOrderInstance}" field="link"/></dd>
						
					</g:if>
				
					<g:if test="${changeOrderInstance?.projectInfo}">
						<dt><g:message code="changeOrder.projectInfo.label" default="Project Info" /></dt>
						
							<dd><g:link controller="projectInfo" action="show" id="${changeOrderInstance?.projectInfo?.id}">${changeOrderInstance?.projectInfo?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${changeOrderInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${changeOrderInstance?.id}">
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
