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

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'budget', 'error')} ">
	<label for="budget">
		<g:message code="projectInfo.budget.label" default="Budget" />
		
	</label>
	<g:select id="budget" name="budget.id" from="${com.parago.pmo.Budget.list()}" optionKey="id" value="${projectInfoInstance?.budget?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInfoInstance, field: 'schedule', 'error')} ">
	<label for="schedule">
		<g:message code="projectInfo.schedule.label" default="Schedule" />
		
	</label>
	<g:select id="schedule" name="schedule.id" from="${com.parago.pmo.Schedule.list()}" optionKey="id" value="${projectInfoInstance?.schedule?.id}" class="many-to-one" noSelection="['null': '']"/>
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

