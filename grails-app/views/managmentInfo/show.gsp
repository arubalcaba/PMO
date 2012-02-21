
<%@ page import="com.parago.pmo.ManagmentInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managmentInfo.label', default: 'ManagmentInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-managmentInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-managmentInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list managmentInfo">
			
				<g:if test="${managmentInfoInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="managmentInfo.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${managmentInfoInstance?.category?.id}">${managmentInfoInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.capCost}">
				<li class="fieldcontain">
					<span id="capCost-label" class="property-label"><g:message code="managmentInfo.capCost.label" default="Cap Cost" /></span>
					
						<span class="property-value" aria-labelledby="capCost-label"><g:fieldValue bean="${managmentInfoInstance}" field="capCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.expenseCost}">
				<li class="fieldcontain">
					<span id="expenseCost-label" class="property-label"><g:message code="managmentInfo.expenseCost.label" default="Expense Cost" /></span>
					
						<span class="property-value" aria-labelledby="expenseCost-label"><g:fieldValue bean="${managmentInfoInstance}" field="expenseCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.billableAmount}">
				<li class="fieldcontain">
					<span id="billableAmount-label" class="property-label"><g:message code="managmentInfo.billableAmount.label" default="Billable Amount" /></span>
					
						<span class="property-value" aria-labelledby="billableAmount-label"><g:fieldValue bean="${managmentInfoInstance}" field="billableAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.marginCost}">
				<li class="fieldcontain">
					<span id="marginCost-label" class="property-label"><g:message code="managmentInfo.marginCost.label" default="Margin Cost" /></span>
					
						<span class="property-value" aria-labelledby="marginCost-label"><g:fieldValue bean="${managmentInfoInstance}" field="marginCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.marginPercent}">
				<li class="fieldcontain">
					<span id="marginPercent-label" class="property-label"><g:message code="managmentInfo.marginPercent.label" default="Margin Percent" /></span>
					
						<span class="property-value" aria-labelledby="marginPercent-label"><g:fieldValue bean="${managmentInfoInstance}" field="marginPercent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.anticipatedClientGP}">
				<li class="fieldcontain">
					<span id="anticipatedClientGP-label" class="property-label"><g:message code="managmentInfo.anticipatedClientGP.label" default="Anticipated Client GP" /></span>
					
						<span class="property-value" aria-labelledby="anticipatedClientGP-label"><g:fieldValue bean="${managmentInfoInstance}" field="anticipatedClientGP"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.invoiceNote}">
				<li class="fieldcontain">
					<span id="invoiceNote-label" class="property-label"><g:message code="managmentInfo.invoiceNote.label" default="Invoice Note" /></span>
					
						<span class="property-value" aria-labelledby="invoiceNote-label"><g:fieldValue bean="${managmentInfoInstance}" field="invoiceNote"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.invoiceStatus}">
				<li class="fieldcontain">
					<span id="invoiceStatus-label" class="property-label"><g:message code="managmentInfo.invoiceStatus.label" default="Invoice Status" /></span>
					
						<span class="property-value" aria-labelledby="invoiceStatus-label"><g:link controller="invoiceStatus" action="show" id="${managmentInfoInstance?.invoiceStatus?.id}">${managmentInfoInstance?.invoiceStatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${managmentInfoInstance?.projectInfo}">
				<li class="fieldcontain">
					<span id="projectInfo-label" class="property-label"><g:message code="managmentInfo.projectInfo.label" default="Project Info" /></span>
					
						<span class="property-value" aria-labelledby="projectInfo-label"><g:link controller="projectInfo" action="show" id="${managmentInfoInstance?.projectInfo?.id}">${managmentInfoInstance?.projectInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${managmentInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${managmentInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
