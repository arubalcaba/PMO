
<%@ page import="com.parago.pmo.Budget" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budget.label', default: 'Budget')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-budget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-budget" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="budget" title="${message(code: 'budget.budget.label', default: 'Budget')}" />
					
						<g:sortableColumn property="actualCost" title="${message(code: 'budget.actualCost.label', default: 'Actual Cost')}" />
					
						<g:sortableColumn property="estimateToComplete" title="${message(code: 'budget.estimateToComplete.label', default: 'Estimate To Complete')}" />
					
						<g:sortableColumn property="variance" title="${message(code: 'budget.variance.label', default: 'Variance')}" />
					
						<g:sortableColumn property="percentOfBudgetUsed" title="${message(code: 'budget.percentOfBudgetUsed.label', default: 'Percent Of Budget Used')}" />
					
						<g:sortableColumn property="estimateAtCompletion" title="${message(code: 'budget.estimateAtCompletion.label', default: 'Estimate At Completion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${budgetInstanceList}" status="i" var="budgetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${budgetInstance.id}">${fieldValue(bean: budgetInstance, field: "budget")}</g:link></td>
					
						<td>${fieldValue(bean: budgetInstance, field: "actualCost")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "estimateToComplete")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "variance")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "percentOfBudgetUsed")}</td>
					
						<td>${fieldValue(bean: budgetInstance, field: "estimateAtCompletion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${budgetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
