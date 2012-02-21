package com.parago.pmo

class ProjectInfo {

    String projectName;
	ProjectType projectType;
	ProjectCode projectCode;
	Person deliveryManager;
	Person scrumMaster;
	ProjectStatus status;
	Date closeDate;
	AuditStatus auditStatus;
	double overallRating;
	String ratingValue;
	String link;
	static hasOne = [budget:Budget,schedule:Schedule,managmentInfo:ManagmentInfo];
	static hasMany =[risks:Risk,impediments:Impediment,changeOrders:ChangeOrder];
	
	static constraints = {
		projectName(blank: false)
		projectType(blank: false)
		projectCode(blank: false)
		deliveryManager(blank: false)
		scrumMaster(blank: false)
		status(blank: false)
		auditStatus(blank: false)
		link(blank: false)
		overallRating(nullable: true)
		ratingValue(nullable: true)
		closeDate(nullable: true)
		budget(nullable: true)
		schedule(nullable: true)
		managmentInfo(nullable: true)
		risks(nullable: true)
		impediments(nullable: true)
		changeOrders(nullable: true)
    }
}
