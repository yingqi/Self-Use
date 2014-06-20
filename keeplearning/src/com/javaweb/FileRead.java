package com.javaweb;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;


public class FileRead extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String fileName = "content1.txt";
		ServletContext application = getServletContext();
		String realPathString = application.getRealPath(fileName);
		java.io.File file = new java.io.File(realPathString);
		if(file.exists()){
			Scanner scanner = new Scanner(file);
			while(scanner.hasNextLine()){
				String lineString = scanner.nextLine();
				out.println(lineString+"<br>");
			}
		}
		else {
			out.println("File not exist!");
		}
	}
	
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
