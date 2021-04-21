<%-- 
    Document   : eventos_list
    Created on : 18-abr-2021, 19:05:50
    Author     : ruben
--%>

<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Eventos</title>
    </head>
    
    <%
        List<Evento> listaEventos = (List)request.getAttribute("listaEventos");
    %>
    
    <body>
        <h1>Listado de Eventos</h1>
        <table>
            <tr>
                <th>Título</th>
                <th>Descripción</th>
            </tr>
            
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
            
        </table>
    </body>
</html>
