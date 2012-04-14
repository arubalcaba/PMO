
<%@ page import="com.parago.pmo.ProjectMilestone" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectMilestone.label', default: 'ProjectMilestone')}" />
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
				
				<dt>malcolm</dt>
					<g:if test="${projectMilestoneInstance?.adminKickOff}">
						<dt><g:message code="projectMilestone.adminKickOff.label" default="Admin Kick Off" /></dt>
						
							<dd><g:formatBoolean boolean="${projectMilestoneInstance?.adminKickOff}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.adminKickOffDate}">
						<dt><g:message code="projectMilestone.adminKickOffDate.label" default="Admin Kick Off Date" /></dt>
						
							<dd><g:formatDate date="${projectMilestoneInstance?.adminKickOffDate}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.solutionReview}">
						<dt><g:message code="projectMilestone.solutionReview.label" default="Solution Review" /></dt>
						
							<dd><g:formatBoolean boolean="${projectMilestoneInstance?.solutionReview}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.solutionReviewDate}">
						<dt><g:message code="projectMilestone.solutionReviewDate.label" default="Solution Review Date" /></dt>
						
							<dd><g:formatDate date="${projectMilestoneInstance?.solutionReviewDate}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.testStrategyReview}">
						<dt><g:message code="projectMilestone.testStrategyReview.label" default="Test Strategy Review" /></dt>
						
							<dd><g:formatBoolean boolean="${projectMilestoneInstance?.testStrategyReview}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.testStrategyReviewDate}">
						<dt><g:message code="projectMilestone.testStrategyReviewDate.label" default="Test Strategy Review Date" /></dt>
						
							<dd><g:formatDate date="${projectMilestoneInstance?.testStrategyReviewDate}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.midProjectAudit}">
						<dt><g:message code="projectMilestone.midProjectAudit.label" default="Mid Project Audit" /></dt>
						
							<dd><g:formatBoolean boolean="${projectMilestoneInstance?.midProjectAudit}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.midProjectAuditDate}">
						<dt><g:message code="projectMilestone.midProjectAuditDate.label" default="Mid Project Audit Date" /></dt>
						
							<dd><g:formatDate date="${projectMilestoneInstance?.midProjectAuditDate}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.sunsetReview}">
						<dt><g:message code="projectMilestone.sunsetReview.label" default="Sunset Review" /></dt>
						
							<dd><g:formatBoolean boolean="${projectMilestoneInstance?.sunsetReview}" /></dd>
						
					</g:if>
				
					<g:if test="${projectMilestoneInstance?.sunsetReviewDate}">
						<dt><g:message code="projectMilestone.sunsetReviewDate.label" default="Sunset Review Date" /></dt>
						
							<dd><g:formatDate date="${projectMilestoneInstance?.sunsetReviewDate}" /></dd>
						
					</g:if>
				
					
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${projectMilestoneInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${projectMilestoneInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
