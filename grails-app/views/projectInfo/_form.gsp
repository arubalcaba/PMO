<%@ page import="com.parago.pmo.ProjectInfo" %>
<g:if test="${projectInfoInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectInfo.projectName.label" default="Project Name" /></span>					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${projectInfoInstance}" field="projectName"/></span>
				</li>
</g:if>
<g:if test="${projectInfoInstance?.projectType}">
				<li class="fieldcontain">
					<span id="projectType-label" class="property-label"><g:message code="projectInfo.projectType.label" default="Project Type" /></span>					
					<span class="property-value" aria-labelledby="projectType-label"><g:fieldValue bean="${projectInfoInstance}" field="projectType"/></span>					
				</li>
</g:if>
<g:if test="${projectInfoInstance?.projectCode}">
				<li class="fieldcontain">
					<span id="projectCode-label" class="property-label"><g:message code="projectInfo.projectCode.label" default="Project Code" /></span>					
						<span class="property-value" aria-labelledby="projectCode-label"><g:fieldValue bean="${projectInfoInstance}" field="projectCode"/></span>					
				</li>
</g:if>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'deliveryManager', 'error')} required">
	<label for="deliveryManager">
		<g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="deliveryManager" name="deliveryManager.id" from="${com.parago.pmo.Person.list()}" optionKey="id" required="" value="${projectInfoInstance?.deliveryManager?.id}" class="many-to-one"/>
</div>
<g:if test="${projectInfoInstance?.scrumMaster}">
				<li class="fieldcontain">
					<span id="scrumMaster-label" class="property-label"><g:message code="projectInfo.scrumMaster.label" default="Scrum Master" /></span>					
					<span class="property-value" aria-labelledby="scrumMaster-label"><g:fieldValue bean="${projectInfoInstance}" field="scrumMaster"/></span>	
				</li>
				</g:if>

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


<g:if test="${projectInfoInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="projectInfo.startDate.label" default="Start Date" /></span>					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate format="yyyy-MM-dd" style="MEDIUM" date="${projectInfoInstance?.startDate}" /></span>					
				</li>
				</g:if>
			
<g:if test="${projectInfoInstance?.closeDate}">
	<li class="fieldcontain">
	    <span id="closeDate-label" class="property-label"><g:message code="projectInfo.closeDate.label" default="Close Date" /></span>					
						<span class="property-value" aria-labelledby="closeDate-label"><g:formatDate format="yyyy-MM-dd" date="${projectInfoInstance?.closeDate}" /></span>					
				</li>
</g:if>
   <g:if test="${projectInfoInstance?.actualReleaseDate}">
		<li class="fieldcontain">
			<span id="actualReleaseDate-label" class="property-label"><g:message code="projectInfo.actualReleaseDate.label" default="Actual Release Date" /></span>					
						<span class="property-value" aria-labelledby="actualReleaseDate-label"><g:formatDate format="yyyy-MM-dd" date="${projectInfoInstance?.actualReleaseDate}" /></span>					
				</li>
</g:if>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'plannedReleaseDate', 'error')} ">
	<label for="plannedReleaseDate">
		<g:message code="projectInfo.plannedReleaseDate.label" default="Planned Release Date" />
		
	</label>
	<g:textField name="plannedReleaseDate" alue="${formatDate(format:'dd-MM-yyyy',date:projectInfoInstance?.plannedReleaseDate)}" id="plannedReleaseDate"/>
</div>
<g:if test="${projectInfoInstance?.category}">
	<li class="fieldcontain">
		<span id="category-label" class="property-label"><g:message code="projectInfo.category.label" default="Category" /></span>					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${projectInfoInstance}" field="category"/></span>					
				</li>
</g:if>

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

