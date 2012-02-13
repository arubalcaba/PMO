package com.parago.pmo

class Impediment {
	
	String impediment;
	String remediationPlan;
	static belongsTo = [projectInfo:ProjectInfo];
	
		static constraints = {
			impediment(blank:false, maxSize:120)
			remediationPlan(blank:false, maxSize:120)
			
		}
}
