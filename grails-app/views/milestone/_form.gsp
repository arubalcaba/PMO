<%@ page import="com.parago.pmo.Milestone" %>



<div class="fieldcontain ${hasErrors(bean: milestoneInstance, field: 'milestone', 'error')} required">
	<label for="milestone">
		<g:message code="milestone.milestone.label" default="Milestone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="milestone" required="" value="${milestoneInstance?.milestone}"/>
</div>

