<%-- 
    Document   : ChatUsuario
    Created on : 23-abr-2021, 11:08:10
    Author     : Usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%ArrayList<Mensaje> mensajes = (ArrayList) session.getAttribute("mensajes");%>
    </body>
</html>
