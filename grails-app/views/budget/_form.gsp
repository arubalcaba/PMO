<%@ page import="com.parago.pmo.Budget" %>



<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'budget', 'error')} required">
	<label for="budget">
		<g:message code="budget.budget.label" default="Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="budget" required="" value="${fieldValue(bean: budgetInstance, field: 'budget')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'actualCost', 'error')} required">
	<label for="actualCost">
		<g:message code="budget.actualCost.label" default="Actual Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="actualCost" required="" value="${fieldValue(bean: budgetInstance, field: 'actualCost')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'estimateToComplete', 'error')} required">
	<label for="estimateToComplete">
		<g:message code="budget.estimateToComplete.label" default="Estimate To Complete" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="estimateToComplete" required="" value="${fieldValue(bean: budgetInstance, field: 'estimateToComplete')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'variance', 'error')} required">
	<label for="variance">
		<g:message code="budget.variance.label" default="Variance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="variance" required="" value="${fieldValue(bean: budgetInstance, field: 'variance')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'percentOfBudgetUsed', 'error')} required">
	<label for="percentOfBudgetUsed">
		<g:message code="budget.percentOfBudgetUsed.label" default="Percent Of Budget Used" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="percentOfBudgetUsed" required="" value="${fieldValue(bean: budgetInstance, field: 'percentOfBudgetUsed')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'estimateAtCompletion', 'error')} required">
	<label for="estimateAtCompletion">
		<g:message code="budget.estimateAtCompletion.label" default="Estimate At Completion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="estimateAtCompletion" required="" value="${fieldValue(bean: budgetInstance, field: 'estimateAtCompletion')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'budgetVariance', 'error')} required">
	<label for="budgetVariance">
		<g:message code="budget.budgetVariance.label" default="Budget Variance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="budgetVariance" required="" value="${fieldValue(bean: budgetInstance, field: 'budgetVariance')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'actualHours', 'error')} required">
	<label for="actualHours">
		<g:message code="budget.actualHours.label" default="Actual Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="actualHours" required="" value="${fieldValue(bean: budgetInstance, field: 'actualHours')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'loeHours', 'error')} required">
	<label for="loeHours">
		<g:message code="budget.loeHours.label" default="Loe Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="loeHours" required="" value="${fieldValue(bean: budgetInstance, field: 'loeHours')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'budgetRating', 'error')} required">
	<label for="budgetRating">
		<g:message code="budget.budgetRating.label" default="Budget Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="budgetRating" required="" value="${fieldValue(bean: budgetInstance, field: 'budgetRating')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'overallBudgetRating', 'error')} ">
	<label for="overallBudgetRating">
		<g:message code="budget.overallBudgetRating.label" default="Overall Budget Rating" />
		
	</label>
	<g:textField name="overallBudgetRating" value="${budgetInstance?.overallBudgetRating}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="budget.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${budgetInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

