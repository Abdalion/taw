<%-- 
    Document   : Estudio
    Created on : 16-may-2021, 0:31:21
    Author     : ruben
--%>

<%@page import="gigdigger.entity.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="gigdigger.entity.Estudio"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page import="gigdigger.entity.UsuarioAuto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudio</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
    </head>

    <%
        Estudio estudio = (Estudio) request.getAttribute("estudio");
        String tipo = estudio.getTipo();


    %>

    <body>

        <h1>Estudio <%= estudio.getNombreEstudio()%></h1>

        Nombre: <%= estudio.getNombreEstudio()%><br>
        Descripcion: <%= estudio.getDescripcion()%></br>
        Fecha de creacion: <%= new SimpleDateFormat("dd/MM/yyyy").format(estudio.getFechaCreacion())%><br>
        Tipo: <%= tipo%> <br>

        <br>
        <%
            if (tipo.equalsIgnoreCase("Usuarios")) {
                List<UsuarioAuto> listaUsuarios = (List) request.getAttribute("listaUsuarios");
                
        %>
        
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Usuario</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UsuarioAuto u : listaUsuarios) {
                %>
                <tr>
                    <td><%= u.getNombre() + " " + u.getApellidos() %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        
        <%
            } else {
                List<Evento> listaEventos = (List) request.getAttribute("listaEventos");
        %>

        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Evento</th>
                    <th>Descripcion</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Evento e : listaEventos) {
                %>
                <tr>
                    <td><%= e.getTitulo()%></td>
                    <td><%= e.getDescripcion() %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <% 
            }
        %>



    </body>
</html>
