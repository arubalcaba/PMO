
<%@ page import="com.parago.pmo.Risk" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'risk.label', default: 'Risk')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-risk" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-risk" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="risk.projectInfo.label" default="Project Info" /></th>
					
						<g:sortableColumn property="risk" title="${message(code: 'risk.risk.label', default: 'Risk')}" />
					
						<g:sortableColumn property="riskMigrationStrategy" title="${message(code: 'risk.riskMigrationStrategy.label', default: 'Risk Migration Strategy')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${riskInstanceList}" status="i" var="riskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${riskInstance.id}">${fieldValue(bean: riskInstance, field: "projectInfo")}</g:link></td>
					
						<td>${fieldValue(bean: riskInstance, field: "risk")}</td>
					
						<td>${fieldValue(bean: riskInstance, field: "riskMigrationStrategy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${riskInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
