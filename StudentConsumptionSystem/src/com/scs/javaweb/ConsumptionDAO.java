package com.scs.javaweb;

import java.util.List;

public interface ConsumptionDAO {
	public void insert(Consumption consumption) throws Exception ;
	public void update(Consumption consumption) throws Exception ;
	public void delete(Consumption consumption) throws Exception ;
	public List<Consumption> query(String start,String end, int student)  throws Exception ;
	public Consumption queryById(int id)  throws Exception ;
	public List<Consumption> queryAll() throws Exception ;
	public List<Consumption> queryByStudent(int student) throws Exception ;
}
