package com.parago.pmo

class ManagmentInfo {
	
	Category category;
	double capCost;
	double expenseCost;
	double billableAmount;
	double marginCost;
	double marginPercent;
	double anticipatedClientGP;
	InvoiceStatus invoiceStatus;
	String invoiceNote;
	ProjectInfo projectInfo;

    static constraints = {
		category(blank: false)
		capCost(nullable: true,blank:true)
		expenseCost(nullable: true,blank:true)
		billableAmount(nullable: true,blank:true)
		marginCost(nullable: true,blank:true)
		marginPercent(nullable: true,blank:true)
		anticipatedClientGP(nullable: true,blank:true)
		invoiceNote(nullable: true,blank:true)
    }
}
