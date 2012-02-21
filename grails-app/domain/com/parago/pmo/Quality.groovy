package com.parago.pmo

class Quality {

	double numberOfQualityMeasures;
	double numberOfQualityMeasuresNotMet;
	double qualityRating;
	String overallQualityRating;	
	ProjectInfo projectInfo;
	
	static belongsTo = [projectInfo:ProjectInfo]

    static constraints = {
		numberOfQualityMeasures(blank: false)
		numberOfQualityMeasuresNotMet(nullable: true,blank:true)
		overallQualityRating(nullable: true,blank:true)
		qualityRating(nullable: true,blank:true)		
    }
}
