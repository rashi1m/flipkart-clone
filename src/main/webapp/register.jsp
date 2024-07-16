<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>

<%@include file="components/common_css_js.jsp" %>
</head>
<body>

<%@include file = "components/Navbar.jsp" %>
<div class="container-fluid">
<div class="row mt-5">
    <div class="col-md-5 offset-md-4">
    
    <div class="card">
   <%@include file="components/message.jsp" %>
    <div class ="card-body px-5">
    <img class="card-img-top" style="height:50px;" alt="Card image cap" src="Logo/signupLogo.png">
     <h2 class="text-center my-3">Sign Up Here!!</h2>
    <form action="Rservlet" method="post">
   <div class="form-group">
    <label for="name">User Name</label>
    <input name="userName" type="text" class="form-control" id="name" placeholder="Enter user Name">
  </div>
  
    <div class="form-group">
    <label for="email">User Email</label>
    <input name="userEmail" type="email" class="form-control" id="email" placeholder="Enter Email">
  </div>
  
   <div class="form-group">
    <label for="password">User Password</label>
    <input name="userPassword" type="password" class="form-control" id="password" placeholder="Enter Password">
  </div>
  
  <div class="form-group">
    <label for="phone">User Phone</label>
    <input name="userPhone" type="number" class="form-control" id="phone" placeholder="Enter Phone number">
  </div>
  
  <div class="form-group">
    <label for="address">User Address</label>
    <textarea name="userAddress" style="height:200px" class="form-control" placeholder="Enter your Address"></textarea>
  </div>
    
    <div class="container text-center">
    <button type="register" class="btn btn-primary">Register</button>
     <button type="reset" class="btn btn-warning">Reset</button>
    </div>
    </form>
    </div>
    </div>
    </div>
</div>
</div>
</body>
</html>
