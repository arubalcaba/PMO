package com.parago.pmo

class InvoiceStatus {

   
	String status;
	
		static constraints = {
			status(blank:false)
		}
		
		
		@Override
		public String toString() {
			"$status"
		}
}
