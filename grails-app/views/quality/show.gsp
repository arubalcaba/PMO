
<%@ page import="com.parago.pmo.Quality" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quality.label', default: 'Quality')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-quality" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-quality" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list quality">
			
				<g:if test="${qualityInstance?.numberOfQualityMeasures}">
				<li class="fieldcontain">
					<span id="numberOfQualityMeasures-label" class="property-label"><g:message code="quality.numberOfQualityMeasures.label" default="Number Of Quality Measures" /></span>
					
						<span class="property-value" aria-labelledby="numberOfQualityMeasures-label"><g:fieldValue bean="${qualityInstance}" field="numberOfQualityMeasures"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${qualityInstance?.numberOfQualityMeasuresNotMet}">
				<li class="fieldcontain">
					<span id="numberOfQualityMeasuresNotMet-label" class="property-label"><g:message code="quality.numberOfQualityMeasuresNotMet.label" default="Number Of Quality Measures Not Met" /></span>
					
						<span class="property-value" aria-labelledby="numberOfQualityMeasuresNotMet-label"><g:fieldValue bean="${qualityInstance}" field="numberOfQualityMeasuresNotMet"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${qualityInstance?.overallQualityRating}">
				<li class="fieldcontain">
					<span id="overallQualityRating-label" class="property-label"><g:message code="quality.overallQualityRating.label" default="Overall Quality Rating" /></span>
					
						<span class="property-value" aria-labelledby="overallQualityRating-label"><g:fieldValue bean="${qualityInstance}" field="overallQualityRating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${qualityInstance?.qualityRating}">
				<li class="fieldcontain">
					<span id="qualityRating-label" class="property-label"><g:message code="quality.qualityRating.label" default="Quality Rating" /></span>
					
						<span class="property-value" aria-labelledby="qualityRating-label"><g:fieldValue bean="${qualityInstance}" field="qualityRating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${qualityInstance?.projectInfo}">
				<li class="fieldcontain">
					<span id="projectInfo-label" class="property-label"><g:message code="quality.projectInfo.label" default="Project Info" /></span>
					
						<span class="property-value" aria-labelledby="projectInfo-label"><g:link controller="projectInfo" action="show" id="${qualityInstance?.projectInfo?.id}">${qualityInstance?.projectInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${qualityInstance?.id}" />
					<g:link class="edit" action="edit" id="${qualityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
