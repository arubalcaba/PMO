<%@ page import="com.parago.pmo.ProjectInvoice" %>



<div class="fieldcontain ${hasErrors(bean: projectInvoiceInstance, field: 'billableAmount', 'error')} required">
	<label for="billableAmount">
		<g:message code="projectInvoice.billableAmount.label" default="Billable Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="billableAmount" required="" value="${fieldValue(bean: projectInvoiceInstance, field: 'billableAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInvoiceInstance, field: 'invoiceStatus', 'error')} required">
	<label for="invoiceStatus">
		<g:message code="projectInvoice.invoiceStatus.label" default="Invoice Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="invoiceStatus" name="invoiceStatus.id" from="${com.parago.pmo.InvoiceStatus.list()}" optionKey="id" required="" value="${projectInvoiceInstance?.invoiceStatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInvoiceInstance, field: 'invoiceNote', 'error')} required">
	<label for="invoiceNote">
		<g:message code="projectInvoice.invoiceNote.label" default="Invoice Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="invoiceNote" required="" value="${projectInvoiceInstance?.invoiceNote}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInvoiceInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="projectInvoice.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${projectInvoiceInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

