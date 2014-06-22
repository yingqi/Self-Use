package com.scs.javaweb;

public class Student {
	private int userid;
	private String username;
	private String password;
	private int advisor;
	private double consumption;
	
	public void setStudentId(int userid){
		this.userid = userid;
	}
	
	public void setStudentname(String username){
		this.username = username;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public void setAdvisor(int advisor){
		this.advisor = advisor;
	}
	
	public void setConsumption(double consumption){
		this.consumption = consumption;
	}
	
	public int getStudentId(){
		return userid;
	}
	
	public String getStudentname(){
		return username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public int getAdvisor(){
		return advisor;
	}
	
	public double getConsumption(){
		return consumption;
	}
	
	
	
}
