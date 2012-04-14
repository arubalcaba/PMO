<%@ page import="com.parago.pmo.TurnoverStatus" %>



<div class="fieldcontain ${hasErrors(bean: turnoverStatusInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="turnoverStatus.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${turnoverStatusInstance?.status}"/>
</div>

