package com.javaweb;

import java.util.List;

public interface UserDAO {
	public void insert(User user) throws Exception ;
	public void update(User user) throws Exception ;
	public void delete(User user) throws Exception ;
	public User queryById(int userId)  throws Exception ;
	public List queryAll() throws Exception ;
}
