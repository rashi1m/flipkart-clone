function add_cart(pId, pTitle, pPrice) {
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        let products = [];
        let product = {productId: pId, productName: pTitle, productQuantity: 1, productPrice:pPrice };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product is added for the first time");
    } else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pId);
        if (oldProduct) {
            oldProduct.productQuantity += 1;
            pcart = pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
                return item;
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity is increased");
        } else {
            let product = {productId: pId, productName: pTitle, productQuantity: 1, productPrice: pPrice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added");
        }
    }
    updateCart()

}
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart doesn't have any item</h3>");
        $(".checkout-btn").addClass('disabled');
    } else {
        console.log(cart);
        
        $(".cart-items").html(`(${cart.length})`);
        
       let table = `
           <table class='table'>
           <thead class='thead-light'>
            <tr>
             <th>Item Name</th>
             <th>Price</th>
             <th>Quantity</th>
             <th>Total Price</th>
             <th>Action</th>
            </tr>
            </thead>`;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                  <tr>
                  <td>${item.productName}</td>
                  <td>${item.productPrice}</td>
                  <td>${item.productQuantity}</td>
                  <td>${item.productQuantity * item.productPrice}</td>
                  <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                   </tr>`;
            totalPrice += item.productPrice * item.productQuantity;
        });
        table += `<tr><td colspan='5' class='text-right font-weight-bold'> Total Price : ${totalPrice}</td></tr></table>`;
        $(".cart-body").html(table);
    }
}

function deleteItemFromCart(pId) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pId);
    localStorage.setItem('cart', JSON.stringify(newcart));
    updateCart();
}

$(document).ready(function() {
    updateCart();
})
