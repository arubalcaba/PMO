package com.parago.pmo

class ProjectInfo {

    String projectName;
	ProjectType projectType;
	ProjectCode projectCode;
	Person deliveryManager;
	Person scrumMaster;
	ProjectStatus status;
	Date closeDate;
	ProjectStatus auditStatus;
	double rating;
	String link;
	List risks = new ArrayList();
	static hasOne = [financial:Financial,schedule:Schedule];
	static hasMany =[risks:Risk,impediments:Impediment,changeOrders:ChangeOrder];
	
	static constraints = {
    }
}
