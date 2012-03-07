
<%@ page import="com.parago.pmo.QualityTarget" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'qualityTarget.label', default: 'QualityTarget')}" />
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
						
							<th class="header"><g:message code="qualityTarget.projectInfo.label" default="Project Info" /></th>
						
							<g:sortableColumn property="qualityMeasurementProcess" title="${message(code: 'qualityTarget.qualityMeasurementProcess.label', default: 'Quality Measurement Process')}" />
						
							<g:sortableColumn property="qualityTarget" title="${message(code: 'qualityTarget.qualityTarget.label', default: 'Quality Target')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${qualityTargetInstanceList}" var="qualityTargetInstance">
						<tr>
						
							<td>${fieldValue(bean: qualityTargetInstance, field: "projectInfo")}</td>
						
							<td>${fieldValue(bean: qualityTargetInstance, field: "qualityMeasurementProcess")}</td>
						
							<td>${fieldValue(bean: qualityTargetInstance, field: "qualityTarget")}</td>
						
							<td class="link">
								<g:link action="show" id="${qualityTargetInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${qualityTargetInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
