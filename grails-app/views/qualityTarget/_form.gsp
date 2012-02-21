<%@ page import="com.parago.pmo.QualityTarget" %>



<div class="fieldcontain ${hasErrors(bean: qualityTargetInstance, field: 'qualityMeasurementProcess', 'error')} ">
	<label for="qualityMeasurementProcess">
		<g:message code="qualityTarget.qualityMeasurementProcess.label" default="Quality Measurement Process" />
		
	</label>
	<g:textField name="qualityMeasurementProcess" value="${qualityTargetInstance?.qualityMeasurementProcess}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: qualityTargetInstance, field: 'qualityTarget', 'error')} ">
	<label for="qualityTarget">
		<g:message code="qualityTarget.qualityTarget.label" default="Quality Target" />
		
	</label>
	<g:textField name="qualityTarget" value="${qualityTargetInstance?.qualityTarget}"/>
</div>

