package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LgOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LgOutServlet() {
       
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	response.setContentType("text/html");
	try(PrintWriter out = response.getWriter()){
		
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("current-user");
		response.sendRedirect("login.jsp");
		
		
		
	}
	
	}	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
