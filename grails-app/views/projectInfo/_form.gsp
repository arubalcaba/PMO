<%@ page import="com.parago.pmo.ProjectInfo" %>



<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectInfo.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectName" required="" value="${projectInfoInstance?.projectName}" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'projectType', 'error')} required">
	<label for="projectType">
		<g:message code="projectInfo.projectType.label" default="Project Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectType" required="" value="${projectInfoInstance?.projectType}" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'projectCode', 'error')} required">
	<label for="projectCode">
		<g:message code="projectInfo.projectCode.label" default="Project Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectCode" required="" value="${projectInfoInstance?.projectCode}" readonly="readonly"/>
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
	<g:textField name="scrumMaster" required="" value="${projectInfoInstance?.scrumMaster}" readonly="readonly"/>
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
	<g:if test="${projectInfoInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="projectInfo.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate format="yyyy-MM-dd" style="MEDIUM" date="${projectInfoInstance?.startDate}" /></span>
					
				</li>
				</g:if>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'closeDate', 'error')} ">
	<label for="closeDate">
		<g:message code="projectInfo.closeDate.label" default="Close Date" />
		
	</label>
	<g:textField name="closeDate" value="${projectInfoInstance?.closeDate}" precision="day" id="closeDate" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'actualReleaseDate', 'error')} ">
	<label for="actualReleaseDate">
		<g:message code="projectInfo.actualReleaseDate.label" default="Actual Release Date" />
	</label>
	<g:textField name="actualReleaseDate" id="actualReleaseDate" value="${projectInfoInstance?.actualReleaseDate}" precision="day" readonly="readonly" id="actualReleaseDate"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'plannedReleaseDate', 'error')} ">
	<label for="plannedReleaseDate">
		<g:message code="projectInfo.plannedReleaseDate.label" default="Planned Release Date" />
		
	</label>
	<g:textField name="plannedReleaseDate" alue="${formatDate(format:'dd-MM-yyyy',date:projectInfoInstance?.plannedReleaseDate)}" id="plannedReleaseDate"/>
</div>


<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="projectInfo.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${projectInfoInstance?.category}" readonly="readonly"/>
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

