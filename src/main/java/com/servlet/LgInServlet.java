package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.userDao;
import com.entities.Users;
import com.helper.FactoryProvider;

public class LgInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
      public LgInServlet() {
                
    }

     protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()) {
			
			String userEmail = request.getParameter("userEmail");
			String userPassword = request.getParameter("userPassword");
			
		userDao dao=new userDao(FactoryProvider.getFactory());
		Users user = dao.getUserByEmailAndPassword(userEmail, userPassword);
		HttpSession httpSession =request.getSession();
		//System.out.println(user);
		if(user == null) {
			out.println("<h1>Invalid details </h1>");
			
			httpSession.setAttribute("message","Invalid details!! Try with anohter one");
			response.sendRedirect("login.jsp");
			return;
		}else {
			out.println("<h1>Welcome"  +  user.getUserName()  +"</h1>");
			
			httpSession.setAttribute("current-user", user);
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}else if(user.getUserType().equals("normal"))
				{
					response.sendRedirect("normal.jsp");
				}else {
					out.println("We have not identified user type");
				}
		}
		}
	}
    
     @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		processRequest(request,response);
	}

     @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		processRequest(request,response);
	}

}
