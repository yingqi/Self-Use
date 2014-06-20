package com.javaweb;

public class User {
	private int userid;
	private String username;
	private String password;
	
	public void setUserId(int userid){
		this.userid = userid;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public int getUserId(){
		return userid;
	}
	
	public String getUsername(){
		return username;
	}
	
	public String getPassword(){
		return password;
	}
}
