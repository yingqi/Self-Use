package com.scs.javaweb;

import java.util.List;

public interface AdvisorDAO {
	public void insert(Advisor advisor) throws Exception ;
	public void update(Advisor advisor) throws Exception ;
	public void delete(Advisor advisor) throws Exception ;
	public Advisor queryById(int advisorId)  throws Exception ;
	public Advisor query(String name, String password)  throws Exception ;
	public List<Advisor> queryAll() throws Exception ;
}
