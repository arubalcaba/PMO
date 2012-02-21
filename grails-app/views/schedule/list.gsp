
<%@ page import="com.parago.pmo.Schedule" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-schedule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-schedule" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="startDate" title="${message(code: 'schedule.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="plannedReleaseDate" title="${message(code: 'schedule.plannedReleaseDate.label', default: 'Planned Release Date')}" />
					
						<g:sortableColumn property="actualReleaseDate" title="${message(code: 'schedule.actualReleaseDate.label', default: 'Actual Release Date')}" />
					
						<g:sortableColumn property="projectDays" title="${message(code: 'schedule.projectDays.label', default: 'Project Days')}" />
					
						<g:sortableColumn property="daysLate" title="${message(code: 'schedule.daysLate.label', default: 'Days Late')}" />
					
						<g:sortableColumn property="scheduleOverunPercent" title="${message(code: 'schedule.scheduleOverunPercent.label', default: 'Schedule Overun Percent')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${scheduleInstanceList}" status="i" var="scheduleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${scheduleInstance.id}">${fieldValue(bean: scheduleInstance, field: "startDate")}</g:link></td>
					
						<td><g:formatDate date="${scheduleInstance.plannedReleaseDate}" /></td>
					
						<td><g:formatDate date="${scheduleInstance.actualReleaseDate}" /></td>
					
						<td>${fieldValue(bean: scheduleInstance, field: "projectDays")}</td>
					
						<td>${fieldValue(bean: scheduleInstance, field: "daysLate")}</td>
					
						<td>${fieldValue(bean: scheduleInstance, field: "scheduleOverunPercent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${scheduleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
