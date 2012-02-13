package com.parago.pmo

class ProjectStatus {
	
	String status;

    static constraints = {
		status(blank:false)
    }
	
	
	@Override
	public String toString() {
		"$status"
	}
}
