
<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		
		
		
		
		
		
		
		
		<script type="text/css">

			.fieldcontain {
	margin-top: 1em;
}

.fieldcontain label,
.fieldcontain .property-label {
	color: #666666;
	text-align: right;
	width: 25%;
}

.fieldcontain .property-label {
	float: left;
}

.fieldcontain .property-value {
	display: block;
	margin-left: 27%;
}


</script>
		
	
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
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1>Project : ${projectInfoInstance.projectName} Details</h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				

				<table class="table table-condensed" > 
				   <g:if test="${projectInfoInstance?.projectName}">
						<tr>
						<td style="width:30%"><g:message code="projectInfo.projectName.label" default="Project Name" /></td>						
						<td style="width:70%"><g:fieldValue bean="${projectInfoInstance}" field="projectName"/><td>
						</tr>						
					</g:if> 							
				
					<g:if test="${projectInfoInstance?.projectCode}">
						<tr><td style="width:30%"><g:message code="projectInfo.projectCode.label" default="Project Code" /></td>						
							<td style="width:70%"><g:fieldValue bean="${projectInfoInstance}" field="projectCode"/></td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.link}">
						<tr><td style="width:30%"><g:message code="projectInfo.link.label" default="Project Link" /></td>						
							<td style="width:70%"><g:fieldValue bean="${projectInfoInstance}" field="link"/></td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.projectType}">
						<tr>
						<td style="width:30%"><g:message code="projectInfo.projectType.label" default="Project Type" /></td>						
					     <td style="width:70%"><g:fieldValue bean="${projectInfoInstance}" field="projectType"/></td>
					     </tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.deliveryManager}">
						<tr><td style="width:30%"><g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" /></td>
							<td style="width:70%">${projectInfoInstance?.deliveryManager?.encodeAsHTML()}</td></tr>						
					</g:if>
				
					<g:if test="${projectInfoInstance?.scrumMaster}">
						<tr><td style="width:30%"><g:message code="projectInfo.scrumMaster.label" default="Scrum Master" /></td>						
							<td style="width:70%"><g:fieldValue bean="${projectInfoInstance}" field="scrumMaster"/></td></tr>						
					</g:if>
				
					<g:if test="${projectInfoInstance?.status}">
						<tr><td style="width:30%"><g:message code="projectInfo.status.label" default="Project Status" /></td>
							<td style="width:70%">${projectInfoInstance?.status?.encodeAsHTML()}</td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.startDate}">
						<tr><td style="width:30%"><g:message code="projectInfo.startDate.label" default="Start Date" /></td>						
							<td style="width:70%"><g:formatDate format="MM/dd/yyyy" date="${projectInfoInstance?.startDate}" /></td></tr>						
					</g:if>
						<g:if test="${projectInfoInstance?.plannedReleaseDate}">
						<tr><td style="width:30%"><g:message code="projectInfo.plannedReleaseDate.label" default="Planned Release Date" /></td>						
							<td style="width:70%"><g:formatDate format="MM/dd/yyyy" date="${projectInfoInstance?.plannedReleaseDate}" /></td></tr>						
					</g:if>			
					<g:if test="${projectInfoInstance?.actualReleaseDate}">
						<tr><td style="width:30%"><g:message code="projectInfo.actualReleaseDate.label" default="Actual Release Date" /></td>						
							<td style="width:70%"><g:formatDate format="MM/dd/yyyy" date="${projectInfoInstance?.actualReleaseDate}" /></td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.scheduleComments}">
						<tr><td style="width:30%"><g:message code="projectInfo.auditTurnoverComments.label" default="Schedule Comments" /></td>
							<td style="width:70%">${projectInfoInstance?.scheduleComments?.encodeAsHTML()}</td></tr>					
					</g:if>	
					<g:if test="${projectInfoInstance?.budgetWithContractors != null}">
						<tr><td style="width:30%"><g:message code="projectInfo.budgetWithContractors.label" default="Budget With Contractors (\$)" /></td>						
							<td style="width:70%"><g:formatNumber number="${projectInfoInstance?.budgetWithContractors}" type="currency" currencyCode="USD" /></td></tr>						
					</g:if>
				
					<g:if test="${projectInfoInstance?.actualCost != null}">
						<tr><td style="width:30%"><g:message code="projectInfo.actualCost.label" default="Actual Cost (\$)" /></td>						
							<td style="width:70%"><g:formatNumber number="${projectInfoInstance?.actualCost}" type="currency" currencyCode="USD" /></td></tr>						
					</g:if>
				
					<g:if test="${projectInfoInstance?.estimateToComplete != null}">
						<tr><td style="width:30%"><g:message code="projectInfo.estimateToComplete.label" default="Estimate To Complete (\$)" /></td>						
							<td style="width:70%"><g:formatNumber number="${projectInfoInstance?.estimateToComplete}" type="currency" currencyCode="USD"/></td></tr>						
					</g:if>
				
					<g:if test="${projectInfoInstance?.loeHours != null}">
						<tr><td style="width:30%"><g:message code="projectInfo.loeHours.label" default="Loe Hours" /></td>						
							<td style="width:70%"><g:fieldValue bean="${projectInfoInstance}" field="loeHours"/></td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.budgetComments}">
						<tr><td style="width:30%"><g:message code="projectInfo.budgetComments.label" default="Budget Comments" /></td>
							<td style="width:70%">${projectInfoInstance?.budgetComments?.encodeAsHTML()}</td></tr>					
					</g:if>	
					<g:if test="${projectInfoInstance?.numberOfQualityMeasures != null}">
						<tr><td style="width:30%"><g:message code="projectInfo.numberOfQualityMeasures.label" default="Number Of Quality Measures" /></td>						
							<td style="width:70%"><g:fieldValue bean="${projectInfoInstance}" field="numberOfQualityMeasures"/></td></tr>						
					</g:if>
				
					<g:if test="${projectInfoInstance?.numberOfQualityMeasuresNotMet != null}">
						<tr><td style="width:30%"><g:message code="projectInfo.numberOfQualityMeasuresNotMet.label" default="Number Of Quality Measures Not Met" /></td>						
							<td style="width:70%"><g:fieldValue bean="${projectInfoInstance}" field="numberOfQualityMeasuresNotMet"/></td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.qualityMet != null}">
						<tr><td style="width:30%"><g:message code="projectInfo.qualityMet.label" default="Quality Met" /></td>
							<td style="width:70%"><g:formatBoolean boolean="${projectInfoInstance?.qualityMet}" true="Yes" false="No"/></td></tr>					
					</g:if>	
						<g:if test="${projectInfoInstance?.qualityComments}">
						<tr><td style="width:30%"><g:message code="projectInfo.qualityComments.label" default="Quality Comments" /></td>
							<td style="width:70%">${projectInfoInstance?.qualityComments?.encodeAsHTML()}</td></tr>					
					</g:if>	
					<g:if test="${projectInfoInstance?.category}">
						<tr><td style="width:30%"><g:message code="projectInfo.category.label" default="Category" /></td>						
							<td style="width:70%"><g:fieldValue  bean="${projectInfoInstance}" field="category"/></td></tr>						
					</g:if>
					
					<g:if test="${projectInfoInstance?.anticipatedClientGP != null}">
						<tr><td style="width:30%"><g:message code="projectInfo.anticipatedClientGP.label" default="Anticipated Client GP (\$)" /></td>						
							<td style="width:70%"><g:formatNumber number="${projectInfoInstance?.anticipatedClientGP}" type="currency" currencyCode="USD" /></td></tr>						
					</g:if>
					
					<g:if test="${projectInfoInstance?.supportDocDelivered}">
						<tr><td style="width:30%"><g:message code="projectInfo.supportDocDelivered.label" default="Support Doc Delivered Date" /></td>						
							<td style="width:70%"><g:formatDate format="MM/dd/yyyy" date="${projectInfoInstance?.supportDocDelivered}" /></td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.thirtyDayReview}">
						<tr><td style="width:30%"><g:message code="projectInfo.thirtyDayReview.label" default="30 day Review Date" /></td>						
							<td style="width:70%"><g:formatDate format="MM/dd/yyyy" date="${projectInfoInstance?.thirtyDayReview}" /></td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.sixtyDayReview}">
						<tr><td style="width:30%"><g:message code="projectInfo.sixtyDayReview.label" default="60 day Review Date" /></td>						
							<td style="width:70%"><g:formatDate format="MM/dd/yyyy" date="${projectInfoInstance?.sixtyDayReview}" /></td></tr>						
					</g:if>
					<g:if test="${projectInfoInstance?.handOffComplete}">
						<tr><td style="width:30%"><g:message code="projectInfo.handOffComplete.label" default="Hand Off Complete Date" /></td>						
							<td style="width:70%"><g:formatDate format="MM/dd/yyyy" date="${projectInfoInstance?.handOffComplete}" /></td></tr>						
					</g:if>				
					
					<g:if test="${projectInfoInstance?.turnoverStatus}">
						<tr><td style="width:30%"><g:message code="projectInfo.supportStatus.label" default="Turnover Status" /></td>
							<td style="width:70%">${projectInfoInstance?.turnoverStatus?.encodeAsHTML()}</td></tr>					
					</g:if>
	
					<g:if test="${projectInfoInstance?.auditStatus}">
						<tr><td style="width:30%"><g:message code="projectInfo.auditStatus.label" default="Audit Status" /></td>
							<td style="width:70%">${projectInfoInstance?.auditStatus?.encodeAsHTML()}</td></tr>					
					</g:if>
					<g:if test="${projectInfoInstance?.auditTurnoverComments}">
						<tr><td style="width:30%"><g:message code="projectInfo.auditTurnoverComments.label" default="Audit Turnover Comments" /></td>
							<td style="width:70%">${projectInfoInstance?.auditTurnoverComments?.encodeAsHTML()}</td></tr>					
					</g:if>
					<g:if test="${projectInfoInstance?.execSummary}">
						<tr><td style="width:30%"><g:message code="projectInfo.execSummary.label" default="Exective Summary" /></td>
							<td style="width:70%">${projectInfoInstance?.execSummary?.decodeHTML()}</td></tr>					
					</g:if>					
	
					<g:if test="${projectInfoInstance?.closeDate}">
						<tr><td style="width:30%"><g:message code="projectInfo.closeDate.label" default="Close Date" /></td>						
							<td style="width:70%"><g:formatDate format="MM/dd/yyyy" date="${projectInfoInstance?.closeDate}" /></td></tr>						
					</g:if>
					
					
					<g:if test="${projectInfoInstance?.projectMilestones}">
						    <tr><td colspan="2"><table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Project Milestones</caption>
								  <tr>
								    <th style="text-align: center">Milestone</th>
								    <th style="text-align: center">Complete</th>
								    <th style="text-align: center">Date</th>
								    <th style="text-align: center">Note</th>
								  </tr>
								  <g:each in="${projectInfoInstance.projectMilestones}" var="pm">
								  	<tr>
								    	<td style="text-align: center">${pm?.milestone?.encodeAsHTML()}</td>
								    	<td style="text-align: center"><g:formatBoolean boolean="${pm?.complete}" true="Yes" false="No"/></td>
								    	<td style="text-align: center"><g:formatDate format="MM/dd/yyy" date="${pm?.date}" /></td>
								    	<td style="text-align: center">${pm?.note}</td>
								  </tr>
								</g:each>
								</table>
						</td></tr>
					</g:if>
					
					<g:if test="${projectInfoInstance?.invocies}">
						    <tr><td colspan="2"><table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Project Invoices</caption>
								  <tr>
								    <th style="text-align: center">Billable  Amount (\$)</th>
								    <th style="text-align: center">Invoice Status</th>
								    <th style="text-align: center">Invoice Note</th>
								  </tr>
								  <g:each in="${projectInfoInstance.invocies}" var="pi">
								  	<tr>
								  		<td style="text-align: center"><g:formatNumber number="${pi?.billableAmount}" type="currency" currencyCode="USD" /></td>
								    	<td style="text-align: center">${pi?.invoiceStatus?.encodeAsHTML()}</td>								
								    	<td style="text-align: center">${pi?.invoiceNote}</td>
								  </tr>
								</g:each>
								</table>
						</td></tr>
					</g:if>
	
					<g:if test="${projectInfoInstance?.risks}">
						    <tr><td colspan="2"><table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Risks</caption>
								  <tr>
								    <th style="text-align: center">Risk</th>
								    <th style="text-align: center">Risk Migration Strategy</th>
								  </tr>
								  <g:each in="${projectInfoInstance.risks}" var="r">
								  	<tr>
								    	<td style="text-align: center">${r?.risk}</td>
								    	<td style="text-align: center">${r?.riskMigrationStrategy}</td>
								  </tr>
								</g:each>
								</table>
						</td></tr>
					</g:if>
					
					<g:if test="${projectInfoInstance?.impediments}">
					<tr><td colspan="2">
						    <table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Impediments</caption>
								  <tr>
								    <th style="text-align: center">Impediment</th>
								    <th style="text-align: center">Remediation Plan</th>
								  </tr>
								  <g:each in="${projectInfoInstance.impediments}" var="i">
								  	<tr>
								    	<td style="text-align: center">${i?.impediment}</td>
								    	<td style="text-align: center">${i?.remediationPlan}</td>
								  </tr>
								</g:each>
								</table>
						</td></tr>
						</g:if>
					
					<g:if test="${projectInfoInstance?.changeOrders}">
						<tr><td colspan="2">
						    <table class="table table-condensed table-bordered" style="width:50%">
								  <caption>Change Orders</caption>
								  <tr>
								    <th style="text-align: center">Change Order Name</th>
								    <th style="text-align: center">Cost Impact (\$)</th>
								    <th style="text-align: center">Schedule Impact</th>
								    <th style="text-align: center">Link</th>
								  </tr>
								  <g:each in="${projectInfoInstance.changeOrders}" var="c">
								  	<tr>
								    	<td style="text-align: center">${c?.changeOrderName}</td>
								    	<td style="text-align: center"><g:formatNumber number="${c?.costImpact}" type="currency" currencyCode="USD" /></td>
								    	<td style="text-align: center">${c?.scheduleImpact}</td>
								    	<td style="text-align: center">${c?.link}</td><g:formatNumber number="${projectInfoInstance?.actualCost}" type="currency" currencyCode="USD" />
								  </tr>
								</g:each>
								</table>
						</td></tr>	
					</g:if>
					
					<g:if test="${projectInfoInstance?.qualityTargets}">
						<tr><td colspan="2">
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
						</td></tr>						
					</g:if>

				</table>				
				

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
