
<%@ page import="com.parago.pmo.ProjectMilestone" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'projectMilestone.label', default: 'ProjectMilestone')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="adminKickOff" title="${message(code: 'projectMilestone.adminKickOff.label', default: 'Admin Kick Off')}" />
						
							<g:sortableColumn property="adminKickOffDate" title="${message(code: 'projectMilestone.adminKickOffDate.label', default: 'Admin Kick Off Date')}" />
						
							<g:sortableColumn property="solutionReview" title="${message(code: 'projectMilestone.solutionReview.label', default: 'Solution Review')}" />
						
							<g:sortableColumn property="solutionReviewDate" title="${message(code: 'projectMilestone.solutionReviewDate.label', default: 'Solution Review Date')}" />
						
							<g:sortableColumn property="testStrategyReview" title="${message(code: 'projectMilestone.testStrategyReview.label', default: 'Test Strategy Review')}" />
						
							<g:sortableColumn property="testStrategyReviewDate" title="${message(code: 'projectMilestone.testStrategyReviewDate.label', default: 'Test Strategy Review Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${projectMilestoneInstanceList}" var="projectMilestoneInstance">
						<tr>
						
							<td><g:formatBoolean boolean="${projectMilestoneInstance.adminKickOff}" /></td>
						
							<td><g:formatDate date="${projectMilestoneInstance.adminKickOffDate}" /></td>
						
							<td><g:formatBoolean boolean="${projectMilestoneInstance.solutionReview}" /></td>
						
							<td><g:formatDate date="${projectMilestoneInstance.solutionReviewDate}" /></td>
						
							<td><g:formatBoolean boolean="${projectMilestoneInstance.testStrategyReview}" /></td>
						
							<td><g:formatDate date="${projectMilestoneInstance.testStrategyReviewDate}" /></td>
						
							<td class="link">
								<g:link action="show" id="${projectMilestoneInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${projectMilestoneInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
