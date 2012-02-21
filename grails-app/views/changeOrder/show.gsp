
<%@ page import="com.parago.pmo.ChangeOrder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeOrder.label', default: 'ChangeOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-changeOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-changeOrder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list changeOrder">
			
				<g:if test="${changeOrderInstance?.changeOrderName}">
				<li class="fieldcontain">
					<span id="changeOrderName-label" class="property-label"><g:message code="changeOrder.changeOrderName.label" default="Change Order Name" /></span>
					
						<span class="property-value" aria-labelledby="changeOrderName-label"><g:fieldValue bean="${changeOrderInstance}" field="changeOrderName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeOrderInstance?.link}">
				<li class="fieldcontain">
					<span id="link-label" class="property-label"><g:message code="changeOrder.link.label" default="Link" /></span>
					
						<span class="property-value" aria-labelledby="link-label"><g:fieldValue bean="${changeOrderInstance}" field="link"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeOrderInstance?.projectInfo}">
				<li class="fieldcontain">
					<span id="projectInfo-label" class="property-label"><g:message code="changeOrder.projectInfo.label" default="Project Info" /></span>
					
						<span class="property-value" aria-labelledby="projectInfo-label"><g:link controller="projectInfo" action="show" id="${changeOrderInstance?.projectInfo?.id}">${changeOrderInstance?.projectInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${changeOrderInstance?.id}" />
					<g:link class="edit" action="edit" id="${changeOrderInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
