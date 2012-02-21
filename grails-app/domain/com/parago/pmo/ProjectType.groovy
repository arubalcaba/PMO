package com.parago.pmo

class ProjectType {
	
	String type;

	
	static constraints = {
		type(blank:false)
	}
	
	
	@Override
	public String toString() {
		"$type"
	}
}
