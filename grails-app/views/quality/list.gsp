
<%@ page import="com.parago.pmo.Quality" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quality.label', default: 'Quality')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-quality" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-quality" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="numberOfQualityMeasures" title="${message(code: 'quality.numberOfQualityMeasures.label', default: 'Number Of Quality Measures')}" />
					
						<g:sortableColumn property="numberOfQualityMeasuresNotMet" title="${message(code: 'quality.numberOfQualityMeasuresNotMet.label', default: 'Number Of Quality Measures Not Met')}" />
					
						<g:sortableColumn property="overallQualityRating" title="${message(code: 'quality.overallQualityRating.label', default: 'Overall Quality Rating')}" />
					
						<g:sortableColumn property="qualityRating" title="${message(code: 'quality.qualityRating.label', default: 'Quality Rating')}" />
					
						<th><g:message code="quality.projectInfo.label" default="Project Info" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${qualityInstanceList}" status="i" var="qualityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${qualityInstance.id}">${fieldValue(bean: qualityInstance, field: "numberOfQualityMeasures")}</g:link></td>
					
						<td>${fieldValue(bean: qualityInstance, field: "numberOfQualityMeasuresNotMet")}</td>
					
						<td>${fieldValue(bean: qualityInstance, field: "overallQualityRating")}</td>
					
						<td>${fieldValue(bean: qualityInstance, field: "qualityRating")}</td>
					
						<td>${fieldValue(bean: qualityInstance, field: "projectInfo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${qualityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
