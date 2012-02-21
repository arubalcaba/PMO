
<%@ page import="com.parago.pmo.Impediment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'impediment.label', default: 'Impediment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-impediment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-impediment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="impediment" title="${message(code: 'impediment.impediment.label', default: 'Impediment')}" />
					
						<g:sortableColumn property="remediationPlan" title="${message(code: 'impediment.remediationPlan.label', default: 'Remediation Plan')}" />
					
						<th><g:message code="impediment.projectInfo.label" default="Project Info" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${impedimentInstanceList}" status="i" var="impedimentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${impedimentInstance.id}">${fieldValue(bean: impedimentInstance, field: "impediment")}</g:link></td>
					
						<td>${fieldValue(bean: impedimentInstance, field: "remediationPlan")}</td>
					
						<td>${fieldValue(bean: impedimentInstance, field: "projectInfo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${impedimentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
