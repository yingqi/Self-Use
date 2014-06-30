package com.javaweb;

import java.util.*;
import java.sql.*;


public class UserDAOImpl implements UserDAO {
	
	private void DBUpdate(String sql) throws Exception{
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try{
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
	}
	


	public void insert(User user) throws Exception {
		DBUpdate("insert into user(username, password) values("+"\""+user.getUsername()+"\""+","+"\""+user.getPassword()+"\""+")");
	}

	public void update(User user) throws Exception {
		DBUpdate("update user set username="+"\""+user.getUsername()+"\""+" , password="+"\""+user.getPassword()+"\""+" where userid="+user.getUserId());
	}


	public void delete(User user) throws Exception {
		DBUpdate("delete from user where userid="+user.getUserId());
	}


	public User queryById(int userId) throws Exception {
		User user = null;
		String sql="select * from user where userid=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				user = new User();
				user.setUserId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return user;
	}


	public List queryAll() throws Exception {
		List<User> allUsers = new ArrayList<User>();
		String sql="select * from user";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				User user = new User();
				user.setUserId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				allUsers.add(user);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return allUsers;
	}

}
