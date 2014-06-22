package com.scs.javaweb;

import java.util.List;

public interface StudentDAO {
	public void insert(Student student) throws Exception ;
	public void update(Student student) throws Exception ;
	public void delete(Student student) throws Exception ;
	public Student queryById(int studentId)  throws Exception ;
	public Student query(String name, String password)  throws Exception ;
	public List<Student> queryAll() throws Exception ;
	public List<Student> queryByAdvisor(int advisor) throws Exception ;
}
