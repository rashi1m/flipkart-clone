<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login-Shop Cart</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/Navbar.jsp" %>
									
	<div class="container">
	<div class="row">	
	<div class="col-md-6 offset-md-3">
	<div class="card">
	<div class="card-header custom-bg text-white">
	<h3>Login Here</h3>
	</div>
	<div class="card-body">
	<%@include file="components/message.jsp" %>
	<form action="LgInServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="userEmail" type="email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter email">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="userPassword" type="password" class="form-control" id="exampleInputPassword" placeholder="Enter Password">
  </div>

  <div class="container text-center">
   <a href="register.jsp" class="text-centerd-block mb-4">if not registered click here</a>
   <br>
  <button type="submit" class="btn btn-primary custom-bg">Submit</button>
  <button type="reset" class="btn btn-primary custom-bg">Reset</button>
   </div>
</form>
	</div>
	
	</div>
	</div>
	
	</div>
	</div>

</body>
</html>