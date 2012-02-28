<%@ page import="com.parago.pmo.Risk" %>



<div class="fieldcontain ${hasErrors(bean: riskInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="risk.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${riskInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: riskInstance, field: 'risk', 'error')} ">
	<label for="risk">
		<g:message code="risk.risk.label" default="Risk" />
		
	</label>
	<g:textField name="risk" value="${riskInstance?.risk}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: riskInstance, field: 'riskMigrationStrategy', 'error')} ">
	<label for="riskMigrationStrategy">
		<g:message code="risk.riskMigrationStrategy.label" default="Risk Migration Strategy" />
		
	</label>
	<g:textField name="riskMigrationStrategy" value="${riskInstance?.riskMigrationStrategy}"/>
</div>

