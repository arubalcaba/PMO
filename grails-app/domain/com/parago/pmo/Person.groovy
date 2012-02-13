package com.parago.pmo

class Person {
	
	String firstName;
	String lastName;
	String email;
	

    static constraints = {
		
		firstName(blank:false, maxSize:200)
		lastName(blank:false, maxSize:200)
		email(blank:false, maxSize:500, email:true)
    }
	
	@Override
	public String toString() {
		"$firstName $lastName"
	}
}
