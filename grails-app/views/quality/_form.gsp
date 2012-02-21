<%@ page import="com.parago.pmo.Quality" %>



<div class="fieldcontain ${hasErrors(bean: qualityInstance, field: 'numberOfQualityMeasures', 'error')} required">
	<label for="numberOfQualityMeasures">
		<g:message code="quality.numberOfQualityMeasures.label" default="Number Of Quality Measures" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="numberOfQualityMeasures" required="" value="${fieldValue(bean: qualityInstance, field: 'numberOfQualityMeasures')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: qualityInstance, field: 'numberOfQualityMeasuresNotMet', 'error')} required">
	<label for="numberOfQualityMeasuresNotMet">
		<g:message code="quality.numberOfQualityMeasuresNotMet.label" default="Number Of Quality Measures Not Met" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="numberOfQualityMeasuresNotMet" required="" value="${fieldValue(bean: qualityInstance, field: 'numberOfQualityMeasuresNotMet')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: qualityInstance, field: 'overallQualityRating', 'error')} ">
	<label for="overallQualityRating">
		<g:message code="quality.overallQualityRating.label" default="Overall Quality Rating" />
		
	</label>
	<g:textField name="overallQualityRating" value="${qualityInstance?.overallQualityRating}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: qualityInstance, field: 'qualityRating', 'error')} required">
	<label for="qualityRating">
		<g:message code="quality.qualityRating.label" default="Quality Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="qualityRating" required="" value="${fieldValue(bean: qualityInstance, field: 'qualityRating')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: qualityInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="quality.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${qualityInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

