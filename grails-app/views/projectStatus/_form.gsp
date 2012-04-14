<%@ page import="com.parago.pmo.ProjectStatus" %>



<div class="fieldcontain ${hasErrors(bean: projectStatusInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="projectStatus.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${projectStatusInstance?.status}"/>
</div>

