package com.scs.javaweb;

public class Advisor {
	private int userid;
	private String username;
	private String password;
	private String position;
	
	public void setAdvisorId(int userid){
		this.userid = userid;
	}
	
	public void setAdvisorname(String username){
		this.username = username;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public void setPosition(String position){
		this.position = position;
	}
	
	public int getAdvisorId(){
		return userid;
	}
	
	public String getAdvisorname(){
		return username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public String getPosition(){
		return position;
	}
	
	
	
}
