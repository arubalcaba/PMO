<%@ page import="com.parago.pmo.Schedule" %>



<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="schedule.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${scheduleInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'plannedReleaseDate', 'error')} required">
	<label for="plannedReleaseDate">
		<g:message code="schedule.plannedReleaseDate.label" default="Planned Release Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="plannedReleaseDate" precision="day"  value="${scheduleInstance?.plannedReleaseDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'actualReleaseDate', 'error')} ">
	<label for="actualReleaseDate">
		<g:message code="schedule.actualReleaseDate.label" default="Actual Release Date" />
		
	</label>
	<g:datePicker name="actualReleaseDate" precision="day"  value="${scheduleInstance?.actualReleaseDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'projectDays', 'error')} required">
	<label for="projectDays">
		<g:message code="schedule.projectDays.label" default="Project Days" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="projectDays" required="" value="${fieldValue(bean: scheduleInstance, field: 'projectDays')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'daysLate', 'error')} required">
	<label for="daysLate">
		<g:message code="schedule.daysLate.label" default="Days Late" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="daysLate" required="" value="${fieldValue(bean: scheduleInstance, field: 'daysLate')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'scheduleOverunPercent', 'error')} required">
	<label for="scheduleOverunPercent">
		<g:message code="schedule.scheduleOverunPercent.label" default="Schedule Overun Percent" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="scheduleOverunPercent" required="" value="${fieldValue(bean: scheduleInstance, field: 'scheduleOverunPercent')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'overallSchedueRating', 'error')} ">
	<label for="overallSchedueRating">
		<g:message code="schedule.overallSchedueRating.label" default="Overall Schedue Rating" />
		
	</label>
	<g:textField name="overallSchedueRating" value="${scheduleInstance?.overallSchedueRating}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'schedueRating', 'error')} required">
	<label for="schedueRating">
		<g:message code="schedule.schedueRating.label" default="Schedue Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="schedueRating" required="" value="${fieldValue(bean: scheduleInstance, field: 'schedueRating')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'projectInfo', 'error')} required">
	<label for="projectInfo">
		<g:message code="schedule.projectInfo.label" default="Project Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectInfo" name="projectInfo.id" from="${com.parago.pmo.ProjectInfo.list()}" optionKey="id" required="" value="${scheduleInstance?.projectInfo?.id}" class="many-to-one"/>
</div>

