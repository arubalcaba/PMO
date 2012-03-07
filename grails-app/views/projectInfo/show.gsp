
<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${projectInfoInstance?.projectName}">
						<dt><g:message code="projectInfo.projectName.label" default="Project Name" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="projectName"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.projectType}">
						<dt><g:message code="projectInfo.projectType.label" default="Project Type" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="projectType"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.projectCode}">
						<dt><g:message code="projectInfo.projectCode.label" default="Project Code" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="projectCode"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.deliveryManager}">
						<dt><g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" /></dt>
						
							<dd><g:link controller="person" action="show" id="${projectInfoInstance?.deliveryManager?.id}">${projectInfoInstance?.deliveryManager?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.scrumMaster}">
						<dt><g:message code="projectInfo.scrumMaster.label" default="Scrum Master" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="scrumMaster"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.status}">
						<dt><g:message code="projectInfo.status.label" default="Status" /></dt>
						
							<dd><g:link controller="projectStatus" action="show" id="${projectInfoInstance?.status?.id}">${projectInfoInstance?.status?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.auditStatus}">
						<dt><g:message code="projectInfo.auditStatus.label" default="Audit Status" /></dt>
						
							<dd><g:link controller="auditStatus" action="show" id="${projectInfoInstance?.auditStatus?.id}">${projectInfoInstance?.auditStatus?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.link}">
						<dt><g:message code="projectInfo.link.label" default="Link" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="link"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.budgetWithContractors}">
						<dt><g:message code="projectInfo.budgetWithContractors.label" default="Budget With Contractors" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="budgetWithContractors"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.actualCost}">
						<dt><g:message code="projectInfo.actualCost.label" default="Actual Cost" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="actualCost"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.estimateToComplete}">
						<dt><g:message code="projectInfo.estimateToComplete.label" default="Estimate To Complete" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="estimateToComplete"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.loeHours}">
						<dt><g:message code="projectInfo.loeHours.label" default="Loe Hours" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="loeHours"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.anticipatedClientGP}">
						<dt><g:message code="projectInfo.anticipatedClientGP.label" default="Anticipated Client GP" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="anticipatedClientGP"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.billableAmount}">
						<dt><g:message code="projectInfo.billableAmount.label" default="Billable Amount" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="billableAmount"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.numberOfQualityMeasures}">
						<dt><g:message code="projectInfo.numberOfQualityMeasures.label" default="Number Of Quality Measures" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="numberOfQualityMeasures"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.numberOfQualityMeasuresNotMet}">
						<dt><g:message code="projectInfo.numberOfQualityMeasuresNotMet.label" default="Number Of Quality Measures Not Met" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="numberOfQualityMeasuresNotMet"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.startDate}">
						<dt><g:message code="projectInfo.startDate.label" default="Start Date" /></dt>
						
							<dd><g:formatDate date="${projectInfoInstance?.startDate}" /></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.closeDate}">
						<dt><g:message code="projectInfo.closeDate.label" default="Close Date" /></dt>
						
							<dd><g:formatDate date="${projectInfoInstance?.closeDate}" /></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.actualReleaseDate}">
						<dt><g:message code="projectInfo.actualReleaseDate.label" default="Actual Release Date" /></dt>
						
							<dd><g:formatDate date="${projectInfoInstance?.actualReleaseDate}" /></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.plannedReleaseDate}">
						<dt><g:message code="projectInfo.plannedReleaseDate.label" default="Planned Release Date" /></dt>
						
							<dd><g:formatDate date="${projectInfoInstance?.plannedReleaseDate}" /></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.category}">
						<dt><g:message code="projectInfo.category.label" default="Category" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="category"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.invoiceStatus}">
						<dt><g:message code="projectInfo.invoiceStatus.label" default="Invoice Status" /></dt>
						
							<dd><g:link controller="invoiceStatus" action="show" id="${projectInfoInstance?.invoiceStatus?.id}">${projectInfoInstance?.invoiceStatus?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.invoiceNote}">
						<dt><g:message code="projectInfo.invoiceNote.label" default="Invoice Note" /></dt>
						
							<dd><g:fieldValue bean="${projectInfoInstance}" field="invoiceNote"/></dd>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.changeOrders}">
						<dt><g:message code="projectInfo.changeOrders.label" default="Change Orders" /></dt>
						
							<g:each in="${projectInfoInstance.changeOrders}" var="c">
							<dd><g:link controller="changeOrder" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${projectInfoInstance?.qualityTargets}">
						<dt><g:message code="projectInfo.qualityTargets.label" default="Quality Targets" /></dt>
						
							<g:each in="${projectInfoInstance.qualityTargets}" var="q">
							<dd><g:link controller="qualityTarget" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
					
					<g:if test="${projectInfoInstance?.risks}">
						<div id="riskTable">
						    <table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Risks</caption>
								  <tr>
								    <th style="text-align: center">Risk</th>
								    <th style="text-align: center">Risk Migration Strategy</th>
								  </tr>
								  <g:each in="${projectInfoInstance.risks}" var="r">
								  	<tr>
								    	<td style="text-align: center">${r.risk}</td>
								    	<td style="text-align: center">${r.riskMigrationStrategy}</td>
								  </tr>
								</g:each>
								</table>
						</div>
					</g:if>
					
					<g:if test="${projectInfoInstance?.impediments}">
					<div id="impedimentsTable">
						    <table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Impediments</caption>
								  <tr>
								    <th style="text-align: center">Impediment</th>
								    <th style="text-align: center">Remediation Plan</th>
								  </tr>
								  <g:each in="${projectInfoInstance.impediments}" var="i">
								  	<tr>
								    	<td style="text-align: center">${i.impediment}</td>
								    	<td style="text-align: center">${i.remediationPlan}</td>
								  </tr>
								</g:each>
								</table>
						</div>
						</g:if>
					
					<g:if test="${projectInfoInstance?.changeOrders}">
						<div id="changeOrderTable">
						    <table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Change Orders</caption>
								  <tr>
								    <th style="text-align: center">Change Order Name</th>
								    <th style="text-align: center">Link</th>
								  </tr>
								  <g:each in="${projectInfoInstance.changeOrders}" var="c">
								  	<tr>
								    	<td style="text-align: center">${c.changeOrderName}</td>
								    	<td style="text-align: center">${c.linkriskMigrationStrategy}</td>
								  </tr>
								</g:each>
								</table>
						</div>	
					</g:if>
					
					<g:if test="${projectInfoInstance?.qualityTargets}">
						<div id="qualityTargetsTable">
						    <table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Quality Targets</caption>
								  <tr>
								    <th style="text-align: center">Quality Target</th>
								    <th style="text-align: center">Quality Measurement Process</th>
								  </tr>
								  <g:each in="${projectInfoInstance.qualityTargets}" var="q">
								  	<tr>
								    	<td style="text-align: center">${q.qualityTarget}</td>
								    	<td style="text-align: center">${q.qualityMeasurementProcess}</td>
								  </tr>
								</g:each>
								</table>
						</div>						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${projectInfoInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${projectInfoInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
