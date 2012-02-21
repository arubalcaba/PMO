
<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectInfo">
			
				<g:if test="${projectInfoInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectInfo.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${projectInfoInstance}" field="projectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.projectType}">
				<li class="fieldcontain">
					<span id="projectType-label" class="property-label"><g:message code="projectInfo.projectType.label" default="Project Type" /></span>
					
						<span class="property-value" aria-labelledby="projectType-label"><g:link controller="projectType" action="show" id="${projectInfoInstance?.projectType?.id}">${projectInfoInstance?.projectType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.projectCode}">
				<li class="fieldcontain">
					<span id="projectCode-label" class="property-label"><g:message code="projectInfo.projectCode.label" default="Project Code" /></span>
					
						<span class="property-value" aria-labelledby="projectCode-label"><g:link controller="projectCode" action="show" id="${projectInfoInstance?.projectCode?.id}">${projectInfoInstance?.projectCode?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.deliveryManager}">
				<li class="fieldcontain">
					<span id="deliveryManager-label" class="property-label"><g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" /></span>
					
						<span class="property-value" aria-labelledby="deliveryManager-label"><g:link controller="person" action="show" id="${projectInfoInstance?.deliveryManager?.id}">${projectInfoInstance?.deliveryManager?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.scrumMaster}">
				<li class="fieldcontain">
					<span id="scrumMaster-label" class="property-label"><g:message code="projectInfo.scrumMaster.label" default="Scrum Master" /></span>
					
						<span class="property-value" aria-labelledby="scrumMaster-label"><g:link controller="person" action="show" id="${projectInfoInstance?.scrumMaster?.id}">${projectInfoInstance?.scrumMaster?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="projectInfo.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="projectStatus" action="show" id="${projectInfoInstance?.status?.id}">${projectInfoInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.auditStatus}">
				<li class="fieldcontain">
					<span id="auditStatus-label" class="property-label"><g:message code="projectInfo.auditStatus.label" default="Audit Status" /></span>
					
						<span class="property-value" aria-labelledby="auditStatus-label"><g:link controller="projectStatus" action="show" id="${projectInfoInstance?.auditStatus?.id}">${projectInfoInstance?.auditStatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.link}">
				<li class="fieldcontain">
					<span id="link-label" class="property-label"><g:message code="projectInfo.link.label" default="Link" /></span>
					
						<span class="property-value" aria-labelledby="link-label"><g:fieldValue bean="${projectInfoInstance}" field="link"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.overallRating}">
				<li class="fieldcontain">
					<span id="overallRating-label" class="property-label"><g:message code="projectInfo.overallRating.label" default="Overall Rating" /></span>
					
						<span class="property-value" aria-labelledby="overallRating-label"><g:fieldValue bean="${projectInfoInstance}" field="overallRating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.ratingValue}">
				<li class="fieldcontain">
					<span id="ratingValue-label" class="property-label"><g:message code="projectInfo.ratingValue.label" default="Rating Value" /></span>
					
						<span class="property-value" aria-labelledby="ratingValue-label"><g:fieldValue bean="${projectInfoInstance}" field="ratingValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.closeDate}">
				<li class="fieldcontain">
					<span id="closeDate-label" class="property-label"><g:message code="projectInfo.closeDate.label" default="Close Date" /></span>
					
						<span class="property-value" aria-labelledby="closeDate-label"><g:formatDate date="${projectInfoInstance?.closeDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.budget}">
				<li class="fieldcontain">
					<span id="budget-label" class="property-label"><g:message code="projectInfo.budget.label" default="Budget" /></span>
					
						<span class="property-value" aria-labelledby="budget-label"><g:link controller="budget" action="show" id="${projectInfoInstance?.budget?.id}">${projectInfoInstance?.budget?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.schedule}">
				<li class="fieldcontain">
					<span id="schedule-label" class="property-label"><g:message code="projectInfo.schedule.label" default="Schedule" /></span>
					
						<span class="property-value" aria-labelledby="schedule-label"><g:link controller="schedule" action="show" id="${projectInfoInstance?.schedule?.id}">${projectInfoInstance?.schedule?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.changeOrders}">
				<li class="fieldcontain">
					<span id="changeOrders-label" class="property-label"><g:message code="projectInfo.changeOrders.label" default="Change Orders" /></span>
					
						<g:each in="${projectInfoInstance.changeOrders}" var="c">
						<span class="property-value" aria-labelledby="changeOrders-label"><g:link controller="changeOrder" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.impediments}">
				<li class="fieldcontain">
					<span id="impediments-label" class="property-label"><g:message code="projectInfo.impediments.label" default="Impediments" /></span>
					
						<g:each in="${projectInfoInstance.impediments}" var="i">
						<span class="property-value" aria-labelledby="impediments-label"><g:link controller="impediment" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectInfoInstance?.risks}">
				<li class="fieldcontain">
					<span id="risks-label" class="property-label"><g:message code="projectInfo.risks.label" default="Risks" /></span>
					
						<g:each in="${projectInfoInstance.risks}" var="r">
						<span class="property-value" aria-labelledby="risks-label"><g:link controller="risk" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
