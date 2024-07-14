<%@page import="com.Dao.ProductDao" %>
<%@page import="com.helper.FactoryProvider" %>

<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
        
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <script>
   function add_to_cart(pId,pTitle,PriceAfterApplyingDiscount)
   {

      let cart= localStorage.getItem("cart");
       if(cart == null){

        let products=[];
        let product={productId:pId,productName:pTitle,productQuantity:1,productPrice:PriceAfterApplyingDiscount}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
          console.log("Product is added for the first time")
           
           }else
               {
           let pcart = JSON.parse(cart);
           
          let oldProduct = pcart.find((item) => item.productId == pId)
          if(oldProduct){

            //  we have to increase the quantity
           oldProduct.productQuantity= oldProduct.productQuantity+1
          pcart.map((item) =>{
         if(item.productId == oldProduct.productId)
             {

            item.productQuantity = oldProduct.productQuantity;
             console.log("Product quantity is increased")
             }

              })
              }
          else{

              //we have to add product

        	  let product={productId:pId,productName:pTitle,productQuantity:1,productPrice:PriceAfterApplyingDiscount}
              pcart.push(product)
              localStorage.setItem("cart",JSON.stringify(pcart))
                console.log("Product quantity is added")
              }
                  
               }
       updateCart();
       }

   function updateCart()
   {

	   let cartString = localStorage.getItem("cart");
	   let cart =JSON.parse(cartString);
	   if(cart == null || cart.length == 0){

	        console.log("Cart is empty");
	        $(".cart-items").html( "( 0 )");
	        $(".cart-body").html("<h3>Cart doesn't have any item</h3>");
	        $(".checkout-btn").addClass('disabled');
	       
		   }
	   else{

           console.log(cart)
           $(".cart-items").html(`(${cart.length})`);
           let table = `
           <table class ='table'>
           <thead class -'thead-light'>
            <tr>
             <th>Item Name</th>
             <th>Price</th>
             <th>Quantity</th>
             <th>Total Price</th>
             <th>Action</th>
            </tr>

            </thead>

               `;
           
           let totalPrice = 0
           cart.map((item) => {

               table+=`
                  <tr>

                  <td>${item.productName}</td>
                  <td>${item.productPrice}</td>
                  <td>${item.productQuantity}</td>
                  <td>${item.productQuantity * item.productPrice}</td>
                  <td><button onclick='deleteFromCart( ${item.productId} )' class ='btn btn-danger btn-sm'>Remove</button></td>
                
                   </tr>

                  `

                   totalPrice += item.productPrice * item.productQuantity;
               })

           table=table+`
           <tr><td colspa ='5' class='text-right font-weight-bold'> Total Price : ${totalPrice}</td></tr>
           </table>`
           $(".cart-body").html(table);

		   }

	   }

   
	   
  function deleteFromCart (pId) {

    let cart =JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item) => item.productId != pId)
 	   localStorage.setItem('cart',JSON.stringify(newCart))

 	   updateCart();

	   }

  $(document).ready(function (){

      updateCart()
	   
	   })
	   
   </script>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div style="width:900px;" class="container">
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