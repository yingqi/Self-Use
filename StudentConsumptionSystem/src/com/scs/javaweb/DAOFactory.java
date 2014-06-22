package com.scs.javaweb;

public class DAOFactory {
	public static AdvisorDAOImpl getAdvisorDAOInstance(){
		return new AdvisorDAOImpl();
	}
	
	public static StudentDAOImpl getStudentDAOInstance(){
		return new StudentDAOImpl();
	}
	
	public static ConsumptionDAOImpl getConsumptionDAOInstance(){
		return new ConsumptionDAOImpl();
	}
}
