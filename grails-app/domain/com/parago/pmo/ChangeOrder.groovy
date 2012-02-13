package com.parago.pmo

class ChangeOrder {
	
	String changeOrderName;
	String link;
	static belongsTo = [projectInfo:ProjectInfo];

    static constraints = {
		changeOrderName(blank:false, maxSize:120)
		link(blank:false, maxSize:2000,url:true)
		
    }
}
