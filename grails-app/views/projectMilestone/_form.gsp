<%@ page import="com.parago.pmo.ProjectMilestone" %>



<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'adminKickOff', 'error')} ">
	<label for="adminKickOff">
		<g:message code="projectMilestone.adminKickOff.label" default="Admin Kick Off" />
		
	</label>
	<g:checkBox name="adminKickOff" value="${projectMilestoneInstance?.adminKickOff}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'adminKickOffDate', 'error')} ">
	<label for="adminKickOffDate">
		<g:message code="projectMilestone.adminKickOffDate.label" default="Admin Kick Off Date" />
		
	</label>
	<g:datePicker name="adminKickOffDate" precision="day"  value="${projectMilestoneInstance?.adminKickOffDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'solutionReview', 'error')} ">
	<label for="solutionReview">
		<g:message code="projectMilestone.solutionReview.label" default="Solution Review" />
		
	</label>
	<g:checkBox name="solutionReview" value="${projectMilestoneInstance?.solutionReview}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'solutionReviewDate', 'error')} ">
	<label for="solutionReviewDate">
		<g:message code="projectMilestone.solutionReviewDate.label" default="Solution Review Date" />
		
	</label>
	<g:datePicker name="solutionReviewDate" precision="day"  value="${projectMilestoneInstance?.solutionReviewDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'testStrategyReview', 'error')} ">
	<label for="testStrategyReview">
		<g:message code="projectMilestone.testStrategyReview.label" default="Test Strategy Review" />
		
	</label>
	<g:checkBox name="testStrategyReview" value="${projectMilestoneInstance?.testStrategyReview}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'testStrategyReviewDate', 'error')} ">
	<label for="testStrategyReviewDate">
		<g:message code="projectMilestone.testStrategyReviewDate.label" default="Test Strategy Review Date" />
		
	</label>
	<g:datePicker name="testStrategyReviewDate" precision="day"  value="${projectMilestoneInstance?.testStrategyReviewDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'midProjectAudit', 'error')} ">
	<label for="midProjectAudit">
		<g:message code="projectMilestone.midProjectAudit.label" default="Mid Project Audit" />
		
	</label>
	<g:checkBox name="midProjectAudit" value="${projectMilestoneInstance?.midProjectAudit}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'midProjectAuditDate', 'error')} ">
	<label for="midProjectAuditDate">
		<g:message code="projectMilestone.midProjectAuditDate.label" default="Mid Project Audit Date" />
		
	</label>
	<g:datePicker name="midProjectAuditDate" precision="day"  value="${projectMilestoneInstance?.midProjectAuditDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'sunsetReview', 'error')} ">
	<label for="sunsetReview">
		<g:message code="projectMilestone.sunsetReview.label" default="Sunset Review" />
		
	</label>
	<g:checkBox name="sunsetReview" value="${projectMilestoneInstance?.sunsetReview}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'sunsetReviewDate', 'error')} ">
	<label for="sunsetReviewDate">
		<g:message code="projectMilestone.sunsetReviewDate.label" default="Sunset Review Date" />
		
	</label>
	<g:datePicker name="sunsetReviewDate" precision="day"  value="${projectMilestoneInstance?.sunsetReviewDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectMilestoneInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="projectMilestone.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${projectMilestoneInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

