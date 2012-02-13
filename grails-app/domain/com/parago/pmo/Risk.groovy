package com.parago.pmo

class Risk {
	
	String risk;
	String riskMigrationStragety;
	static belongsTo = [projectInfo:ProjectInfo];

    static constraints = {
    }
}
