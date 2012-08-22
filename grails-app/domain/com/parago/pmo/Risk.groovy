package com.parago.pmo

class Risk {
	
	String risk;
	String riskMitigationStrategy;
	static belongsTo = [projectInfo:ProjectInfo];

    static constraints = {
    }
			
		
}
