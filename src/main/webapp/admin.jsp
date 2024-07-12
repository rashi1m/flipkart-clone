<%@page import="com.entities.Users" %>
<%@page import="com.Dao.CategoryDao" %>
<%@page import="com.entities.Category" %>
<%@page import="com.servlet.POperationServlet" %>
<%@page import="com.entities.Products" %>
<%@page import="com.helper.FactoryProvider" %>
<%@page import="com.entities.Users" %>
<%@page import="java.util.List" %>
<%@page import="com.helper.Helper" %>
<%@page import="java.util.Map" %>
<%
  Users user = (Users)session.getAttribute("current-user");
  if(user == null){
	  
	  session.setAttribute("message","You are not logged in!! Login Here");
	  response.sendRedirect("login.jsp");
	  return;
	  
  }else
  {
	  if(user.getUserType().equals("normal"))
	  {
		  session.setAttribute("message","You are not Admin!! Do not Access this page");
		  response.sendRedirect("login.jsp");
		  return;
	  }
  }

%>

<%
    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
     List<Category> list = cDao.getCategories();
      
   // getting count
   
 Map<String,Long> m =  Helper.getCounts(FactoryProvider.getFactory());
     
     
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>
<style>
 body{
  background:#e2e2e2;
 
 }

</style>
</head>
<body>

<%@include file="components/Navbar.jsp" %>

<div class= "container admin">

<div class="container-fluid mt-3">
<%@include file="components/message.jsp" %>

</div>


<div class="row mt-3">

<div class= "col-md-4">
<div class="card">
<div class="card-body text-center">
<div class="container">

<img style="max-width:100px" class="img-fluid" src="Logo/man.png" alt="user_icon">
<h1><%=m.get("userCount") %></h1>
<h1>Users</h1>
</div>

</div>
</div>

</div>

<div class= "col-md-4">
<div class="card">
<div class="card-body text-center">
<div class="container">
<img style="max-width:100px" class="img-fluid rounded-circle" src="Logo/user-network.png" alt="user_icon">
<h1><%=list.size() %></h1>
<h1>Category</h1>
</div>
</div>
</div>
</div>

<div class= "col-md-4">
<div class="card">
<div class="card-body text-center">
<div class="container">
<img style="max-width:100px" class="img-fluid rounded-circle" src="Logo/brand-identity.png" alt="user_icon">
<h1><%=m.get("productCount") %></h1>
<h1>Products</h1>
</div>
</div>
</div>
</div>


<div class= "col-md-4 mt-3">
<div class="card" data-toggle="modal" data-target="#add-category-modal">
<div class="card-body">
<div class="container">

<img style="max-width:100px" class="img-fluid rounded-circle" src="Logo/plus.png" alt="user_icon">

<p class="mt-4">click here to add new category</p>
<h1>Add Category</h1>
</div>
</div>
</div>
</div>



<div class= "col-md-4 mt-3 ">
<div class="card" data-toggle="modal" data-target="#add-product-modal">
<div class="card-body">
<div class="container ">

<img style="max-width:100px" class="img-fluid rounded-circle" src="Logo/plus.png" alt="user_icon">

<p class="mt-4">Click here to add new Product</p>
<h1> Add Products</h1>
</div>
</div>
</div>
</div>
</div>
</div>



<!--product Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action = "POperationServlet" method="post" enctype="multipart/form-data">
       
       <input type="hidden" name="operation" value="addProduct">
         <div class="container-fluid">
        <div class="form-group">
        
        <input type="text" class="form-control" name="pName" placeholder="Enter title of product" required/>
        </div>
        </div>
       
       <!-- product description -->
       <div class="container-fluid">
        <div class="form-group">
        <textarea style="height:150px" class="form-control" placeholder="Enter product description" name="pDescription" required>Enter description here</textarea>
        </div>
        </div>
       <div class="container-fluid">
       <div class="form-group">
        
        <input type="number" class="form-control" name="pPrice" placeholder="Enter price of product" required/>
        </div>
        </div>
          <div class="container-fluid">
         <div class="form-group">
        
        <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>
        </div>
        </div>
          <div class="container-fluid">
        <div class="form-group">
        
        <input type="number" class="form-control" name="pQuantity" placeholder="Enter product Quantity" required/>
        </div>
        </div>




<div class="container-fluid">
         <div class="form-group">
         <select name="catId" class="form-control" id="category_catId">
         <%
         for(Category c:list){
        	
         
         %>
         <option value="<%= c.getCatId() %>"> <%= c.getCatTitle() %></option>
         
         <%} %>
         </select>
         
         </div>
         </div>
         
         <!-- product file -->
           <div class="container-fluid">
         <div class="form-group">
         <label for="pPic"></label>
         <input type="file"id="pPic" name="pPic" required/>
         </div>
         </div>
         <!-- submit button -->
         
         <div class="container text-center">
         <button class="btn btn-outline-success">Add Product</button>
         </div>
         </div>
         </div>
         </div>
        
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
 </form>
     

    
    
    
   <!---Add category Modal--> 
   
    <!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action ="POperationServlet" method="post">
        
        <input type="hidden" name="operation" value="addCategory">
        
        
        <div class="form-group">
        
        <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
        
        
        </div>
        </div>
        <div class="container-fluid">
          <div class="form-group">
        <textarea style="height:300px;" class="width:100px" placeholder="Enter category description" name="catDescription" required>Description</textarea>
        </div>
        </div>
        <div class="container text-center">
        <button class = "btn btn-outline-success">Add Category</button>
        </div>
       
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>   
  </div>    
 </form>
</body>
</html>