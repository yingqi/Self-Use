package com.scs.javaweb;


public class Consumption {
	private int id;
	private String date;
	private double money;
	private int student;
	
	public void setId(int id){
		this.id = id;
	}
	
	public void setDate(String date){
		this.date = date;
	}
	
	public void setMoney(double money){
		this.money = money;
	}
	
	public void setStudent(int student){
		this.student = student;
	}
	
	public int getId(){
		return id;
	}
	
	public String getDate(){
		return date;
	}
	
	public double getMoney(){
		return money;
	}
	
	public int getStudent(){
		return student;
	}
	
}
