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
        <table style="width:30%">
            <tr>
              <th>USUARIO</th>
              <th>ROLES</th>
            </tr>


            <%
                for(Usuario usuario: listaUsuarios){                  
            %>
            
            <tr>
                <td><%= usuario.getNombreUsuario() %></td>
                <td><%= usuario.getRol() %></td>
            </tr>

            
            <%
                }
            %>
            </table>
            <br>
            <input type="submit" value="Crear usuario" action="UsuarioCrear.jsp"/>
        <h1>Lista de eventos</h1>
        <table style="width:30%">
            <tr>
              <th>TITULO</th>
              <th>DESCRIPCION</th>
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
    </body>
    
    
    <style>
        body {
          font-family: arial, sans-serif;
        }
        table {
          border-collapse: collapse;
          width: 100%;
        }

        td, th {
          border: 1px solid #dddddd;
          text-align: left;
          padding: 8px;
        }

        tr:nth-child(even) {
          background-color: #dddddd;
        }
</style>
</html>
