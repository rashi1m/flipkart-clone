<%@page import ="com.Dao.ProductDao" %>
<%@page import ="com.Dao.CategoryDao" %>
<%@page import ="com.helper.FactoryProvider" %>
<%@page import ="com.helper.Helper" %>
<%@page import ="com.entities.Products" %>
<%@page import ="com.entities.Category" %>
<%@page import ="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E Commerce Shopping Cart</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
  
   <%@include file = "components/Navbar.jsp" %>
   <div class="container-fluid">
   <div class="row mt-3 mx-2">
   <%
   
   String cat=request.getParameter("category");
       // out.println("cat");
      ProductDao pDao =new ProductDao(FactoryProvider.getFactory());
      List<Products> list = null;
      if(cat == null || cat.trim().equals("all")){
    	  list = pDao.getAllProducts();
      }
      
      
      else if(cat.trim().equals("all"))
      {
    	  list=pDao.getAllProducts();
      }
      else{
    	  int cid=Integer.parseInt(cat.trim());
    	 list= pDao.getAllProductsById(cid);
      }
      
     
     CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
     List<Category> clist = cDao.getCategories();
	  
   
   %>
   
   <div class ="col-md-6">
    <div class="list-group mt-4">
  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
    All Products
  </a>
  

   <%
   
   for(Category category: clist){
	   %>
	   
	   <a href="index.jsp?category=<%=category.getCatId() %>" class="list-group-item list-group-item-action"><%=category.getCatTitle() %></a>
	   

<%   
   }
   
   
   %>
   
   
   
   </div>
   </div>
   
   </div>
   
   <!-- show products -->
   <div class = "col-md-10">
   
   <div class = "row mt-5">
   
   <div class="col-md-8">
   
   <div class="card-columns">
   
   <%
   
   for(Products products:list ){
   
   %>
   
   <div class ="card">
   <div class="container text-center">
    <img src="Logo/products/<%= products.getpPhoto() %>"  class="card-img-top m-0" alt="...">
    
    </div>
   <div class="card-body">
   <h5 class="card-title"><%=products.getpTitle() %></h5>
   <p class= "card-text">
   
   <%= Helper.get20Words(products.getpDescription()) %>
   
   
   </p>   
   </div>
    <div class="card-footer">
   <button class="btn btn-success text-white"> &#8377;<%=products.getPriceAfterApplyingDiscount() %><span class="text-secondary dicount-label"> <%=products.getpPrice() %> <%=products.getpDiscount() %>% Off</span></button>
   
   <div class="card-footer">
   <a href ="AddToCart?id=<%=products.getpId() %>"  class="btn custom-bg text-white" >Add Cart</a>
   
    <button class="btn btn-warning text-white">Buy Now</button>
   
   </div>
   </div>
   </div>

   
  <%
   }
   
   
   
   if(list.size()==0){
	   out.println("<h3>No item in this category</h3>");
   }
   
   %>
   
   </div>
   </div>
   </div>
   </div>

</div>
   
<%@ include file="components/common_modal.jsp" %>
</body>
</html>