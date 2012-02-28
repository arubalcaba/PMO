package com.parago.pmo

class Risk {
	
	String risk;
	String riskMigrationStrategy;
	static belongsTo = [projectInfo:ProjectInfo];

    static constraints = {
    }
			
		
}
