<%@page import ="com.Dao.*" %>
<%@page import ="com.helper.*" %>
<%@page import ="java.util.*" %>
<%@page import ="com.entities.*" %>
<%@page import ="com.Dao.ProductDao" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Commerce Shopping Cart</title>
<%@include file="components/common_css_js.jsp" %>

<style>
  .category-list {
    margin-top: 20px;
  }
  .product-container {
    margin-left: auto; 
    width: 80%;
  }
  .product-card {
    margin: 10px;
  }
</style>
</head>
<body>
   <%@include file="components/Navbar.jsp" %>
   <div class="container-fluid">
   <div class="row mt-2 mx-2">
   <%
   String cat = request.getParameter("category");
   ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
   List<Products> list = null;
   if (cat == null || cat.trim().equals("all")) {
       list = pdao.getAllProducts();
   } else {
       int cid = Integer.parseInt(cat.trim());
       list = pdao.getAllProductsById(cid);
   }
   CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
   List<Category> clist = cDao.getCategories();
   %>
   <div class="col-md-3 category-list">
    <div class="list-group mt-3 ml-1">
      <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
        All Products
      </a>
      <%
      for (Category category : clist) {
      %>
        <a href="index.jsp?category=<%= category.getCatId() %>" class="list-group-item list-group-item-action">
          <%= category.getCatTitle() %>
        </a>
      <%
      }
      %>
    </div>
   </div>
   <div class="col-md-9 product-container">
     <div class="row mt-3">
       <div class="col-md-12">
         <div class="card-columns">
           <%
           for (Products products : list) {
           %>
           <div class="card product-card">
             <div class="container text-center">
               <img src="Logo/products/<%= products.getpPhoto() %>" class="card-img-top m-0" alt="">
             </div>
             <div class="card-body">
               <h5 class="card-title"><%= products.getpTitle() %></h5>
               <p class="card-text">
                 <%= Helper.get20Words(products.getpDescription()) %>
               </p>   
             </div>
             <div class="card-footer">
                <button class="btn custom-bg text-white" onclick="add_cart(<%= products.getpId() %>,'<%= products.getpTitle() %>',<%= products.getPriceAfterApplyingDiscount() %>)">Add Cart</button>
                <button class="btn btn-success text-white">&#8377;<%= products.getPriceAfterApplyingDiscount() %>
               <span class="text-secondary discount-label"><%= products.getpPrice() %> <%= products.getpDiscount() %>% Off</span>
               </button>
             </div>
           </div>
           <%
           }
           if (list.size() == 0) {
               out.println("<h3>No item in this category</h3>");
           }
           %>
         </div>
       </div>
     </div>
   </div>
  </div> 
 </div>
<%@include file="components/common_modal.jsp" %>
<script src="js/script.js">

</script>

</body>
</html>
