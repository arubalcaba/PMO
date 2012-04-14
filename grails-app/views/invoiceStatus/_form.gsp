<%@ page import="com.parago.pmo.InvoiceStatus" %>



<div class="fieldcontain ${hasErrors(bean: invoiceStatusInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="invoiceStatus.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${invoiceStatusInstance?.status}"/>
</div>

