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
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.editable.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'jquery.jeditable.js')}"  type="text/javascript"></script>
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
						</tr>
					</thead>
					</table>
							 <form id="formAddQualityTarget" action="#" title="Add New Quality Target">
								<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
								<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />
								<label for="riskt">Quality Target</label><br />
								<input type="text" name="qualityTarget" id="qualityTarget" rel="2" class="required" /><br />
								<label for="riskt">Quality Measurement Process</label><br />								
								<textarea rows="4" cols="50" maxlength="120" name="qualityMeasurementProcess" id="qualityMeasurementProcess" rel="3" class="required"></textarea><br />
								
								<br />
								<button id="btnAddQualityTargetCancel" value="cancel">Cancel</button>
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
							<th>Risk Migration Strategy</th>
						</tr>
					</thead>
					</table>
							 <form id="formAddRisk" action="#" title="Add New Risk">
								<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
								<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />
								<label for="riskt">Risk</label><br />
								<input type="text" name="risk" id="risk" rel="2" class="required maxLength#5" /><br />
								<label for="riskt">Risk Migration Strategy</label><br />
								<textarea rows="4" cols="50" maxlength="120" name="riskMigrationStrategy" id="riskMigrationStrategy" rel="3" class="required"></textarea><br />
								<br />
								<button id="btnAddRiskCancel" value="cancel">Cancel</button>
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
							<label for="riskt">Impediment</label><br />
							<input type="text" name="impediment" id="impediment" rel="2" class="required" /><br />
							<label for="riskt">Remediation Plan</label><br />							
							<textarea rows="4" cols="50" maxlength="120" name="remediationPlan" id="remediationPlan" rel="3" class="required"></textarea><br />
							<br />
							<button id="btnAddImpedimentCancel" value="cancel">Cancel</button>
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
							<th>Link</th>
						</tr>
					</thead>
					</table>
							 <form id="formAddChangeOrder" action="#" title="Add New Change Order">
								<input type="hidden" name="id" id="id" rel="0" value="DATAROWID" />
								<g:hiddenField name="projectInfo.id" value="${projectInfoInstance?.id}" rel="1" />
								<label for="riskt">Change Order Name</label><br />
								<input type="text" name="changeOrderName" id="changeOrderName" rel="2" class="required" /><br />
								<label for="riskt">Link</label><br />
								<input type="text" name="link" id="link" maxlength="120" rel="3" class="required" /><br />
								<br />
								<button id="btnAddChangeOrderCancel" value="cancel">Cancel</button>
								<button id="btnAddChangeOrderOk" value="Ok">Add Change Order</button>	
							</form>
        </div>
        <%--Ends Accordian--%>

				</div>
			</div>

		</div>
	</body>
</html>
