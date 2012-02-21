<%@ page import="com.parago.pmo.ChangeOrder" %>



<div class="fieldcontain ${hasErrors(bean: changeOrderInstance, field: 'changeOrderName', 'error')} required">
	<label for="changeOrderName">
		<g:message code="changeOrder.changeOrderName.label" default="Change Order Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="changeOrderName" maxlength="120" required="" value="${changeOrderInstance?.changeOrderName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeOrderInstance, field: 'link', 'error')} required">
	<label for="link">
		<g:message code="changeOrder.link.label" default="Link" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="link" cols="40" rows="5" maxlength="2000" required="" value="${changeOrderInstance?.link}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeOrderInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="changeOrder.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${changeOrderInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

