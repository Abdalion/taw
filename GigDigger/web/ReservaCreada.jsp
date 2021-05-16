<%-- 
    Document   : ReservaCreada
    Created on : 12-may-2021, 0:02:38
    Author     : egonb
--%>

<%@page import="gigdigger.entity.Entrada"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            List<Entrada> entradas = (List<Entrada>)request.getAttribute("entradas");
        
            for(Entrada e : entradas) {
                %>
                fila:<%=e.getFila()%> - asiento:<%=e.getAsiento()%>
                
                <%
            }
        %>
        
        
    </body>
</html>
