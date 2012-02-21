<%@ page import="com.parago.pmo.Impediment" %>



<div class="fieldcontain ${hasErrors(bean: impedimentInstance, field: 'impediment', 'error')} required">
	<label for="impediment">
		<g:message code="impediment.impediment.label" default="Impediment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="impediment" maxlength="120" required="" value="${impedimentInstance?.impediment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: impedimentInstance, field: 'remediationPlan', 'error')} required">
	<label for="remediationPlan">
		<g:message code="impediment.remediationPlan.label" default="Remediation Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="remediationPlan" maxlength="120" required="" value="${impedimentInstance?.remediationPlan}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: impedimentInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="impediment.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${impedimentInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

