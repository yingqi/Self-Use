package com.javaweb;

import java.sql.*;


public class DataBaseConnection {
	private final String DBDRIVER = "com.mysql.jdbc.Driver";
	private final String DBURL = "jdbc:mysql://localhost:3306/javaweb";
	private final String DBUSER = "root";
	private final String DBPASSWORD = "123456";
	private Connection conn = null;
	
	public DataBaseConnection(){
		try {
			Class.forName(DBDRIVER);
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		}catch (Exception e) {
			System.out.println("Fail to load the driver!");
		}
	}
	
	public Connection getConnection(){
		return conn;
	}
	
	public void close(){
		try{
			conn.close();
		}catch (Exception e) {
			System.out.println("Fail to connect to the driver");
		}
	}
}
