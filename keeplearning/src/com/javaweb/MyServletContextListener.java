package com.javaweb;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MyServletContextListener implements ServletContextListener,HttpSessionListener, HttpSessionAttributeListener {

	private ServletContext application = null;
	
	public void contextInitialized(ServletContextEvent sce){
		ArrayList<String> allUser =new ArrayList<String>();
		application = sce.getServletContext();
		application.setAttribute("allUser", allUser);
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}


	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		ArrayList<String> allUser =(ArrayList<String>) application.getAttribute("allUser");
		String user = (String) se.getValue();
		allUser.add(user);
		application.setAttribute("allUser", allUser);
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		ArrayList<String> allUser =(ArrayList<String>) application.getAttribute("allUser");
		String user = (String) se.getSession().getAttribute("username");
		allUser.remove(user);
		application.setAttribute("allUser", allUser);
		
	}

}
