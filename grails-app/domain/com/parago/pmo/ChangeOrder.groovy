package com.parago.pmo

class ChangeOrder {
	
	String changeOrderName;
	String link;
	double costImpact;
	String scheduleImpact;
	static belongsTo = [projectInfo:ProjectInfo];

    static constraints = {
		changeOrderName(blank:false, maxSize:120)
		link(blank:false, maxSize:2000)
		
    }
}
