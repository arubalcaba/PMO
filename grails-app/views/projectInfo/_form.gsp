<%@ page import="com.parago.pmo.ProjectInfo" %>
		<g:set var="dateFormat" value="MM/dd/yyyy"/>
		
		 <fieldset>
		 <legend>Project Information</legend>
		<g:if test="${projectInfoInstance?.projectName}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'projectName', 'error')} required">
			<label class="control-label" class="control-label" for="projectName">
				<g:message code="projectInfo.projectName.label" default="Project Name" />
				
			</label>
			<div class="controls">
				<g:textField name="projectName" value="${projectInfoInstance?.projectName}" readOnly="true" style="width:50%"/>
			</div>
		</div>
		</g:if>
	
		<g:if test="${projectInfoInstance?.projectCode}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'projectCode', 'error')} required">
			<label class="control-label" class="control-label" for="projectCode">
				<g:message code="projectInfo.projectCode.label" default="Project Code" />
			</label>
			<div class="controls">
				<g:textField name="projectCode" value="${projectInfoInstance?.projectCode}" readOnly="true" style="width:50%"/>
			</div>
		</div>
		</g:if>
        <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'priority', 'error')} ">
                 <label class="control-label" for="priority">
                     <g:message code="projectInfo.link.label" default="Priority" />
                 </label>
                 <div class="controls">
                     <g:field type="text" name="priority" value="${projectInfoInstance?.priority}"/>
                 </div>
             </div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'link', 'error')} ">
			<label class="control-label" for="link">
				<g:message code="projectInfo.link.label" default="Project Link" />
			</label>
			<div class="controls">
			<g:textField name="link" value="${projectInfoInstance?.link}" style="width:50%"/>
			</div>
		</div>
		
		<g:if test="${projectInfoInstance?.projectType}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'projectType', 'error')} required">
			<label class="control-label" class="control-label" for="projectType">
				<g:message code="projectInfo.projectCode.label" default="Project Type" />
			</label>
			<div class="controls">
				<g:textField name="projectType" value="${projectInfoInstance?.projectType}" readOnly="true"/>
			</div>
		</div>
		</g:if>
	
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'deliveryManager', 'error')} required">
			<label class="control-label" class="control-label" for="deliveryManager">
				<g:message code="projectInfo.deliveryManager.label" default="Delivery Manager" />
			</label>
			<div class="controls">
			<g:select id="deliveryManager" name="deliveryManager.id" from="${com.parago.pmo.Person.list().sort{it?.firstName}}" optionKey="id" required="" value="${projectInfoInstance?.deliveryManager?.id}" class="many-to-one" noSelection="['': '']"/>
			</div>
		</div>
		
		<g:if test="${projectInfoInstance?.scrumMaster}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'scrumMaster', 'error')} required">
			<label class="control-label" class="control-label" for="scrumMaster">
				<g:message code="projectInfo.scrumMaster.label" default="Scrum Master" />
			</label>
			<div class="controls">
				<g:textField name="scrumMaster" value="${projectInfoInstance?.scrumMaster}" readOnly="true"/>
			</div>
		</div>
		</g:if>
				
	
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'status', 'error')} ">
			<label class="control-label" class="control-label" for="status">
				<g:message code="projectInfo.status.label" default="Project Status" />
			</label>
			<div class="controls">
			<g:select id="status" name="status.id" from="${com.parago.pmo.ProjectStatus.list().sort{it?.status}}" optionKey="id" value="${projectInfoInstance?.status?.id}" class="many-to-one" noSelection="['': '']"/>
			</div>
		</div>
		</fieldset>
	 <fieldset>
		 <legend>Schedule Information</legend>
			 	<g:if test="${projectInfoInstance?.startDate}">
					 <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'startDate', 'error')} ">
					<label class="control-label" for="startDate">
						<g:message code="projectInfo.startDate.label" default="Project Start Date" />
					</label>
					<div class="controls">
						<g:field type="date" name="viewstartDate"  value="${projectInfoInstance?.startDate.format(dateFormat)}" readOnly="true"/>
					    <g:hiddenField name="startDate" id="startDate" value="${projectInfoInstance?.startDate}" />				
					</div>
				</div>
			  </g:if>
			  <g:else>
			    <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'startDate', 'error')} ">
					<label class="control-label" for="startDate">
						<g:message code="projectInfo.startDate.label" default="Project Start Date" />
					</label>
					<div class="controls">
						<g:field type="date" name="viewstartDate"  value="N/A" readOnly="true"/>
					</div>
				</div>		  	  
			  </g:else>
         <g:if test="${projectInfoInstance?.closeDate}">
             <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'closeDate', 'error')} ">
                 <label class="control-label" for="closeDate">
                     <g:message code="projectInfo.closeDate.label" default="Project Close Date" />
                 </label>
                 <div class="controls">
                     <g:field type="date" name="viewclostDate"  value="${projectInfoInstance?.closeDate.format(dateFormat)}" readOnly="true"/>
                     <g:hiddenField name="closeDate" id="closeDate" value="${projectInfoInstance?.closeDate}" />
                 </div>
             </div>
         </g:if>
         <g:else>
             <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'closeDate', 'error')} ">
                 <label class="control-label" for="closeDate">
                     <g:message code="projectInfo.startDate.label" default="Project Close Date" />
                 </label>
                 <div class="controls">
                     <g:field type="date" name="viewclostDate"  value="N/A" readOnly="true"/>
                 </div>
             </div>
         </g:else>





			  <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'plannedReleaseDate', 'error')} ">
				<label class="control-label" for="plannedReleaseDate">
					<g:message code="projectInfo.plannedReleaseDate.label" default="Planned Release Date" />
				</label>
				<div class="controls">
				<g:textField name="plannedReleaseDate" value="${formatDate(format:'MM/dd/yyyy',date:projectInfoInstance?.plannedReleaseDate)}" id="plannedReleaseDate"/>
				</div>
			</div>
         <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'clientRequestedDate', 'error')} ">
             <label class="control-label" for="clientRequestedDate">
                 <g:message code="projectInfo.clientRequestedDate.label" default="Client Requested Date" />
             </label>
             <div class="controls">
                 <g:textField name="clientRequestedDate" value="${formatDate(format:'MM/dd/yyyy',date:projectInfoInstance?.clientRequestedDate)}" id="clientRequestedDate"/>
             </div>
         </div>


			<g:if test="${projectInfoInstance?.actualReleaseDate}">
			<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'actualReleaseDate', 'error')} ">
				<label class="control-label" for="actualReleaseDate">
					<g:message code="projectInfo.actualReleaseDate.label" default="Actual Release Date" />					
				</label>
				<div class="controls">
				<g:field type="date" name="viewActualReleaseDate"  value="${projectInfoInstance?.actualReleaseDate.format(dateFormat)}" readOnly="true"/>
			     <g:hiddenField name="actualReleaseDate" id="actualReleaseDate" value="${projectInfoInstance?.actualReleaseDate}" />		
				</div>
			</div>
		</g:if>
		<g:else>
			    <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'actualReleaseDate', 'error')} ">
				<label class="control-label" for="actualReleaseDate">
					<g:message code="projectInfo.actualReleaseDate.label" default="Actual Release Date" />					
				</label>
				<div class="controls">
				<g:field type="date" name="viewActualReleaseDate"  value="N/A" readOnly="true"/>		
				</div>
			</div>			  
		</g:else>
		
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'scheduleComments', 'error')} ">
			<label class="control-label" for="scheduleComments">
				<g:message code="projectInfo.scheduleComments.label" default="Schedule Comments" />
			</label>
			<div class="controls">
			<g:textArea name="scheduleComments" value="${projectInfoInstance?.scheduleComments}"/>
			</div>
		</div>		
	</fieldset>
   <fieldset>
		 <legend>Budget Information</legend>
		 
		 <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'budgetWithContractors', 'error')} required">
			<label class="control-label" for="budgetWithContractors" style="width:12%">
				<g:message code="projectInfo.budgetWithContractors.label" default="Budget(\$) "/>
			</label>
			<div class="controls">
			<g:field type="text" min="0" step="any" name="budgetWithContractors" required="" value="${fieldValue(bean: projectInfoInstance, field: 'budgetWithContractors')}"/>
			</div>
		 </div>
       <g:if test="${projectInfoInstance?.actualCost}">
           <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'actualCost', 'error')} required">
               <label class="control-label" for="actualCost" style="width:12%">
                   <g:message code="projectInfo.actualCost.label" default="Actual Cost (\$)" />
               </label>
               <div class="controls">
                   <g:textField name="actualCost" value="${projectInfoInstance?.actualCost}" readOnly="true"/>
               </div>
           </div>
       </g:if>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'estimateToComplete', 'error')} required">
			<label class="control-label" for="estimateToComplete" style="width:12%">
				<g:message code="projectInfo.estimateToComplete.label" default="Estimate To Complete (\$) "  />
			</label>
			<div class="controls">
			<g:field type="text" min="0" step="any" name="estimateToComplete" required="" value="${fieldValue(bean: projectInfoInstance, field: 'estimateToComplete')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'loeHours', 'error')} required">
			<label class="control-label" for="loeHours">
				<g:message code="projectInfo.loeHours.label" default="Loe Hours" />
			</label>
			<div class="controls">
			<g:field type="text" min="0" step="any" name="loeHours" required="" value="${fieldValue(bean: projectInfoInstance, field: 'loeHours')}"/>
			</div>
		</div>
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'budgetComments', 'error')} ">
			<label class="control-label" for="budgetComments">
				<g:message code="projectInfo.budgetComments.label" default="Budget Comments" />
			</label>
			<div class="controls">
			<g:textArea name="budgetComments" value="${projectInfoInstance?.budgetComments}"/>
			</div>
		</div>	
		<fieldset>
		 <legend>Quality Information</legend>
		 <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'numberOfQualityMeasures', 'error')} required">
			<label class="control-label" for="numberOfQualityMeasures">
				<g:message code="projectInfo.numberOfQualityMeasures.label" default="Number Of Quality Measures" />
			</label>
			<div class="controls">
			<g:field type="text" min="0" step="any" name="numberOfQualityMeasures" required="" value="${fieldValue(bean: projectInfoInstance, field: 'numberOfQualityMeasures')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'numberOfQualityMeasuresNotMet', 'error')} required">
			<label class="control-label" for="numberOfQualityMeasuresNotMet">
				<g:message code="projectInfo.numberOfQualityMeasuresNotMet.label" default="Number Of Quality Measures Not Met" />
			</label>
			<div class="controls">
			<g:field type="text" min="0" step="any" name="numberOfQualityMeasuresNotMet" required="" value="${fieldValue(bean: projectInfoInstance, field: 'numberOfQualityMeasuresNotMet')}"/>
			</div>
		</div>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'qualityComments', 'error')} ">
			<label class="control-label" for="qualityComments">
				<g:message code="projectInfo.qualityComments.label" default="Quality Comments" />
			</label>
			<div class="controls">
			<g:textArea name="qualityComments" value="${projectInfoInstance?.qualityComments}"/>
			</div>
		</div>
		
		
	</fieldset>
	<fieldset>
		 <legend>Management Information</legend>
		 <g:if test="${projectInfoInstance?.category}">
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'category', 'error')} ">
			<label class="control-label" for="category">
				<g:message code="projectInfo.category.label" default="Category" />
				
			</label>
			<div class="controls">
			<g:textField name="category" value="${projectInfoInstance?.category}" readOnly="true"/>
			</div>
		</div>
		</g:if>

		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'anticipatedClientGP', 'error')} required">
			<label class="control-label" for="anticipatedClientGP" style="width:12%">
				<g:message code="projectInfo.anticipatedClientGP.label" default="Anticipated Client GP (\$) " />
			</label>
			<div class="controls">
			<g:field type="text" min="0" step="any" name="anticipatedClientGP" required="" value="${fieldValue(bean: projectInfoInstance, field: 'anticipatedClientGP')}"/>
			</div>
		</div>
		
	</fieldset>
	<fieldset>
		 <legend>Support Turnover & Audit Closedown Information</legend>
		 <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'supportDocDelivered', 'error')} ">
			<label class="control-label" for="supportDocDelivered">
				<g:message code="projectInfo.supportDocDelivered.label" default="Support Doc Delivered Date" />
			</label>
			<div class="controls">
			<g:textField name="supportDocDelivered" value="${formatDate(format:'MM/dd/yyyy',date:projectInfoInstance?.supportDocDelivered)}" id="supportDocDelivered"/>
			</div>
		</div>
		
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'thirtyDayReview', 'error')} ">
			<label class="control-label" for="thirtyDayReview">
				<g:message code="projectInfo.thirtyDayReview.label" default="30 day Review Date" />
			</label>
			<div class="controls">
			<g:textField name="thirtyDayReview" value="${formatDate(format:'MM/dd/yyyy',date:projectInfoInstance?.thirtyDayReview)}" id="thirtyDayReview"/>
			</div>
		</div>
		
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'sixtyDayReview', 'error')} ">
			<label class="control-label" for="sixtyDayReview">
				<g:message code="projectInfo.sixtyDayReview.label" default="60 day Review Date" />
			</label>
			<div class="controls">
			<g:textField type="date" name="sixtyDayReview" value="${formatDate(format:'MM/dd/yyyy',date:projectInfoInstance?.sixtyDayReview)}" id="sixtyDayReview"/>
			</div>
		</div>
		
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'handOffComplete', 'error')} ">
			<label class="control-label" for="handOffComplete">
				<g:message code="projectInfo.handOffComplete.label" default="Hand Off Complete Date" />
			</label>
			<div class="controls">
			<g:textField name="handOffComplete" value="${formatDate(format:'MM/dd/yyyy',date:projectInfoInstance?.handOffComplete)}" id="handOffComplete"/>
			</div>
		</div>
		
	  <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'turnoverStatus', 'error')} ">
			<label class="control-label" for="turnoverStatus">
				<g:message code="projectInfo.turnoverStatus.label" default="Turnover Status" />
			</label>
			<div class="controls">
			<g:select id="turnoverStatus" name="turnoverStatus.id" from="${com.parago.pmo.TurnoverStatus.list().sort{it?.status}}" optionKey="id" value="${projectInfoInstance?.turnoverStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
			</div>
		</div>
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'auditStatus', 'error')} ">
			<label class="control-label" for="auditStatus">
				<g:message code="projectInfo.auditStatus.label" default="Audit Status" />
			</label>
			<div class="controls">
			<g:select id="auditStatus" name="auditStatus.id" from="${com.parago.pmo.AuditStatus.list().sort{it?.status}}" optionKey="id" value="${projectInfoInstance?.auditStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
			</div>
		</div>
		<div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'auditTurnoverComments', 'error')} ">
			<label class="control-label" for="auditTurnoverComments">
				<g:message code="projectInfo.auditTurnoverComments.label" default="Audit Turnover Comments" />
			</label>
			<div class="controls">
			<g:textArea name="auditTurnoverComments" value="${projectInfoInstance?.auditTurnoverComments}"/>
			</div>
		</div>


		</fieldset>
<fieldset>
         <legend>Executive Information</legend>
    <div class="control-group ${hasErrors(bean: projectInfoInstance, field: 'execSummary', 'error')} ">
        <label class="control-label" for="execSummary">
            <g:message code="projectInfo.execSummary.label" default="Exective Summary" />
        </label>
        <div class="controls">
            <g:textArea id="execSummary" name="execSummary" class="ckeditor" value="${projectInfoInstance?.execSummary}"/>
        </div>
    </div>
</fieldset>

