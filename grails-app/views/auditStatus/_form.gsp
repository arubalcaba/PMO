<%@ page import="com.parago.pmo.AuditStatus" %>



<div class="fieldcontain ${hasErrors(bean: auditStatusInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="auditStatus.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${auditStatusInstance?.status}"/>
</div>

