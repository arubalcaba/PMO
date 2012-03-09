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
	double billableAmount;
	double numberOfQualityMeasures;
	double numberOfQualityMeasuresNotMet;
	Date startDate;
	Date closeDate;
	Date actualReleaseDate;
	Date plannedReleaseDate;
	Date supportDocDelivered;
	Date thirtyDayReview;
	Date sixtyDayReview;
	Date handOffComplete;
    TurnoverStatus turnoverStatus;
	String category;
	InvoiceStatus invoiceStatus;
	String invoiceNote;
	static hasMany =[risks:Risk,impediments:Impediment,changeOrders:ChangeOrder,qualityTargets:QualityTarget];
	
	static constraints = {
		projectName(blank: false)
		projectType(blank: false)
		projectCode(blank: false)
		deliveryManager(nullable: true,blank: false)
		scrumMaster(nullable: true)
		status(nullable: true)
		auditStatus(nullable: true)
		link(nullable: true)
		budgetWithContractors(nullable: true)
		actualCost(nullable:true)
		estimateToComplete(nullable: true)
		loeHours(nullable: true)
		anticipatedClientGP(nullable: true)
		billableAmount(nullable: true)
		numberOfQualityMeasures(nullable: true)
		numberOfQualityMeasuresNotMet(nullable: true)
		startDate(nullable: true)
		closeDate(nullable: true)
		actualReleaseDate(nullable: true)
		plannedReleaseDate(nullable: true)		
		category(nullable: true)
		supportDocDelivered(nullable: true)
		thirtyDayReview(nullable: true)
		sixtyDayReview(nullable: true)
		handOffComplete(nullable: true)
		turnoverStatus(nullable: true)		
		invoiceStatus(nullable: true)
		invoiceNote(nullable: true)
		risks(nullable: true)
		impediments(nullable: true)
		changeOrders(nullable: true)
		
    }
}
