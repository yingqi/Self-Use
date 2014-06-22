package com.scs.javaweb;

import java.util.*;
import java.sql.*;


public class AdvisorDAOImpl implements AdvisorDAO {
	
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
	

	@Override
	public void insert(Advisor advisor) throws Exception {
		DBUpdate("insert into advisor(advisorname, password,position) values("+"\""+advisor.getAdvisorname()+"\""+","+"\""+advisor.getPassword()+"\""+","+"\""+advisor.getPosition()+"\""+")");
	}

	@Override
	public void update(Advisor advisor) throws Exception {
		DBUpdate("update advisor set advisorname="+"\""+advisor.getAdvisorname()+"\""+" , password="+"\""+advisor.getPassword()+"\""+" , position="+"\""+advisor.getPosition()+"\""+" where advisorid="+advisor.getAdvisorId());
	}

	@Override
	public void delete(Advisor advisor) throws Exception {
		DBUpdate("delete from advisor where advisorid="+advisor.getAdvisorId());
	}

	@Override
	public Advisor queryById(int advisorId) throws Exception {
		Advisor advisor = null;
		String sql="select * from advisor where advisorid=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, advisorId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				advisor = new Advisor();
				advisor.setAdvisorId(rs.getInt(1));
				advisor.setAdvisorname(rs.getString(2));
				advisor.setPassword(rs.getString(3));
				advisor.setPosition(rs.getString(4));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return advisor;
	}

	@Override
	public List<Advisor> queryAll() throws Exception {
		List<Advisor> allAdvisors = new ArrayList<Advisor>();
		String sql="select * from advisor";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Advisor advisor = new Advisor();
				advisor.setAdvisorId(rs.getInt(1));
				advisor.setAdvisorname(rs.getString(2));
				advisor.setPassword(rs.getString(3));
				advisor.setPosition(rs.getString(4));
				allAdvisors.add(advisor);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return allAdvisors;
	}


	@Override
	public Advisor query(String name, String password) throws Exception {
		Advisor advisor = null;
		String sql="select * from advisor where advisorname=? and password=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				advisor = new Advisor();
				advisor.setAdvisorId(rs.getInt(1));
				advisor.setAdvisorname(rs.getString(2));
				advisor.setPassword(rs.getString(3));
				advisor.setPosition(rs.getString(4));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return advisor;
	}

}
