package com.parago.pmo

class AuditStatus {
	
	String status;
	
		static constraints = {
			status(blank:false)
		}
		
		
		@Override
		public String toString() {
			"$status"
		}

}
