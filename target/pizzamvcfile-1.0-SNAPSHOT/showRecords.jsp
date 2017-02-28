<%-- 
    Document   : showRecords
    Created on : Feb 14, 2017, 11:01:30 PM
    Author     : John Phillips
--%>

<%@page import="java.util.List"%>
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
        <h2>Order Report</h2>
        <%
            List<PizzaOrder> orderList = (List<PizzaOrder>) request.getAttribute("orderList");
        %>
        <table>
            <%
                for (PizzaOrder order : orderList) {
            %>
            <tr>
                <td><%=order.getEmail()%></td>
                <td><%=order.getSize()%></td>
                <td><%=order.getToppings()%></td>
                <td><%=order.getCrust()%></td>
            </tr>
            <%
                }
            %>
        </table>     
        <p><a href='home.html'>Return to home page</a></p>
    </body>
</html>
