
<%@ page import="com.parago.pmo.QualityTarget" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'qualityTarget.label', default: 'QualityTarget')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-qualityTarget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-qualityTarget" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list qualityTarget">
			
				<g:if test="${qualityTargetInstance?.qualityMeasurementProcess}">
				<li class="fieldcontain">
					<span id="qualityMeasurementProcess-label" class="property-label"><g:message code="qualityTarget.qualityMeasurementProcess.label" default="Quality Measurement Process" /></span>
					
						<span class="property-value" aria-labelledby="qualityMeasurementProcess-label"><g:fieldValue bean="${qualityTargetInstance}" field="qualityMeasurementProcess"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${qualityTargetInstance?.qualityTarget}">
				<li class="fieldcontain">
					<span id="qualityTarget-label" class="property-label"><g:message code="qualityTarget.qualityTarget.label" default="Quality Target" /></span>
					
						<span class="property-value" aria-labelledby="qualityTarget-label"><g:fieldValue bean="${qualityTargetInstance}" field="qualityTarget"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${qualityTargetInstance?.id}" />
					<g:link class="edit" action="edit" id="${qualityTargetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
