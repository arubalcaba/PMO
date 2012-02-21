
<%@ page import="com.parago.pmo.Risk" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'risk.label', default: 'Risk')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-risk" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-risk" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list risk">
			
				<g:if test="${riskInstance?.projectInfo}">
				<li class="fieldcontain">
					<span id="projectInfo-label" class="property-label"><g:message code="risk.projectInfo.label" default="Project Info" /></span>
					
						<span class="property-value" aria-labelledby="projectInfo-label"><g:link controller="projectInfo" action="show" id="${riskInstance?.projectInfo?.id}">${riskInstance?.projectInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${riskInstance?.risk}">
				<li class="fieldcontain">
					<span id="risk-label" class="property-label"><g:message code="risk.risk.label" default="Risk" /></span>
					
						<span class="property-value" aria-labelledby="risk-label"><g:fieldValue bean="${riskInstance}" field="risk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${riskInstance?.riskMigrationStragety}">
				<li class="fieldcontain">
					<span id="riskMigrationStragety-label" class="property-label"><g:message code="risk.riskMigrationStragety.label" default="Risk Migration Stragety" /></span>
					
						<span class="property-value" aria-labelledby="riskMigrationStragety-label"><g:fieldValue bean="${riskInstance}" field="riskMigrationStragety"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${riskInstance?.id}" />
					<g:link class="edit" action="edit" id="${riskInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
