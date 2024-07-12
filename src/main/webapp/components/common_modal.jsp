<%@page import="com.Dao.ProductDao" %>
<%@page import="com.helper.FactoryProvider" %>
<%@page import="com.entities.Cart" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart_list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        cartProduct = pdao.getCartProducts(cart_list);
        request.setAttribute("cart_list", cart_list);
    }
%>
<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div style="width:750px;" class="container">
        <div class="modal-content">
            <div class="modal-header">
                <div class="container text-center">
                    <h5 style="font-size:40px;" class="modal-title" id="exampleModalLabel">Your Cart</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>
            <div class="container">
                <div class="modal-body">
                    <div class="cart-body">
                        <table class="table table-light">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Cancel</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (cart_list != null && cartProduct != null) {
                                    for (Cart c : cartProduct) { %>
                                        <tr>
                                            <td><%= c.getpTitle() %></td>
                                            <td><%= c.getPriceAfterApplyingDiscount() %></td>
                                            <td><%= c.getpQuantity() %>
                                                <form action="" method="post" class="form-inline">
                                                    <input type="hidden" name="id" value="<%= c.getpId() %>" class="form-input">
                                                    <div class="form-group">
                                                        <a class="btn btn-sm btn-incre" href="#"><i class="fas fa-plus-square"></i></a>
                                                        <input type="text" name="pQuantity" class="form-control pQuantity-input" value="1" readonly>
                                                        <a class="btn btn-sm btn-decre" href="#"><i class="fas fa-minus-square"></i></a>
                                                    </div>
                                                </form>
                                            </td>
                                            <td><a class="btn btn-sm btn-danger" href="">Remove</a></td>
                                        </tr>
                                    <% }
                                } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary checkout-btn">Checkout</button>
            </div>
        </div>
    </div>
  </div>
</div>
</body>
</html>