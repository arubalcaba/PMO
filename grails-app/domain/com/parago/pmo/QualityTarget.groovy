package com.parago.pmo

class QualityTarget {
	
	String qualityTarget;
	String qualityMeasurementProcess;
    boolean qualityMet;
	static belongsTo = [projectInfo:ProjectInfo];

    static constraints = {
        qualityTarget(blank:false, maxSize:2000)
        qualityMeasurementProcess(blank:false, maxSize:2000)
    }
}
