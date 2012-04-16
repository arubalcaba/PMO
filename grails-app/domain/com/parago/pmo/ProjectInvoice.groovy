package com.parago.pmo

class ProjectInvoice {

	double billableAmount;
	InvoiceStatus invoiceStatus;
	String invoiceNote;
	static belongsTo = [projectInfo:ProjectInfo];


    static constraints = {
		billableAmount(blank:false)
		invoiceStatus(blank: false)
		invoiceNote(nullable:true,blank: true)
    }
}
