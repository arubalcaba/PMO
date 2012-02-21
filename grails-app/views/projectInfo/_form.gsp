<%@ page import="com.parago.pmo.ProjectInfo" %>

<div>
      <p> Between <input type="text" id="datepicker"> </p>        
    </div>
    
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
	<g:select id="projectType" name="projectType.id" from="${com.parago.pmo.ProjectType.list()}" optionKey="id" required="" value="${projectInfoInstance?.projectType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'projectCode', 'error')} required">
	<label for="projectCode">
		<g:message code="projectInfo.projectCode.label" default="Project Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectCode" name="projectCode.id" from="${com.parago.pmo.ProjectCode.list()}" optionKey="id" required="" value="${projectInfoInstance?.projectCode?.id}" class="many-to-one"/>
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
	<g:select id="scrumMaster" name="scrumMaster.id" from="${com.parago.pmo.Person.list()}" optionKey="id" required="" value="${projectInfoInstance?.scrumMaster?.id}" class="many-to-one"/>
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
	<g:select id="auditStatus" name="auditStatus.id" from="${com.parago.pmo.ProjectStatus.list()}" optionKey="id" required="" value="${projectInfoInstance?.auditStatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'link', 'error')} required">
	<label for="link">
		<g:message code="projectInfo.link.label" default="Link" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="link" required="" value="${projectInfoInstance?.link}"/>
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

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'closeDate', 'error')} ">
	<label for="closeDate">
		<g:message code="projectInfo.closeDate.label" default="Close Date" />
		
	</label>
	
	<g:datePicker name="closeDate" precision="day"  value="${projectInfoInstance?.closeDate}" default="none" noSelection="['': '']" />
</div>

