package com.scs.javaweb;

import java.util.*;
import java.sql.*;


public class StudentDAOImpl implements StudentDAO {
	
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
	public void insert(Student student) throws Exception {
		DBUpdate("insert into student(studentname, password,advisor) values("+"\""+student.getStudentname()+"\""+","+"\""+student.getPassword()+"\""+","+"\""+student.getAdvisor()+"\""+")");
	}

	@Override
	public void update(Student student) throws Exception {
		DBUpdate("update student set studentname="+"\""+student.getStudentname()+"\""+" , password="+"\""+student.getPassword()+"\""+" , advisor="+"\""+student.getAdvisor()+"\""+" , consumption="+"\""+student.getConsumption()+"\""+" where studentid="+student.getStudentId());
	}

	@Override
	public void delete(Student student) throws Exception {
		DBUpdate("delete from student where studentid="+student.getStudentId());
	}

	@Override
	public Student queryById(int studentId) throws Exception {
		Student student = null;
		String sql="select * from student where studentid=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, studentId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				student = new Student();
				student.setStudentId(rs.getInt(1));
				student.setStudentname(rs.getString(2));
				student.setPassword(rs.getString(3));
				student.setAdvisor(rs.getInt(4));
				student.setConsumption(rs.getDouble(5));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return student;
	}

	@Override
	public List<Student> queryAll() throws Exception {
		List<Student> allStudents = new ArrayList<Student>();
		String sql="select * from student";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Student student = new Student();
				student.setStudentId(rs.getInt(1));
				student.setStudentname(rs.getString(2));
				student.setPassword(rs.getString(3));
				student.setAdvisor(rs.getInt(4));
				student.setConsumption(rs.getDouble(5));
				allStudents.add(student);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return allStudents;
	}


	@Override
	public Student query(String name, String password) throws Exception {
		Student student = null;
		String sql="select * from student where studentname=? and password=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				student = new Student();
				student.setStudentId(rs.getInt(1));
				student.setStudentname(rs.getString(2));
				student.setPassword(rs.getString(3));
				student.setAdvisor(rs.getInt(4));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return student;
	}


	@Override
	public List<Student> queryByAdvisor(int advisor) throws Exception {
		List<Student> allStudents = new ArrayList<Student>();
		String sql="select * from student where advisor = ?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try {
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, advisor);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Student student = new Student();
				student.setStudentId(rs.getInt(1));
				student.setStudentname(rs.getString(2));
				student.setPassword(rs.getString(3));
				student.setAdvisor(rs.getInt(4));
				student.setConsumption(rs.getDouble(5));
				allStudents.add(student);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception operating on DB!");
		}
		finally{
			dbc.close();
		}
		return allStudents;
	}

}
