<%-- 
    Document   : eventos_list
    Created on : 18-abr-2021, 19:05:50
    Author     : ruben
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Eventos</title>
        
        <style>
            table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            }
        ∫</style>
        
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
                <th>Fecha del Evento</th>
                <th>Fecha límite de reserva</th>
                <th>Precio</th>
                <th>Aforo</th>
                <th>Límite de usuarios</th>
                <th>Número de filas</th>
                <th>Número de asientos por fila</th>
            </tr>
            
            <%
                for(Evento evento: listaEventos){      
                /*SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                
                String strDate = dateFormat.format(evento.getFechaEvento());
                Date fecha = sdf.parse(strDate);
                
                String strLimitDate = dateFormat.format(evento.getFechaLimite());
                Date fechaLimite = sdf.parse(strLimitDate);*/
            %>
            
            <tr>
                <td><%= evento.getTitulo() %></td>
                <td><%= evento.getDescripcion() %></td>
                <td><%= evento.getFechaEvento() %></td>
                <td><%= evento.getFechaLimite() %></td>
                <td><%= evento.getPrecio() %></td>
                <td><%= evento.getAforo() %></td>
                <td><%= evento.getLimiteUsuario() %></td>
                <td><%= evento.getNFilas() %></td>
                <td><%= evento.getNAsientosFila() %></td>
                <td><a href="ServletEventoEliminar?id=<%= evento.getId() %>">Eliminar</a></td>

            </tr>
            
            <%
                }
            %>
            
        </table>
    </body>
</html>
