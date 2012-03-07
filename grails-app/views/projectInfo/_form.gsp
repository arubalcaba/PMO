<%@ page import="com.parago.pmo.ProjectInfo" %>
		<g:set var="dateFormat" value="MM/dd/yyyy"/>
		<g:if test="${projectInfoInstance?.projectName}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'projectName', 'error')} required">
			<label class="control-label" class="control-label" for="projectName">
				<g:message code="projectInfo.projectName.label" default="Project Name" />
				
			</label>
			<div class="controls">
				<g:textField name="projectName" value="${projectInfoInstance?.projectName}" readOnly="true"/>
			</div>
		</div>
		</g:if>
	
		<g:if test="${projectInfoInstance?.projectCode}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'projectCode', 'error')} required">
			<label class="control-label" class="control-label" for="projectCode">
				<g:message code="projectInfo.projectCode.label" default="Project Code" />
			</label>
			<div class="controls">
				<g:textField name="projectCode" value="${projectInfoInstance?.projectCode}" readOnly="true"/>
			</div>
		</div>
		</g:if>
		
		<g:if test="${projectInfoInstance?.projectType}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'projectType', 'error')} required">
			<label class="control-label" class="control-label" for="projectType">
				<g:message code="projectInfo.projectCode.label" default="Project Type" />
			</label>
			<div class="controls">
				<g:textField name="projectType" value="${projectInfoInstance?.projectType}" readOnly="true"/>
			</div>
		</div>
		</g:if>
	
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'deliveryManager', 'error')} required">
			<label class="control-label" class="control-label" for="deliveryManager">
				<g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" />
			</label>
			<div class="controls">
			<g:select id="deliveryManager" name="deliveryManager.id" from="${com.parago.pmo.Person.list()}" optionKey="id" required="" value="${projectInfoInstance?.deliveryManager?.id}" class="many-to-one" noSelection="['': '']"/>
			</div>
		</div>
		
		<g:if test="${projectInfoInstance?.scrumMaster}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'scrumMaster', 'error')} required">
			<label class="control-label" class="control-label" for="scrumMaster">
				<g:message code="projectInfo.scrumMaster.label" default="Scrum Master" />
			</label>
			<div class="controls">
				<g:textField name="scrumMaster" value="${projectInfoInstance?.scrumMaster}" readOnly="true"/>
			</div>
		</div>
		</g:if>
				
	
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'status', 'error')} ">
			<label class="control-label" class="control-label" for="status">
				<g:message code="projectInfo.status.label" default="Status" />
			</label>
			<div class="controls">
			<g:select id="status" name="status.id" from="${com.parago.pmo.ProjectStatus.list()}" optionKey="id" value="${projectInfoInstance?.status?.id}" class="many-to-one" noSelection="['null': '']"/>
			</div>
		</div>
	
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'auditStatus', 'error')} ">
			<label class="control-label" for="auditStatus">
				<g:message code="projectInfo.auditStatus.label" default="Audit Status" />
			</label>
			<div class="controls">
			<g:select id="auditStatus" name="auditStatus.id" from="${com.parago.pmo.AuditStatus.list()}" optionKey="id" value="${projectInfoInstance?.auditStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
			</div>
		</div>
	
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'link', 'error')} ">
			<label class="control-label" for="link">
				<g:message code="projectInfo.link.label" default="Link" />
			</label>
			<div class="controls">
			<g:textField name="link" value="${projectInfoInstance?.link}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'budgetWithContractors', 'error')} required">
			<label class="control-label" for="budgetWithContractors">
				<g:message code="projectInfo.budgetWithContractors.label" default="Budget w/Contractors" />
				<span class="required-indicator"></span>
			</label>
			<div class="controls">
			<g:field type="number" name="budgetWithContractors" required="" value="${fieldValue(bean: projectInfoInstance, field: 'budgetWithContractors')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'actualCost', 'error')} required">
			<label class="control-label" for="actualCost">
				<g:message code="projectInfo.actualCost.label" default="Actual Cost" />
			</label>
			<div class="controls">
			<g:field type="number" name="actualCost" required="" value="${fieldValue(bean: projectInfoInstance, field: 'actualCost')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'estimateToComplete', 'error')} required">
			<label class="control-label" for="estimateToComplete">
				<g:message code="projectInfo.estimateToComplete.label" default="Estimate To Complete" />
			</label>
			<div class="controls">
			<g:field type="number" name="estimateToComplete" required="" value="${fieldValue(bean: projectInfoInstance, field: 'estimateToComplete')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'loeHours', 'error')} required">
			<label class="control-label" for="loeHours">
				<g:message code="projectInfo.loeHours.label" default="Loe Hours" />
			</label>
			<div class="controls">
			<g:field type="number" name="loeHours" required="" value="${fieldValue(bean: projectInfoInstance, field: 'loeHours')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'anticipatedClientGP', 'error')} required">
			<label class="control-label" for="anticipatedClientGP">
				<g:message code="projectInfo.anticipatedClientGP.label" default="Anticipated Client GP" />
			</label>
			<div class="controls">
			<g:field type="number" name="anticipatedClientGP" required="" value="${fieldValue(bean: projectInfoInstance, field: 'anticipatedClientGP')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'billableAmount', 'error')} required">
			<label class="control-label" for="billableAmount">
				<g:message code="projectInfo.billableAmount.label" default="Billable Amount" />
			</label>
			<div class="controls">
			<g:field type="number" name="billableAmount" required="" value="${fieldValue(bean: projectInfoInstance, field: 'billableAmount')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'numberOfQualityMeasures', 'error')} required">
			<label class="control-label" for="numberOfQualityMeasures">
				<g:message code="projectInfo.numberOfQualityMeasures.label" default="Number Of Quality Measures" />
			</label>
			<div class="controls">
			<g:field type="number" name="numberOfQualityMeasures" required="" value="${fieldValue(bean: projectInfoInstance, field: 'numberOfQualityMeasures')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'numberOfQualityMeasuresNotMet', 'error')} required">
			<label class="control-label" for="numberOfQualityMeasuresNotMet">
				<g:message code="projectInfo.numberOfQualityMeasuresNotMet.label" default="Number Of Quality Measures Not Met" />
			</label>
			<div class="controls">
			<g:field type="number" name="numberOfQualityMeasuresNotMet" required="" value="${fieldValue(bean: projectInfoInstance, field: 'numberOfQualityMeasuresNotMet')}"/>
			</div>
		</div>
		
		<g:if test="${projectInfoInstance?.startDate}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'startDate', 'error')} ">
			<label class="control-label" for="startDate">
				<g:message code="projectInfo.startDate.label" default="Start Date" />
			</label>
			<div class="controls">
			<g:field type="date" name="startDate"  value="${projectInfoInstance?.startDate.format(dateFormat)}" readOnly="true"/>
