package com.parago.pmo

class ProjectInfo {

    ProjectType projectType;
	ProjectCode projectCode;
	Person deliveryManager;
	Person scrumMaster;
	Status status;
	Date closeDate;
	Status auditStatus;
	double rating;
	String link;
	static hasOne = [financial:Financial,schedule:Schedule];
	static hasMany =[risks:Risk,impediments:Impediment,changeOrders:ChangeOrder];
	
	static constraints = {
    }
}
