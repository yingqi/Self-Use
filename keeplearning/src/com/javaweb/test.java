package com.javaweb;

import java.sql.Date;
import java.util.Calendar;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int y,m,d;    
		Calendar cal=Calendar.getInstance();    
		y=cal.get(Calendar.YEAR);    
		m=cal.get(Calendar.MONTH);    
		d=cal.get(Calendar.DATE);
		System.out.println(y+"-"+m+"-"+d);
	}

}
