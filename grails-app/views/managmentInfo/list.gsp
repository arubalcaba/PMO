
<%@ page import="com.parago.pmo.ManagmentInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managmentInfo.label', default: 'ManagmentInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-managmentInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-managmentInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="managmentInfo.category.label" default="Category" /></th>
					
						<g:sortableColumn property="capCost" title="${message(code: 'managmentInfo.capCost.label', default: 'Cap Cost')}" />
					
						<g:sortableColumn property="expenseCost" title="${message(code: 'managmentInfo.expenseCost.label', default: 'Expense Cost')}" />
					
						<g:sortableColumn property="billableAmount" title="${message(code: 'managmentInfo.billableAmount.label', default: 'Billable Amount')}" />
					
						<g:sortableColumn property="marginCost" title="${message(code: 'managmentInfo.marginCost.label', default: 'Margin Cost')}" />
					
						<g:sortableColumn property="marginPercent" title="${message(code: 'managmentInfo.marginPercent.label', default: 'Margin Percent')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${managmentInfoInstanceList}" status="i" var="managmentInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${managmentInfoInstance.id}">${fieldValue(bean: managmentInfoInstance, field: "category")}</g:link></td>
					
						<td>${fieldValue(bean: managmentInfoInstance, field: "capCost")}</td>
					
						<td>${fieldValue(bean: managmentInfoInstance, field: "expenseCost")}</td>
					
						<td>${fieldValue(bean: managmentInfoInstance, field: "billableAmount")}</td>
					
						<td>${fieldValue(bean: managmentInfoInstance, field: "marginCost")}</td>
					
						<td>${fieldValue(bean: managmentInfoInstance, field: "marginPercent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${managmentInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
