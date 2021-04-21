<%-- 
    Document   : PanelAdministrador
    Created on : 20-abr-2021, 21:50:02
    Author     : egonb
--%>

<%@page import="gigdigger.entity.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel administrador</title>
    </head>
    <body>
    <%
        List<Evento> listaEventos = (List)request.getAttribute("listaEventos");
        List<Usuario> listaUsuarios = (List)request.getAttribute("listaUsuarios");
    %>        
        <h1>Lista de usuarios</h1>
            <%
                for(Usuario usuario: listaUsuarios){                  
            %>
            
            <tr>
                <td><%= usuario.getNombreUsuario() %></td>
                <td>ROL: <%= usuario.getRol() %></td>
            </tr>
            
            <%
                }
            %>
        <h1>Lista de eventos</h1>
            <%
                for(Evento evento: listaEventos){                  
            %>
            
            <tr>
                <td><%= evento.getTitulo() %></td>
                <td><%= evento.getDescripcion() %></td>
            </tr>
            
            <%
                }
            %>
    </body>
</html>
