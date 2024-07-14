package com.servlet;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Dao.CategoryDao;
import com.Dao.ProductDao;
import com.entities.Category;
import com.entities.Products;
import com.helper.FactoryProvider;

@MultipartConfig
public class POperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public POperationServlet() {
        
    }
    
    protected void processRequest(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
    {
    	response.setContentType("text/html");
    	try(PrintWriter out = response.getWriter()) {
    		try {
    			
    		String op = request.getParameter("operation");
    		if(op.trim().equals("addCategory"))
    		{
    			String title = request.getParameter("catTitle");
    			String description = request.getParameter("catDescription");
    			
    			Category category =new Category();
    			category.setCatTitle(title);
    			category.setCatDescription(description);
    			
    			CategoryDao categoryDao =new CategoryDao(FactoryProvider.getFactory());
    			int catId = categoryDao.saveCategory(category);
    			//out.println("Category saved");
    			
    			HttpSession httpSession = request.getSession();
    			httpSession.setAttribute("message", "Category added successfully :" + catId);
    			response.sendRedirect("admin.jsp");
    			return;
    			
    		}
    		else if(op.trim().equals("addProduct"))	
    		{
    			String pName=request.getParameter("pName");
    			String pDescription=request.getParameter("pDescription");
    			int pPrice=Integer.parseInt(request.getParameter("pPrice"));
    			int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
    			int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
    			int catId=Integer.parseInt(request.getParameter("catId"));
    			Part part = request.getPart("pPic");
    			
    			Products p = new Products();
    			p.setpTitle(pName);
    			p.setpDescription(pDescription);
    			p.setpPrice(pPrice);
    			p.setpDiscount(pDiscount);    			
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
			
				
				// get category by id 
				
				CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
				
				Category category =cDao.getCategoryById(catId);
				p.setCategory(category);
				
			
				ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
				pDao.saveProduct(p);
				
				//pic upload
				
				String path =request.getRealPath("Logo")+File.separator+"products"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
				
				//uploading code
				try {
				FileOutputStream fos= new FileOutputStream(path);
				InputStream is = part.getInputStream();
				
				byte []data = new byte[is.available()];
				
				is.read(data);
				fos.write(data);
                fos.close();
				}catch(Exception e)
				{
					e.printStackTrace();
				}
				
    			HttpSession httpSession = request.getSession();
    			httpSession.setAttribute("message", "Product added successfully!");
    			response.sendRedirect("admin.jsp");
    			return;
    			
    		}
    			
    			
    			
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
