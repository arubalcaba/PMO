package com.parago.pmo

class ProjectMilestone {
	
	Milestone milestone;
	boolean complete;
	Date date;
	String note;

	static belongsTo = [projectInfo:ProjectInfo];	

    static constraints = {
		milestone(blank: false)
		complete(nullable:true,blank: false)
		date(blank: false)
		note(nullable: true,blank: true)		
    }
}
