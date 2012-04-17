package com.parago.pmo

class Milestone {
	
	String milestone;

    static constraints = {
		milestone(blank:false)
    }
	
	@Override
	public String toString() {
		"$milestone"
	}
}
