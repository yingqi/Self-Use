package com.scs.javaweb;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ConsumptionDAOImpl implements ConsumptionDAO {
	
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
	
	private String getDate(){
		int y,m,d;    
		Calendar cal=Calendar.getInstance();    
		y=cal.get(Calendar.YEAR);    
		m=cal.get(Calendar.MONTH);    
		d=cal.get(Calendar.DATE);
		return y+"-"+m+"-"+d;
	}

	@Override
	public void insert(Consumption consumption) throws Exception {
		DBUpdate("insert into consumption(money, dates,student) values("+"\""+consumption.getMoney()+"\""+","+"\""+getDate()+"\""+","+"\""+consumption.getStudent()+"\""+")");	
		DBUpdate("update student set consumption=  consumption +"+"\""+consumption.getMoney()+"\""+" where studentid="+consumption.getStudent());
	}

	@Override
	public void update(Consumption consumption) throws Exception {
		double oldmoney = this.queryById(consumption.getId()).getMoney();
		DBUpdate("update consumption set money="+"\""+consumption.getMoney()+"\""+" , dates="+"\""+consumption.getDate()+"\""+" , student="+"\""+consumption.getStudent()+"\""+" where id="+consumption.getId());
		DBUpdate("update student set consumption=  consumption +"+"\""+consumption.getMoney()+"\""+" - "+"\""+oldmoney+"\""+" where studentid="+consumption.getStudent());
	}

	@Override
	public void delete(Consumption consumption) throws Exception {
		DBUpdate("delete from consumption where id="+consumption.getId());
		DBUpdate("update student set consumption=  consumption -"+"\""+consumption.getMoney()+"\""+" where studentid="+consumption.getStudent());
	}


	@Override
	public List<Consumption> query(String start, String end, int student) throws Exception {
		ArrayList<Consumption> consumptions = new ArrayList<Consumption>();
		
		String sql="select * from consumption where dates>? and  dates<? and student=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			pstmt.setInt(3, student);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Consumption consumption = null;
				consumption = new Consumption();
				consumption.setId(rs.getInt(1));
				consumption.setMoney(rs.getDouble(2));
				consumption.setDate(rs.getString(3));
				consumption.setStudent(rs.getInt(4));
				consumptions.add(consumption);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return consumptions;
	}

	@Override
	public List<Consumption> queryAll() throws Exception {
		ArrayList<Consumption> consumptions = new ArrayList<Consumption>();
		String sql="select * from consumption";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Consumption consumption = new Consumption();
				consumption.setId(rs.getInt(1));
				consumption.setMoney(rs.getDouble(2));
				consumption.setDate(rs.getString(3));
				consumption.setStudent(rs.getInt(4));
				consumptions.add(consumption);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return consumptions;
	}

	@Override
	public List<Consumption> queryByStudent(int student) throws Exception {
		ArrayList<Consumption> consumptions = new ArrayList<Consumption>();
		String sql="select * from consumption where student = ?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, student);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Consumption consumption = new Consumption();
				consumption.setId(rs.getInt(1));
				consumption.setMoney(rs.getDouble(2));
				consumption.setDate(rs.getString(3));
				consumption.setStudent(rs.getInt(4));
				consumptions.add(consumption);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return consumptions;
	}

	@Override
	public Consumption queryById(int id) throws Exception {
		Consumption consumption = null;
		String sql="select * from consumption where id=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				consumption = new Consumption();
				consumption.setId(rs.getInt(1));
				consumption.setMoney(rs.getDouble(2));
				consumption.setDate(rs.getString(3));
				consumption.setStudent(rs.getInt(4));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return consumption;
	}


}
