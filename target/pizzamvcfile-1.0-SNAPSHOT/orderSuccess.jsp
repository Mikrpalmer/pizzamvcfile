<%-- 
    Document   : order
    Created on : Feb 7, 2017, 3:13:05 PM
    Author     : John Phillips
--%>

<%@page import="pizzamvc.PizzaOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Michael's Online Pizza Store</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <h1><a href="home.html">Michael's Online Pizza Store</a></h1>
        <h2>Order Success! Thank you for your order!</h2>
        <h3>Order details:</h3>
        <p>Email = ${myOrder.email}</p>
        <p>Size = ${myOrder.size}</p>
        <p>Toppings: ${myOrder.toppings}</p>
        <p>Crust: ${myOrder.crust}</p>
        <%
                PizzaOrder po = (PizzaOrder) request.getAttribute("myOrder");
                String[] toppingArray = request.getParameterValues("toppings");
                double cost = 0.0;
                String toppings = "none";
                if (toppingArray != null && toppingArray.length > 0) {
                    toppings = "";
                    if (toppingArray.length == 1) {
                        toppings = toppingArray[0];
                        cost = cost + .75;
                    } else if (toppingArray.length > 1) {
                        for (int i = 0; i < toppingArray.length - 1; i++) {
                            toppings += toppingArray[i] + ", ";
                            cost = cost + .75;
                        }
                        toppings += toppingArray[toppingArray.length - 1];
                    }
                }
                if (request.getParameter("size").equals("small")) {
                    cost = cost + 5.00;
                } else if (request.getParameter("size").equals("medium")) {
                    cost = cost + 6.00;
                } else if (request.getParameter("size").equals("large")) {
                    cost = cost + 7.00;
                }
                if (request.getParameter("other").equals("pan")) {
                    cost = cost + 1.00;
                } else if (request.getParameter("other").equals("hand-tossed")) {
                    cost = cost + .50;
                }
                out.println("<p>Your Final Cost is: " + cost + "</p>");
            %>
        <p><a href='home.html'>Return to home page</a></p>
    </body>
</html>
