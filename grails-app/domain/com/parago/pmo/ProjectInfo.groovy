package com.parago.pmo

class ProjectInfo {

    String projectName;
	String projectType;
	String projectCode;
	Person deliveryManager;
	String scrumMaster;
	ProjectStatus status;
	AuditStatus auditStatus;
	String link;
	double budgetWithContractors;
	double actualCost;
	double estimateToComplete;
	double loeHours;
	double anticipatedClientGP;
	double numberOfQualityMeasures;
	double numberOfQualityMeasuresNotMet;
	String budgetComments;
	String scheduleComments;
	String qualityComments;
	String execSummary;
	String billable_flag;
	double total_expense_cost;	
	double total_cap_hours;
	double total_expense_hours;
	double total_cap_cost;
    String priority;
		
	Date startDate;
	Date closeDate;
	Date actualReleaseDate;
	Date plannedReleaseDate;
    Date clientRequestedDate;
	Date supportDocDelivered;
	Date thirtyDayReview;
	Date sixtyDayReview;
	Date handOffComplete;
    TurnoverStatus turnoverStatus;
	String category;
	String auditTurnoverComments;
	static hasMany =[risks:Risk,impediments:Impediment,changeOrders:ChangeOrder,qualityTargets:QualityTarget,invoices:ProjectInvoice,projectMilestones: ProjectMilestone];
	
	static constraints = {
		projectName(blank: false)
		projectType(blank: false)
		projectCode(blank: false)
		deliveryManager(nullable: true,blank: false)
		scrumMaster(nullable: true)
		status(nullable: true,blank: false)
		auditStatus(nullable: true,blank: false)
		link(nullable: true,maxSize:2000)
		budgetWithContractors(nullable: true)
		actualCost(nullable:true)
		estimateToComplete(nullable: true)
		loeHours(nullable: true)
		anticipatedClientGP(nullable: true)
		numberOfQualityMeasures(nullable: true)
		numberOfQualityMeasuresNotMet(nullable: true)
		startDate(nullable: true)
		closeDate(nullable: true)
		actualReleaseDate(nullable: true)
		plannedReleaseDate(nullable: true)
        clientRequestedDate(nullable: true)
		category(nullable: true)
		supportDocDelivered(nullable: true)
		thirtyDayReview(nullable: true)
		sixtyDayReview(nullable: true)
		handOffComplete(nullable: true)
		turnoverStatus(nullable: true,blank: false)
		auditTurnoverComments(nullable: true)
		total_expense_cost(nullable: true)
		total_cap_hours(nullable: true)
		total_expense_hours(nullable: true)
		total_cap_cost(nullable: true)
		budgetComments(nullable: true)
		scheduleComments(nullable: true)
		qualityComments(nullable: true)
		billable_flag(nullable: true)
        priority(nullable: true)


		execSummary(nullable: true,size: 0..10000 )		
		risks(nullable: true)
		impediments(nullable: true)
		changeOrders(nullable: true)
		invoices(nullable: true)
		projectMilestones(nullable: true)
		
    }
}
