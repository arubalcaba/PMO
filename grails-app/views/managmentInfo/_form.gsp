<%@ page import="com.parago.pmo.ManagmentInfo" %>



<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="managmentInfo.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.parago.pmo.Category.list()}" optionKey="id" required="" value="${managmentInfoInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'capCost', 'error')} required">
	<label for="capCost">
		<g:message code="managmentInfo.capCost.label" default="Cap Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="capCost" required="" value="${fieldValue(bean: managmentInfoInstance, field: 'capCost')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'expenseCost', 'error')} required">
	<label for="expenseCost">
		<g:message code="managmentInfo.expenseCost.label" default="Expense Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="expenseCost" required="" value="${fieldValue(bean: managmentInfoInstance, field: 'expenseCost')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'billableAmount', 'error')} required">
	<label for="billableAmount">
		<g:message code="managmentInfo.billableAmount.label" default="Billable Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="billableAmount" required="" value="${fieldValue(bean: managmentInfoInstance, field: 'billableAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'marginCost', 'error')} required">
	<label for="marginCost">
		<g:message code="managmentInfo.marginCost.label" default="Margin Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="marginCost" required="" value="${fieldValue(bean: managmentInfoInstance, field: 'marginCost')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'marginPercent', 'error')} required">
	<label for="marginPercent">
		<g:message code="managmentInfo.marginPercent.label" default="Margin Percent" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="marginPercent" required="" value="${fieldValue(bean: managmentInfoInstance, field: 'marginPercent')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'anticipatedClientGP', 'error')} required">
	<label for="anticipatedClientGP">
		<g:message code="managmentInfo.anticipatedClientGP.label" default="Anticipated Client GP" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="anticipatedClientGP" required="" value="${fieldValue(bean: managmentInfoInstance, field: 'anticipatedClientGP')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'invoiceNote', 'error')} ">
	<label for="invoiceNote">
		<g:message code="managmentInfo.invoiceNote.label" default="Invoice Note" />
		
	</label>
	<g:textField name="invoiceNote" value="${managmentInfoInstance?.invoiceNote}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'invoiceStatus', 'error')} required">
	<label for="invoiceStatus">
		<g:message code="managmentInfo.invoiceStatus.label" default="Invoice Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="invoiceStatus" name="invoiceStatus.id" from="${com.parago.pmo.InvoiceStatus.list()}" optionKey="id" required="" value="${managmentInfoInstance?.invoiceStatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managmentInfoInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="managmentInfo.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${managmentInfoInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

