
<%@ page import="com.parago.pmo.Impediment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'impediment.label', default: 'Impediment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-impediment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-impediment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list impediment">
			
				<g:if test="${impedimentInstance?.impediment}">
				<li class="fieldcontain">
					<span id="impediment-label" class="property-label"><g:message code="impediment.impediment.label" default="Impediment" /></span>
					
						<span class="property-value" aria-labelledby="impediment-label"><g:fieldValue bean="${impedimentInstance}" field="impediment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${impedimentInstance?.remediationPlan}">
				<li class="fieldcontain">
					<span id="remediationPlan-label" class="property-label"><g:message code="impediment.remediationPlan.label" default="Remediation Plan" /></span>
					
						<span class="property-value" aria-labelledby="remediationPlan-label"><g:fieldValue bean="${impedimentInstance}" field="remediationPlan"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${impedimentInstance?.projectInfo}">
				<li class="fieldcontain">
					<span id="projectInfo-label" class="property-label"><g:message code="impediment.projectInfo.label" default="Project Info" /></span>
					
						<span class="property-value" aria-labelledby="projectInfo-label"><g:link controller="projectInfo" action="show" id="${impedimentInstance?.projectInfo?.id}">${impedimentInstance?.projectInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${impedimentInstance?.id}" />
					<g:link class="edit" action="edit" id="${impedimentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
