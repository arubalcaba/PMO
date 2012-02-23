<%@ page import="com.parago.pmo.ProjectInfo" %>



<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectInfo.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectName" required="" value="${projectInfoInstance?.projectName}"/>
</div>

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

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'deliveryManager', 'error')} required">
	<label for="deliveryManager">
		<g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="deliveryManager" name="deliveryManager.id" from="${com.parago.pmo.Person.list()}" optionKey="id" required="" value="${projectInfoInstance?.deliveryManager?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'scrumMaster', 'error')} required">
	<label for="scrumMaster">
		<g:message code="projectInfo.scrumMaster.label" default="Scrum Master" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="scrumMaster" required="" value="${projectInfoInstance?.scrumMaster}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="projectInfo.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${com.parago.pmo.ProjectStatus.list()}" optionKey="id" required="" value="${projectInfoInstance?.status?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'auditStatus', 'error')} required">
	<label for="auditStatus">
		<g:message code="projectInfo.auditStatus.label" default="Audit Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="auditStatus" name="auditStatus.id" from="${com.parago.pmo.AuditStatus.list()}" optionKey="id" required="" value="${projectInfoInstance?.auditStatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'link', 'error')} required">
	<label for="link">
		<g:message code="projectInfo.link.label" default="Link" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="link" required="" value="${projectInfoInstance?.link}"/>
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

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'overallRating', 'error')} required">
	<label for="overallRating">
		<g:message code="projectInfo.overallRating.label" default="Overall Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="overallRating" required="" value="${fieldValue(bean: projectInfoInstance, field: 'overallRating')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'ratingValue', 'error')} ">
	<label for="ratingValue">
		<g:message code="projectInfo.ratingValue.label" default="Rating Value" />
		
	</label>
	<g:textField name="ratingValue" value="${projectInfoInstance?.ratingValue}"/>
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
	<g:textField name="invoiceStatus" value="${projectInfoInstance?.invoiceStatus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'invoiceNote', 'error')} ">
	<label for="invoiceNote">
		<g:message code="projectInfo.invoiceNote.label" default="Invoice Note" />
		
	</label>
	<g:textField name="invoiceNote" value="${projectInfoInstance?.invoiceNote}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'risks', 'error')} ">
	<label for="risks">
		<g:message code="projectInfo.risks.label" default="Risks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInfoInstance?.risks?}" var="r">
    <li><g:link controller="risk" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="risk" action="create" params="['projectInfo.id': projectInfoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'risk.label', default: 'Risk')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'impediments', 'error')} ">
	<label for="impediments">
		<g:message code="projectInfo.impediments.label" default="Impediments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInfoInstance?.impediments?}" var="i">
    <li><g:link controller="impediment" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="impediment" action="create" params="['projectInfo.id': projectInfoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'impediment.label', default: 'Impediment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'changeOrders', 'error')} ">
	<label for="changeOrders">
		<g:message code="projectInfo.changeOrders.label" default="Change Orders" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInfoInstance?.changeOrders?}" var="c">
    <li><g:link controller="changeOrder" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="changeOrder" action="create" params="['projectInfo.id': projectInfoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'changeOrder.label', default: 'ChangeOrder')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'qualityTargets', 'error')} ">
	<label for="qualityTargets">
		<g:message code="projectInfo.qualityTargets.label" default="Quality Targets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInfoInstance?.qualityTargets?}" var="q">
    <li><g:link controller="qualityTarget" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="qualityTarget" action="create" params="['projectInfo.id': projectInfoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'qualityTarget.label', default: 'QualityTarget')])}</g:link>
</li>
</ul>

</div>

