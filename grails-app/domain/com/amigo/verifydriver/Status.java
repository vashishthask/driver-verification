package com.amigo.verifydriver;

public enum Status {
	DETAILS_CAPTURED("Unverified"),
	VERIFIED("Verified"),
	REJECTED("Rejected"),
	DETAILS_REPORTED("Reported");
	
	private String state;

	Status(String state){
		this.state = state;
	}
	
	public String getState(){
		return state;
	}
	
}
