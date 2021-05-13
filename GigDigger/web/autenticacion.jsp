<%-- 
    Document   : autenticacion
    Created on : 29-abr-2021, 18:25:53
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido al sistema</title>
    </head>
    <%
        String strError = (String)request.getAttribute("error");
        if (strError == null) strError = "";        
    %>
    <body>
        <h1>Inicio de Sesión</h1>
        <form method="POST" action="ServletAutenticacion">
            <%= strError %> <br/>
            Usuario: <input type="text" name="usuario" value="" /><br/>
            Password: <input type="password" name="password" value="" /><br/>
            <input type="submit" value="Enviar" />
        </form>
    </body>
</html>
