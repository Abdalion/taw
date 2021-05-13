<%-- 
    Document   : Perfil
    Created on : 13-may-2021, 18:51:10
    Author     : egonb
--%>

<%@page import="gigdigger.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            Usuario u = (Usuario)request.getAttribute("usuario");
            if(u == null) {
                %>
                <h1>Algo salió mal.</h1>
                <%
            }else {
            %>
                  <h1 class="center">Hola, <%=u.getNombreUsuario()%></h1>  
            <%
            }
        %>
    </body>
</html>
