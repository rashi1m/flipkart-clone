package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.entities.Cart;

public class AddToCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddToCart() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart_list");

           
            String pId = request.getParameter("pId");
            if (pId == null || pId.isEmpty()) {
                out.println("<h3 style='color:crimson; text-align:center'>Product ID is missing</h3>");
                return;
            }

          
            int pid;
            try {
                pid = Integer.parseInt(pId);
            } catch (NumberFormatException e) {
                out.println("<h3 style='color:crimson; text-align:center'>Invalid Product ID format</h3>");
                return;
            }

            Cart cm = new Cart();
            cm.setpId(pid);
            cm.setpQuantity(1);

            if (cartList == null) {
                cartList = new ArrayList<>();
                cartList.add(cm);
                session.setAttribute("cart_list", cartList);
                out.println("Session created and product added to the cart.");
            } else {
                boolean exist = false;
                for (Cart c : cartList) {
                    if (c.getpId() == pid) {
                        exist = true;
                        out.println("<h3 style='color:crimson; text-align:center'>Item already exists in the cart.</h3>");
                        break;
                    }
                }

                if (!exist) {
                    cartList.add(cm);
                    response.sendRedirect("index.jsp");
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}