package com.parago.pmo

class TurnoverStatus {

    	String status;
	
		static constraints = {
			status(blank:false)
		}
		
		
		@Override
		public String toString() {
			"$status"
		}

}
