<%-- 
    Document   : eventos_list
    Created on : 18-abr-2021, 19:05:50
    Author     : ruben
--%>

<%@page import="gigdigger.entity.Estudio"%>
<%@page import="gigdigger.entity.EtiquetaEvento"%>
<%@page import="gigdigger.entity.Etiqueta"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
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
        <title>Listado de Estudios</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">        
        <style>
            table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            }
        ∫</style>
        
    </head>
    
    <%
        List<Estudio> listaEstudios = (List)request.getAttribute("listaEstudios");
        

    %>
    
    <body>
        <h1>Listado de Estudios</h1>
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Fecha de creación</th>
            </tr>
            </thead>
            
            <tbody>
            
            <%
                for(Estudio estudio: listaEstudios){      
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                
                String fecha = formatter.format(estudio.getFechaCreacion());                
            %>
            
            <tr>
                <td><%= estudio.getNombreEstudio() %></td>
                <td><%= estudio.getDescripcion() %></td>
                <td><%= fecha %></td>
                
                <td><a href="ServletEstudioEliminar?id=<%= estudio.getId() %>">Eliminar</a></td>

            </tr>
            
            <%
                }
            %>
            </tbody>  
        </table>
            <br>
            <a href="ServletEstudioCrear" class="btn btn-info">Nuevo estudio</a>
    </body>
</html>
