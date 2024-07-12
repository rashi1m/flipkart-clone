package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Users;
import com.helper.FactoryProvider;


public class Rservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Rservlet() {
      
        
    }
    
    protected void processRequest(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
    {
    	response.setContentType("text/html");
    	try(PrintWriter out = response.getWriter()) {
    		try {
    			
    			String userName=request.getParameter("userName");
    			String userEmail=request.getParameter("userEmail");
    			String userPassword=request.getParameter("userPassword");
    			String userPhone =	request.getParameter("userPhone");
    			
    			String userAddress=	request.getParameter("userAddress");
    			
    			if(userName.isEmpty()) {
    				out.println("Name is blank");
    				return;
    			}
    					
    					
    			Users user = new Users(userName,userEmail,userPassword,userPhone,"default.jpg",userAddress,"normal");
    			Session session= FactoryProvider.getFactory().openSession();
    			Transaction tx = session.beginTransaction();
    			
    			int userId=(int )session.save(user);
    			tx.commit();
    			
    			session.close();
    			
    			HttpSession httpSession=request.getSession();
    			httpSession.setAttribute("message", "Registration Successfull"+userId);
    			response.sendRedirect("register.jsp");
    			return;
    			
    		}catch(Exception e)
    		{
    			e.printStackTrace();
    		}
    	}
    	
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      processRequest(request,response);
    }
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
     processRequest(request,response);
	
	
	
		}
		
		
	}


