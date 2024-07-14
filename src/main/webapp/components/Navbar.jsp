<%@page import ="com.entities.Users" %>

<% Users user1= (Users)session.getAttribute("current-user"); 

%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

 
  <a class="navbar-brand" href="index.jsp">Welcoming To Shopping Cart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <br>
  <br>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">laptop</a>
          <a class="dropdown-item" href="#">phone</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Kitchen</a>
           <a class="dropdown-item" href="#">Clothes</a>
        </div>
      </li>
     
    </ul>
    <ul class="navbar-nav ml-auto">
    
    <li class="nav-item active">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart" ><i class="fa fa-cart-plus" style="font-size: 25x;"></i><span class = "ml-0 cart-items" style ="margin-top: -10px;" "font-size: 30px;">(   0   )</span> </a>
     </li>
    
    
    
    <%
    if(user1==null){
    	
    %>
    <li class="nav-item active">
        <a class="nav-link" href="login.jsp">Login </a>
     </li>
    
     <li class="nav-item active">
        <a class="nav-link" href="register.jsp">Register </a>
     </li>
    
    
    
    <% 
   } else{%>
   
   <li class="nav-item active">
        <a class="nav-link" href="#"><%= user1.getUserName() %> </a>
     </li>
    
     <li class="nav-item active">
        <a class="nav-link" href="LgOutServlet">Logout </a>
     </li>
   
  
    	
   <%  }
    
    
    %>
    
    
    
    </ul>
  </div>
</nav>