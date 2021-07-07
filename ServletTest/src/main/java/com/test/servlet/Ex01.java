package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex01 extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<body>");
		writer.println("<h1>Number<h1>");
		Random rnd = new Random();
		
		writer.println("<div>num: " + rnd.nextInt(100) + "<div>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
		
		
	}
	
}
