<%@ page import="com.parago.pmo.ProjectInfo" %>


<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'projectName', 'error')} required">
	<label class="control-label" for="projectName">
		<g:message code="projectInfo.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="projectName" required="" value="${projectInfoInstance?.projectName}"/>
	</div>
</div>


<g:if test="${projectInfoInstance?.projectName}">
<div class="control-group">
	<label class="control-label" for="projectName">
		<g:message code="projectInfo.projectName.label" default="Project Name" />
	</label>
	<div class="controls">
		<g:fieldValue bean="${projectInfoInstance}" field="projectName"/>
	</div>
</div>
					</g:if>
					
					
<f:field bean="projectInfoInstance" property="projectName"/>
<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'projectType', 'error')} required">
	<label for="projectType">
		<g:message code="projectInfo.projectType.label" default="Project Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectType" required="" value="${projectInfoInstance?.projectType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'projectCode', 'error')} required">
	<label for="projectCode">
		<g:message code="projectInfo.projectCode.label" default="Project Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectCode" required="" value="${projectInfoInstance?.projectCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'deliveryManager', 'error')} ">
	<label for="deliveryManager">
		<g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" />
		
	</label>
	<g:select id="deliveryManager" name="deliveryManager.id" from="${com.parago.pmo.Person.list()}" optionKey="id" value="${projectInfoInstance?.deliveryManager?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'scrumMaster', 'error')} ">
	<label for="scrumMaster">
		<g:message code="projectInfo.scrumMaster.label" default="Scrum Master" />
		
	</label>
	<g:textField name="scrumMaster" value="${projectInfoInstance?.scrumMaster}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="projectInfo.status.label" default="Status" />
		
	</label>
	<g:select id="status" name="status.id" from="${com.parago.pmo.ProjectStatus.list()}" optionKey="id" value="${projectInfoInstance?.status?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'auditStatus', 'error')} ">
	<label for="auditStatus">
		<g:message code="projectInfo.auditStatus.label" default="Audit Status" />
		
	</label>
	<g:select id="auditStatus" name="auditStatus.id" from="${com.parago.pmo.AuditStatus.list()}" optionKey="id" value="${projectInfoInstance?.auditStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'link', 'error')} ">
	<label for="link">
		<g:message code="projectInfo.link.label" default="Link" />
		
	</label>
	<g:textField name="link" value="${projectInfoInstance?.link}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'budgetWithContractors', 'error')} required">
	<label for="budgetWithContractors">
		<g:message code="projectInfo.budgetWithContractors.label" default="Budget With Contractors" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="budgetWithContractors" required="" value="${fieldValue(bean: projectInfoInstance, field: 'budgetWithContractors')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'actualCost', 'error')} required">
	<label for="actualCost">
		<g:message code="projectInfo.actualCost.label" default="Actual Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="actualCost" required="" value="${fieldValue(bean: projectInfoInstance, field: 'actualCost')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'estimateToComplete', 'error')} required">
	<label for="estimateToComplete">
		<g:message code="projectInfo.estimateToComplete.label" default="Estimate To Complete" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="estimateToComplete" required="" value="${fieldValue(bean: projectInfoInstance, field: 'estimateToComplete')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'loeHours', 'error')} required">
	<label for="loeHours">
		<g:message code="projectInfo.loeHours.label" default="Loe Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="loeHours" required="" value="${fieldValue(bean: projectInfoInstance, field: 'loeHours')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'anticipatedClientGP', 'error')} required">
	<label for="anticipatedClientGP">
		<g:message code="projectInfo.anticipatedClientGP.label" default="Anticipated Client GP" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="anticipatedClientGP" required="" value="${fieldValue(bean: projectInfoInstance, field: 'anticipatedClientGP')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'billableAmount', 'error')} required">
	<label for="billableAmount">
		<g:message code="projectInfo.billableAmount.label" default="Billable Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="billableAmount" required="" value="${fieldValue(bean: projectInfoInstance, field: 'billableAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'numberOfQualityMeasures', 'error')} required">
	<label for="numberOfQualityMeasures">
		<g:message code="projectInfo.numberOfQualityMeasures.label" default="Number Of Quality Measures" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="numberOfQualityMeasures" required="" value="${fieldValue(bean: projectInfoInstance, field: 'numberOfQualityMeasures')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'numberOfQualityMeasuresNotMet', 'error')} required">
	<label for="numberOfQualityMeasuresNotMet">
		<g:message code="projectInfo.numberOfQualityMeasuresNotMet.label" default="Number Of Quality Measures Not Met" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="numberOfQualityMeasuresNotMet" required="" value="${fieldValue(bean: projectInfoInstance, field: 'numberOfQualityMeasuresNotMet')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'startDate', 'error')} ">
	<label for="startDate">
		<g:message code="projectInfo.startDate.label" default="Start Date" />
		
	</label>
	<g:datePicker name="startDate" precision="day"  value="${projectInfoInstance?.startDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'closeDate', 'error')} ">
	<label for="closeDate">
		<g:message code="projectInfo.closeDate.label" default="Close Date" />
		
	</label>
	<g:datePicker name="closeDate" precision="day"  value="${projectInfoInstance?.closeDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'actualReleaseDate', 'error')} ">
	<label for="actualReleaseDate">
		<g:message code="projectInfo.actualReleaseDate.label" default="Actual Release Date" />
		
	</label>
	<g:datePicker name="actualReleaseDate" precision="day"  value="${projectInfoInstance?.actualReleaseDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'plannedReleaseDate', 'error')} ">
	<label for="plannedReleaseDate">
		<g:message code="projectInfo.plannedReleaseDate.label" default="Planned Release Date" />
		
	</label>
	<g:datePicker name="plannedReleaseDate" precision="day"  value="${projectInfoInstance?.plannedReleaseDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="projectInfo.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${projectInfoInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'invoiceStatus', 'error')} ">
	<label for="invoiceStatus">
		<g:message code="projectInfo.invoiceStatus.label" default="Invoice Status" />
		
	</label>
	<g:select id="invoiceStatus" name="invoiceStatus.id" from="${com.parago.pmo.InvoiceStatus.list()}" optionKey="id" value="${projectInfoInstance?.invoiceStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'invoiceNote', 'error')} ">
	<label for="invoiceNote">
		<g:message code="projectInfo.invoiceNote.label" default="Invoice Note" />
		
	</label>
	<g:textField name="invoiceNote" value="${projectInfoInstance?.invoiceNote}"/>
</div>

</div>

