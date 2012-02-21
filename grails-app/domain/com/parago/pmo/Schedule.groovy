package com.parago.pmo

class Schedule {
	
	Date startDate;
	Date plannedReleaseDate;
	Date actualReleaseDate;
	int projectDays;
	int daysLate;
	double scheduleOverunPercent;
	double schedueRating;
	String overallSchedueRating;
	ProjectInfo projectInfo;
	static belongsTo = [projectInfo:ProjectInfo]

    static constraints = {
		startDate(blank: false)
		plannedReleaseDate(blank: false)
		actualReleaseDate(nullable: true)
		projectDays(nullable: true)
		daysLate(nullable: true)
		scheduleOverunPercent(nullable: true)
		overallSchedueRating(nullable: true)
		schedueRating(nullable: true)
		
		
    }
}
