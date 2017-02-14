<%-- 
    Document   : order.jsp
    Created on : Feb 13, 2017, 2:00:56 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Will's JSP Pizza Order</title>
    </head>
    <body>
        <h1>Order Result</h1>

        <%= request.getParameter("email")%>

        <p>Email = ${param.email}</p>
        <p>Size = ${param.size}</p>
        <p>Type = ${param.type}</p>


        <%

            String toppings[] = request.getParameterValues("toppings");
            double cost = 0;
            if (toppings != null && toppings.length != 0) {
                out.println("<p>Toppings: ");
                for (String myTopping : toppings) {
                    out.println(myTopping + ", ");

                }
                out.println("</p>");

                cost += toppings.length * 0.75;

            }

            switch (request.getParameter("size")) {
                case "small":
                    cost += 5;
                    break;
                case "medium":
                    cost += 6;
                    break;
                case "large":
                    cost += 7;
                    break;
                case "extra large":
                    cost += 10;
                    break;

            }

            switch (request.getParameter("type")) {
                case "pan":
                    cost += 1;
                    break;
                case "thin":
                    cost += 0.50;
                    break;
                case "hand-tossed":
                    cost += 0;
                    break;
                case "stuffed crust":
                    cost += 2;
                    break;
            }
            out.println("<p>Cost = $" + cost + "</p>");
        %>     

    </body>
</html>