<%--			<g:formatDate format="MM-dd-yyyy" style="MEDIUM" date="${projectInfoInstance?.startDate}" />--%>
			</div>
		</div>
		</g:if>
		
		<g:if test="${projectInfoInstance?.closeDate}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'closeDate', 'error')} ">
			<label class="control-label" for="closeDate">
				<g:message code="projectInfo.closeDate.label" default="Close Date" />
			</label>
			<div class="controls">
			<g:field type="date" name="startDate"  value="${projectInfoInstance?.closeDate.format(dateFormat)}" readOnly="true"/>
			</div>
		</div>
		</g:if>

		<g:if test="${projectInfoInstance?.actualReleaseDate}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'actualReleaseDate', 'error')} ">
			<label class="control-label" for="actualReleaseDate">
				<g:message code="projectInfo.actualReleaseDate.label" default="Actual Release Date" />
				
			</label>
			<div class="controls">
			<g:field type="date" name="startDate"  value="${projectInfoInstance?.actualReleaseDate.format(dateFormat)}" readOnly="true"/>
			</div>
		</div>
		</g:if>
		
		

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'plannedReleaseDate', 'error')} ">
			<label class="control-label" for="plannedReleaseDate">
				<g:message code="projectInfo.plannedReleaseDate.label" default="Planned Release Date" />
			</label>
			<div class="controls">
			<g:textField name="plannedReleaseDate" value="${formatDate(format:'dd-MM-yyyy',date:projectInfoInstance?.plannedReleaseDate)}" id="plannedReleaseDate"/>
			</div>
		</div>
		
		<g:if test="${projectInfoInstance?.category}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'category', 'error')} ">
			<label class="control-label" for="category">
				<g:message code="projectInfo.category.label" default="Category" />
				
			</label>
			<div class="controls">
			<g:textField name="category" value="${projectInfoInstance?.category}" readOnly="true"/>
			</div>
		</div>
		</g:if>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'invoiceStatus', 'error')} ">
			<label class="control-label" for="invoiceStatus">
				<g:message code="projectInfo.invoiceStatus.label" default="Invoice Status" />
			</label>
			<div class="controls">
			<g:select id="invoiceStatus" name="invoiceStatus.id" from="${com.parago.pmo.InvoiceStatus.list()}" optionKey="id" value="${projectInfoInstance?.invoiceStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'invoiceNote', 'error')} ">
			<label class="control-label" for="invoiceNote">
				<g:message code="projectInfo.invoiceNote.label" default="Invoice Note" />
			</label>
			<div class="controls">
			<g:textArea name="invoiceNote" value="${projectInfoInstance?.invoiceNote}"/>
			</div>
		</div>



