
<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectInfo">
			
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
			
				<g:if test="${projectInfoInstance?.deliveryManager}">
				<li class="fieldcontain">
					<span id="deliveryManager-label" class="property-label"><g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" /></span>
					
						<span class="property-value" aria-labelledby="deliveryManager-label"><g:link controller="person" action="show" id="${projectInfoInstance?.deliveryManager?.id}">${projectInfoInstance?.deliveryManager?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.scrumMaster}">
				<li class="fieldcontain">
					<span id="scrumMaster-label" class="property-label"><g:message code="projectInfo.scrumMaster.label" default="Scrum Master" /></span>
					
						<span class="property-value" aria-labelledby="scrumMaster-label"><g:fieldValue bean="${projectInfoInstance}" field="scrumMaster"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="projectInfo.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="projectStatus" action="show" id="${projectInfoInstance?.status?.id}">${projectInfoInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.auditStatus}">
				<li class="fieldcontain">
					<span id="auditStatus-label" class="property-label"><g:message code="projectInfo.auditStatus.label" default="Audit Status" /></span>
					
						<span class="property-value" aria-labelledby="auditStatus-label"><g:link controller="auditStatus" action="show" id="${projectInfoInstance?.auditStatus?.id}">${projectInfoInstance?.auditStatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.link}">
				<li class="fieldcontain">
					<span id="link-label" class="property-label"><g:message code="projectInfo.link.label" default="Link" /></span>
					
						<span class="property-value" aria-labelledby="link-label"><g:fieldValue bean="${projectInfoInstance}" field="link"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.budgetWithContractors}">
				<li class="fieldcontain">
					<span id="budgetWithContractors-label" class="property-label"><g:message code="projectInfo.budgetWithContractors.label" default="Budget With Contractors" /></span>
					
						<span class="property-value" aria-labelledby="budgetWithContractors-label"><g:fieldValue bean="${projectInfoInstance}" field="budgetWithContractors"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.actualCost}">
				<li class="fieldcontain">
					<span id="actualCost-label" class="property-label"><g:message code="projectInfo.actualCost.label" default="Actual Cost" /></span>
					
						<span class="property-value" aria-labelledby="actualCost-label"><g:fieldValue bean="${projectInfoInstance}" field="actualCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.estimateToComplete}">
				<li class="fieldcontain">
					<span id="estimateToComplete-label" class="property-label"><g:message code="projectInfo.estimateToComplete.label" default="Estimate To Complete" /></span>
					
						<span class="property-value" aria-labelledby="estimateToComplete-label"><g:fieldValue bean="${projectInfoInstance}" field="estimateToComplete"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.loeHours}">
				<li class="fieldcontain">
					<span id="loeHours-label" class="property-label"><g:message code="projectInfo.loeHours.label" default="Loe Hours" /></span>
					
						<span class="property-value" aria-labelledby="loeHours-label"><g:fieldValue bean="${projectInfoInstance}" field="loeHours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.anticipatedClientGP}">
				<li class="fieldcontain">
					<span id="anticipatedClientGP-label" class="property-label"><g:message code="projectInfo.anticipatedClientGP.label" default="Anticipated Client GP" /></span>
					
						<span class="property-value" aria-labelledby="anticipatedClientGP-label"><g:fieldValue bean="${projectInfoInstance}" field="anticipatedClientGP"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.billableAmount}">
				<li class="fieldcontain">
					<span id="billableAmount-label" class="property-label"><g:message code="projectInfo.billableAmount.label" default="Billable Amount" /></span>
					
						<span class="property-value" aria-labelledby="billableAmount-label"><g:fieldValue bean="${projectInfoInstance}" field="billableAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.numberOfQualityMeasures}">
				<li class="fieldcontain">
					<span id="numberOfQualityMeasures-label" class="property-label"><g:message code="projectInfo.numberOfQualityMeasures.label" default="Number Of Quality Measures" /></span>
					
						<span class="property-value" aria-labelledby="numberOfQualityMeasures-label"><g:fieldValue bean="${projectInfoInstance}" field="numberOfQualityMeasures"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.numberOfQualityMeasuresNotMet}">
				<li class="fieldcontain">
					<span id="numberOfQualityMeasuresNotMet-label" class="property-label"><g:message code="projectInfo.numberOfQualityMeasuresNotMet.label" default="Number Of Quality Measures Not Met" /></span>
					
						<span class="property-value" aria-labelledby="numberOfQualityMeasuresNotMet-label"><g:fieldValue bean="${projectInfoInstance}" field="numberOfQualityMeasuresNotMet"/></span>
					
				</li>
				</g:if>
			
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
			
				<g:if test="${projectInfoInstance?.plannedReleaseDate}">
				<li class="fieldcontain">
					<span id="plannedReleaseDate-label" class="property-label"><g:message code="projectInfo.plannedReleaseDate.label" default="Planned Release Date" /></span>
					
						<span class="property-value" aria-labelledby="plannedReleaseDate-label"><g:formatDate format="yyyy-MM-dd" date="${projectInfoInstance?.plannedReleaseDate}" /></span>
					
				</li>
				</g:if>			
				
			
				<g:if test="${projectInfoInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="projectInfo.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${projectInfoInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.invoiceStatus}">
				<li class="fieldcontain">
					<span id="invoiceStatus-label" class="property-label"><g:message code="projectInfo.invoiceStatus.label" default="Invoice Status" /></span>
					
						<span class="property-value" aria-labelledby="invoiceStatus-label"><g:fieldValue bean="${projectInfoInstance}" field="invoiceStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.invoiceNote}">
				<li class="fieldcontain">
					<span id="invoiceNote-label" class="property-label"><g:message code="projectInfo.invoiceNote.label" default="Invoice Note" /></span>
					
						<span class="property-value" aria-labelledby="invoiceNote-label"><g:fieldValue bean="${projectInfoInstance}" field="invoiceNote"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.risks}">
				<li class="fieldcontain">
					<span id="risks-label" class="property-label"><g:message code="projectInfo.risks.label" default="Risks" /></span>
					
						<g:each in="${projectInfoInstance.risks}" var="r">
						<span class="property-value" aria-labelledby="risks-label"><g:link controller="risk" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.impediments}">
				<li class="fieldcontain">
					<span id="impediments-label" class="property-label"><g:message code="projectInfo.impediments.label" default="Impediments" /></span>
					
						<g:each in="${projectInfoInstance.impediments}" var="i">
						<span class="property-value" aria-labelledby="impediments-label"><g:link controller="impediment" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.changeOrders}">
				<li class="fieldcontain">
					<span id="changeOrders-label" class="property-label"><g:message code="projectInfo.changeOrders.label" default="Change Orders" /></span>
					
						<g:each in="${projectInfoInstance.changeOrders}" var="c">
						<span class="property-value" aria-labelledby="changeOrders-label"><g:link controller="changeOrder" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.qualityTargets}">
				<li class="fieldcontain">
					<span id="qualityTargets-label" class="property-label"><g:message code="projectInfo.qualityTargets.label" default="Quality Targets" /></span>
					
						<g:each in="${projectInfoInstance.qualityTargets}" var="q">
						<span class="property-value" aria-labelledby="qualityTargets-label"><g:link controller="qualityTarget" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
