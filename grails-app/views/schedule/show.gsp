
<%@ page import="com.parago.pmo.Schedule" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-schedule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-schedule" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list schedule">
			
				<g:if test="${scheduleInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="schedule.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${scheduleInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.plannedReleaseDate}">
				<li class="fieldcontain">
					<span id="plannedReleaseDate-label" class="property-label"><g:message code="schedule.plannedReleaseDate.label" default="Planned Release Date" /></span>
					
						<span class="property-value" aria-labelledby="plannedReleaseDate-label"><g:formatDate date="${scheduleInstance?.plannedReleaseDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.actualReleaseDate}">
				<li class="fieldcontain">
					<span id="actualReleaseDate-label" class="property-label"><g:message code="schedule.actualReleaseDate.label" default="Actual Release Date" /></span>
					
						<span class="property-value" aria-labelledby="actualReleaseDate-label"><g:formatDate date="${scheduleInstance?.actualReleaseDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.projectDays}">
				<li class="fieldcontain">
					<span id="projectDays-label" class="property-label"><g:message code="schedule.projectDays.label" default="Project Days" /></span>
					
						<span class="property-value" aria-labelledby="projectDays-label"><g:fieldValue bean="${scheduleInstance}" field="projectDays"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.daysLate}">
				<li class="fieldcontain">
					<span id="daysLate-label" class="property-label"><g:message code="schedule.daysLate.label" default="Days Late" /></span>
					
						<span class="property-value" aria-labelledby="daysLate-label"><g:fieldValue bean="${scheduleInstance}" field="daysLate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.scheduleOverunPercent}">
				<li class="fieldcontain">
					<span id="scheduleOverunPercent-label" class="property-label"><g:message code="schedule.scheduleOverunPercent.label" default="Schedule Overun Percent" /></span>
					
						<span class="property-value" aria-labelledby="scheduleOverunPercent-label"><g:fieldValue bean="${scheduleInstance}" field="scheduleOverunPercent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.overallSchedueRating}">
				<li class="fieldcontain">
					<span id="overallSchedueRating-label" class="property-label"><g:message code="schedule.overallSchedueRating.label" default="Overall Schedue Rating" /></span>
					
						<span class="property-value" aria-labelledby="overallSchedueRating-label"><g:fieldValue bean="${scheduleInstance}" field="overallSchedueRating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.schedueRating}">
				<li class="fieldcontain">
					<span id="schedueRating-label" class="property-label"><g:message code="schedule.schedueRating.label" default="Schedue Rating" /></span>
					
						<span class="property-value" aria-labelledby="schedueRating-label"><g:fieldValue bean="${scheduleInstance}" field="schedueRating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.projectInfo}">
				<li class="fieldcontain">
					<span id="projectInfo-label" class="property-label"><g:message code="schedule.projectInfo.label" default="Project Info" /></span>
					
						<span class="property-value" aria-labelledby="projectInfo-label"><g:link controller="projectInfo" action="show" id="${scheduleInstance?.projectInfo?.id}">${scheduleInstance?.projectInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${scheduleInstance?.id}" />
					<g:link class="edit" action="edit" id="${scheduleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
