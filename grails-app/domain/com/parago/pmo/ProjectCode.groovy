package com.parago.pmo

class ProjectCode {

	String code;
	String name;
	
	static constraints = {
		code(blank:false)
		name(blank:false)
	}
	
	
	@Override
	public String toString() {
		"$code:$name"
	}
}
