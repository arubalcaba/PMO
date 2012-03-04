package com.parago.pmo

class QualityTarget {
	
	String qualityTarget;
	String qualityMeasurementProcess;
	static belongsTo = [projectInfo:ProjectInfo];

    static constraints = {
    }
}
