<%-- 
    Document   : listaChats
    Created on : 12-may-2021, 23:46:30
    Author     : Usuario
--%>

<%@page import="gigdigger.entity.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gigdigger.entity.Chat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        List<Chat> listaChats = (ArrayList<Chat>) request.getAttribute("listaChats");
        Usuario usuario = (Usuario) request.getAttribute("usuario");
        %>
    <body>
        <h1>Historial de chats de <%=usuario.getNombreUsuario()%></h1>
        <br/>
        <%
            for(Chat c:listaChats){           
            %>
            
        <h4><%=c.getIdUsuario().getNombreUsuario()%></h4>
                        <p>Notificaciones: <%=c.getNotificaciones()%></p>
                        <hr>
                        <%    
                        }
                        %>
    </body>
</html>
