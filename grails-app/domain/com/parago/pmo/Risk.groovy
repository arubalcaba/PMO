package com.parago.pmo

class Risk {
	
	String risk;
	String riskMitigationStrategy;
	static belongsTo = [projectInfo:ProjectInfo];

    static constraints = {
		risk(blank:false, maxSize:1000)
		riskMitigationStrategy(blank:false, maxSize:1000)
    }
			
		
}
