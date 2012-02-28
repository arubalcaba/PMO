<%@ page import="com.parago.pmo.ProjectInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectInfo.label', default: 'ProjectInfo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
        <script src='/PMO_Dashboard/js/edit.js' type='text/javascript'></script>
	</head>
	<body>
		<a href="#edit-projectInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-projectInfo" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${projectInfoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${projectInfoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
		<div id="accordion">
    		<h3><a href="#">Project</a></h3>
                  <div>
                    <g:form method="post" >
						<g:hiddenField name="id" value="${projectInfoInstance?.id}" />
						<g:hiddenField name="version" value="${projectInfoInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />							
						</fieldset>
					</g:form>
                  </div>
    <h3><a href="#">Quality Target</a></h3>
        <div>Quality Target Info</div>
     <h3><a href="#">Risks</a></h3>
        <div>Quality Risk Info</div>
         <h3><a href="#">Impediments</a></h3>
        <div>Impediments Info</div>
         <h3><a href="#">Change Order</a></h3>
        <div>Change Order Info</div>
      
</div>
			
			
		</div>
	</body>
</html>
