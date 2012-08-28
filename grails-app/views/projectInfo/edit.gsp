<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
        
        <link rel="stylesheet" href="${resource(dir: 'jui', file: 'jquery-ui.css')}" type="text/css">    
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.dataTables_themeroller.css')}" type="text/css">
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery-ui-1.8.18.custom.min.js')}"  type="text/javascript"></script>
	    <script  rel="javascript" src="${resource(dir: 'js', file: 'json2.js')}"  type="text/javascript"></script>	
	    <script  rel="javascript" src="${request.contextPath}/js/ckeditor/ckeditor.js"  type="text/javascript"></script>
	    <script  rel="javascript" src="${request.contextPath}/js/ckeditor/adapters/jquery.js"  type="text/javascript"></script>	   
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.editable.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.jeditable.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.jeditable.checkbox.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.jeditable.datepicker.js')}"  type="text/javascript"></script>	
	    <script  rel="javascript" src="${resource(dir: 'js', file: 'edit.js')}"  type="text/javascript"></script>

        
        </head>
	<body>
	<g:hiddenField name="projectInfo" id="projectInfo" value="${projectInfoInstance?.id}"/>
	<g:hiddenField name="context" id="context" value="${request.contextPath}"/>
	
	
	
	
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
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${projectInfoInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${projectInfoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>
				
				<div id="accordion">
					<h3><a href="#">Project</a></h3>
				 <div>	
					<fieldset>
						<g:form class="form-horizontal" action="edit" id="${projectInfoInstance?.id}" >
							<g:hiddenField name="version" value="${projectInfoInstance?.version}" />
							<fieldset>
								<g:render template="form"/>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">
										<i class="icon-ok icon-white"></i>
										<g:message code="default.button.update.label" default="Update" />
									</button>
								</div>
							</fieldset>
						</g:form>
					</fieldset>
				  </div>
				  
	<%--Begin Milestones Section--%>             
    <h3><a href="#">Milestones</a></h3>
        <div>
        	<button id="btnAddMilestone">Add MileStone</button>
        	<button id="btnDelMilestone">Delete MileStone</button>
				<table  width="100%" cellpadding="0" cellspacing="0" border="0" class="display" id="milestoneTable">
					<thead>
						<tr>
							<th>ID</th>
							<th>ProjectInfoId</th>
							<th>Milestone</th>
							<th>Complete</th>
							<th>Date</th>
							<th>Note</th>
						</tr>
					</thead>
					</table>
							 <form id="formAddMilestone" action="#" title="Add New Milestone">
								<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
								<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />												
								<label for="milestone">Milestone</label><br />
								<select name="milestone" id="milestone" rel="2" class="required"></select><br />								
								<label for="complete">Complete</label>						
								<input type="checkBox" name="complete" id="complete" rel="3"  value="true" /><br />
								<label for="milestoneDate">Date</label><br />
								<input type="text" name="date" id="milestoneDate" rel="4" class="required date" /><br />
								<label for="note">Note</label><br />
								<textarea rows="4" cols="50" maxlength="1000" name="note" id="note" rel="5"></textarea><br />
																
								<br />
								<button id="btnAddMilestoneCancel" value="cancel">Cancel Milestone</button>
								<button id="btnAddMilestoneOk" value="Ok">Add Milestone</button>	
							</form>
		</div>
	<%--Begin Invoices--%>             
    <h3><a href="#">Invoices</a></h3>
        <div>
        	<button id="btnAddInvoice">Add Invoice</button>
        	<button id="btnDelInvoice">Delete Invoice</button>
				<table  width="100%" cellpadding="0" cellspacing="0" border="0" class="display" id="invoiceTable">
					<thead>
						<tr>
							<th>ID</th>
							<th>ProjectInfoId</th>
							<th>Billable Amount ($)</th>
							<th>Status</th>
							<th>Note</th>
						</tr>
					</thead>
					</table>
							 <form id="formAddInvoice" action="#" title="Add New Invoice">
								<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
								<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />
								<label for="billableAmount">Billable Amount ($)</label><br />
								<input type="text" name="billableAmount" id="billableAmount" rel="2" class="required number" /><br />
								<label for="invoiceStatus">Status</label><br />
								<select name="invoiceStatus" id="invoiceStatus" rel="3" class="required"></select><br />							
								<label for="invoiceNote">Note</label><br />
								<textarea rows="4" cols="50" maxlength="100" name="invoiceNote" id="invoiceNote" rel="4"></textarea><br />
								<br />
								<button id="btnAddInvoiceCancel" value="cancel">Cancel Invoice</button>
								<button id="btnAddInvoiceOk" value="Ok">Add Invoice</button>	
							</form>
		</div>
			  
 <%--Begin Quality Target Section--%>             
    <h3><a href="#">Quality Target</a></h3>
        <div>
        	<button id="btnAddQualityTarget">Add Quality Target</button>
        	<button id="btnDelQualityTarget">Delete Quality Target</button>
				<table  width="100%" cellpadding="0" cellspacing="0" border="0" class="display" id="qualityTargetTable">
					<thead>
						<tr>
							<th>ID</th>
							<th>ProjectInfoId</th>
							<th>Quality Target</th>
							<th>Quality Measurement Process</th>
                            <th>Quality Not Met</th>
						</tr>
					</thead>
					</table>
							 <form id="formAddQualityTarget" action="#" title="Add New Quality Target">
								<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
								<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />
								<label for="qualityTarget">Quality Target</label><br />
								<input type="text" name="qualityTarget" id="qualityTarget" rel="2" class="required" maxlength="2000" /><br />
								<label for="qualityMeasurementProcess">Quality Measurement Process</label><br />								
								<textarea rows="4" cols="50" maxlength="2000" name="qualityMeasurementProcess" id="qualityMeasurementProcess" rel="3" class="required"></textarea><br />
                                 <label for="qualityMet">Quality Met</label>
                                 <input type="checkBox" name="qualityMet" id="qualityMet" rel="4"  value="true" /><br />
								<br />
								<button id="btnAddQualityTargetCancel" value="cancel">Cancel Quality Target</button>
								<button id="btnAddQualityTargetOk" value="Ok">Add Quality Target</button>	
							</form>
		</div>
		
		<%--Begin Risk Section--%>
     	<h3><a href="#">Risks</a></h3>
        <div>
        	<button id="btnAddRisk">Add Risk</button>
        	<button id="btnDelRisk">Delete Risk</button>
				<table  width="100%" cellpadding="0" cellspacing="0" border="0" class="display" id="riskTable">
					<thead>
						<tr>
							<th>ID</th>
							<th>ProjectInfoId</th>
							<th>Risk</th>
							<th>Risk Mitigation Strategy</th>
						</tr>
					</thead>
					</table>
							 <form id="formAddRisk" action="#" title="Add New Risk">
								<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
								<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />
								<label for="risk">Risk</label><br />
								<input type="text" name="risk" id="risk" rel="2" class="required" maxlength="1000" /><br />
								<label for="riskMitigationStrategy">Risk Mitigation Strategy</label><br />
								<textarea rows="4" cols="50" maxlength="1000" name="riskMitigationStrategy" id="riskMitigationStrategy" rel="3" class="required"></textarea><br />
								<br />
								<button id="btnAddRiskCancel" value="cancel">Cancel Risk</button>
								<button id="btnAddRiskOk" value="Ok">Add Risk</button>	
							</form>
     	</div>
     	
     	<%--Begin Impediment Section--%>
         <h3><a href="#">Impediments</a></h3>
        <div>
        	<button id="btnAddImpediment">Add Impediment</button>
        	<button id="btnDelImpediment">Delete Impediment</button>
				<table  width="100%" cellpadding="0" cellspacing="0" border="0" class="display" id="impedimentTable">
					<thead>
						<tr>
							<th>ID</th>
							<th>ProjectInfoId</th>
							<th>Impediment</th>
							<th>Remediation Plan</th>
						</tr>
					</thead>
					</table>
						 <form id="formAddImpediment" action="#" title="Add New Impediment">
							<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
							<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />
							<label for="impediment">Impediment</label><br />
							<input type="text" name="impediment" id="impediment" rel="2" class="required" maxlength="1000"/><br />
							<label for="remediationPlan">Remediation Plan</label><br />							
							<textarea rows="4" cols="50" maxlength="1000" name="remediationPlan" id="remediationPlan" rel="3" class="required"></textarea><br />
							<br />
							<button id="btnAddImpedimentCancel" value="cancel">Cancel Impediment</button>
							<button id="btnAddImpedimentOk" value="Ok">Add Impediment</button>	
						</form>
        </div>
        
        <%--Begin Change Order Section--%>
         <h3><a href="#">Change Order</a></h3>
        <div>
        <button id="btnAddChangeOrder">Add Change Order</button>
        	<button id="btnDelChangeOrder">Delete Change Order</button>
				<table  width="100%" cellpadding="0" cellspacing="0" border="0" class="display" id="changeOrderTable">
					<thead>
						<tr>
							<th>ID</th>
							<th>ProjectInfoId</th>
							<th>Change Order Name</th>
							<th>Cost Impact ($)</th>
							<th>Schedule Impact</th>
							<th>Link</th>
						</tr>
					</thead>
					</table>
							 <form id="formAddChangeOrder" action="#" title="Add New Change Order">
								<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
								<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />
								<label for="changeOrderName">Change Order Name</label><br />
								<input type="text" name="changeOrderName" id="changeOrderName" rel="2" class="required" /><br />
								<label for="costImpact">Cost Impact ($)</label><br />
								<input type="text" name="costImpact" id="costImpact" rel="3" class="required number" /><br />
								<label for="scheduleImpact">Schedule Impact</label><br />
								<input type="text" name="scheduleImpact" id="scheduleImpact" rel="4" class="required" /><br />
								<label for="link">Link</label><br />
                                <textarea name="link" id="link" maxlength="1000" rel="5" class="required"></textarea><br />
								<br />
								<button id="btnAddChangeOrderCancel" value="cancel">Cancel Change Order</button>
								<button id="btnAddChangeOrderOk" value="Ok">Add Change Order</button>	
							</form>
        </div>
        <%--Ends Accordian--%>

				</div>
			</div>

		</div>
	</body>
</html>
