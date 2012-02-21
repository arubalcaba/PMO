
<%@ page import="com.parago.pmo.Budget" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'budget.label', default: 'Budget')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-budget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-budget" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list budget">
			
				<g:if test="${budgetInstance?.budget}">
				<li class="fieldcontain">
					<span id="budget-label" class="property-label"><g:message code="budget.budget.label" default="Budget" /></span>
					
						<span class="property-value" aria-labelledby="budget-label"><g:fieldValue bean="${budgetInstance}" field="budget"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.actualCost}">
				<li class="fieldcontain">
					<span id="actualCost-label" class="property-label"><g:message code="budget.actualCost.label" default="Actual Cost" /></span>
					
						<span class="property-value" aria-labelledby="actualCost-label"><g:fieldValue bean="${budgetInstance}" field="actualCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.estimateToComplete}">
				<li class="fieldcontain">
					<span id="estimateToComplete-label" class="property-label"><g:message code="budget.estimateToComplete.label" default="Estimate To Complete" /></span>
					
						<span class="property-value" aria-labelledby="estimateToComplete-label"><g:fieldValue bean="${budgetInstance}" field="estimateToComplete"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.variance}">
				<li class="fieldcontain">
					<span id="variance-label" class="property-label"><g:message code="budget.variance.label" default="Variance" /></span>
					
						<span class="property-value" aria-labelledby="variance-label"><g:fieldValue bean="${budgetInstance}" field="variance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.percentOfBudgetUsed}">
				<li class="fieldcontain">
					<span id="percentOfBudgetUsed-label" class="property-label"><g:message code="budget.percentOfBudgetUsed.label" default="Percent Of Budget Used" /></span>
					
						<span class="property-value" aria-labelledby="percentOfBudgetUsed-label"><g:fieldValue bean="${budgetInstance}" field="percentOfBudgetUsed"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.estimateAtCompletion}">
				<li class="fieldcontain">
					<span id="estimateAtCompletion-label" class="property-label"><g:message code="budget.estimateAtCompletion.label" default="Estimate At Completion" /></span>
					
						<span class="property-value" aria-labelledby="estimateAtCompletion-label"><g:fieldValue bean="${budgetInstance}" field="estimateAtCompletion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.budgetVariance}">
				<li class="fieldcontain">
					<span id="budgetVariance-label" class="property-label"><g:message code="budget.budgetVariance.label" default="Budget Variance" /></span>
					
						<span class="property-value" aria-labelledby="budgetVariance-label"><g:fieldValue bean="${budgetInstance}" field="budgetVariance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.actualHours}">
				<li class="fieldcontain">
					<span id="actualHours-label" class="property-label"><g:message code="budget.actualHours.label" default="Actual Hours" /></span>
					
						<span class="property-value" aria-labelledby="actualHours-label"><g:fieldValue bean="${budgetInstance}" field="actualHours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.loeHours}">
				<li class="fieldcontain">
					<span id="loeHours-label" class="property-label"><g:message code="budget.loeHours.label" default="Loe Hours" /></span>
					
						<span class="property-value" aria-labelledby="loeHours-label"><g:fieldValue bean="${budgetInstance}" field="loeHours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.budgetRating}">
				<li class="fieldcontain">
					<span id="budgetRating-label" class="property-label"><g:message code="budget.budgetRating.label" default="Budget Rating" /></span>
					
						<span class="property-value" aria-labelledby="budgetRating-label"><g:fieldValue bean="${budgetInstance}" field="budgetRating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.overallBudgetRating}">
				<li class="fieldcontain">
					<span id="overallBudgetRating-label" class="property-label"><g:message code="budget.overallBudgetRating.label" default="Overall Budget Rating" /></span>
					
						<span class="property-value" aria-labelledby="overallBudgetRating-label"><g:fieldValue bean="${budgetInstance}" field="overallBudgetRating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${budgetInstance?.projectInfo}">
				<li class="fieldcontain">
					<span id="projectInfo-label" class="property-label"><g:message code="budget.projectInfo.label" default="Project Info" /></span>
					
						<span class="property-value" aria-labelledby="projectInfo-label"><g:link controller="projectInfo" action="show" id="${budgetInstance?.projectInfo?.id}">${budgetInstance?.projectInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${budgetInstance?.id}" />
					<g:link class="edit" action="edit" id="${budgetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
