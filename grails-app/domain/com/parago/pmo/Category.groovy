package com.parago.pmo

class Category {

	
	String category;
	
	
	
	
	static constraints = {
		category(blank:false)
	}
	
	
	@Override
	public String toString() {
		"$category"
	}

}
