package com.parago.pmo

class Budget {
	
	double budget;
	double actualCost;
	double estimateToComplete;
	double estimateAtCompletion;
	double variance;
	double percentOfBudgetUsed;
	double budgetVariance;	
	double loeHours;
	double actualHours;
	double budgetRating;
	String overallBudgetRating;
	static belongsTo = [projectInfo:ProjectInfo]
	
    static constraints = {
		budget(blank: false)
		actualCost(nullable: true,blank:true)
		estimateToComplete(blank: false)
		variance(nullable: true,blank:true)
		percentOfBudgetUsed(nullable: true,blank:true)
		estimateAtCompletion(nullable: true,blank:true)
		budgetVariance(nullable: true,blank:true)
		actualHours(blank: false)
		loeHours(blank: false)
		budgetRating(nullable: true,blank:true)
		overallBudgetRating(nullable: true,blank:true)
    }
}
