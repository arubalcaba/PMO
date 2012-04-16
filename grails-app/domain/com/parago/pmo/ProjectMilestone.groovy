package com.parago.pmo

class ProjectMilestone {
	
	String name;
	boolean complete;
	Date date;
	String note

	static belongsTo = [projectInfo:ProjectInfo];	

    static constraints = {
		name(blank: false)
		complete(nullable:true,blank: false)
		date(blank: false)
		note(nullable: true,blank: false)		
    }
}
