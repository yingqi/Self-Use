package com.javaweb;

public class DAOFactory {
	public static UserDAOImpl getUserDAOInstance(){
		return new UserDAOImpl();
	}
}
