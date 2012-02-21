
<%@ page import="com.parago.pmo.ChangeOrder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeOrder.label', default: 'ChangeOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-changeOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-changeOrder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="changeOrderName" title="${message(code: 'changeOrder.changeOrderName.label', default: 'Change Order Name')}" />
					
						<g:sortableColumn property="link" title="${message(code: 'changeOrder.link.label', default: 'Link')}" />
					
						<th><g:message code="changeOrder.projectInfo.label" default="Project Info" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${changeOrderInstanceList}" status="i" var="changeOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${changeOrderInstance.id}">${fieldValue(bean: changeOrderInstance, field: "changeOrderName")}</g:link></td>
					
						<td>${fieldValue(bean: changeOrderInstance, field: "link")}</td>
					
						<td>${fieldValue(bean: changeOrderInstance, field: "projectInfo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${changeOrderInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
