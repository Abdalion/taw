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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    </head>
    <body>
    <%
        List<Evento> listaEventos = (List)request.getAttribute("listaEventos");
        List<Usuario> listaUsuarios = (List)request.getAttribute("listaUsuarios");
    %>        
        <h1>Lista de usuarios</h1>
        <table >
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
                <td> 
                    <form action="UsuarioEliminar" method="POST">
                    <input name="id" type="hidden" value="<%= usuario.getId() %>">
                    <input type="submit" class="btn btn-danger" value="Eliminar usuario">
                    </form>
                </td>
            </tr>

            
            <%
                }
            %>
            </table>
            <br>
            <input type="submit" value="Crear usuario" onClick="toggleCrearUsuarioForm()"/>
            
            <div id="crearUsuarioDiv">
            <h1>Datos del usuario</h1>
                <form method="post" action="PanelAdministrador" name="crearUsuario" accept-charset="UTF-8">
                    <table>
                        <tr>
                            <td>NOMBRE </td>
                            <td><input type="text" name="name" maxlength="40"/></td>
                        </tr>
                        <tr>
                            <td>CORREO </td>
                            <td><input type="text" name="email" maxlength="40"/></td>
                        </tr>
                        <tr>
                            <td>CONTRASEÑA </td>
                            <td><input type="text" name="password" maxlength="40"/></td>
                        </tr>
                        <tr>
                            <td>ROL (CREADOR/ADMINISTRADOR/TELEOPERADOR)</td>
                            <td><input type="text" name="role" maxlength="40"/></td>
                        </tr>
                    </table>
                <br/>
                    <input type="submit" value="Enviar">
                </form>

            </div>
            
        <h1>Lista de eventos</h1>
        <table>
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
        table{
          border-collapse: collapse;
          width: 30%;
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

<script>
    function toggleCrearUsuarioForm() {
    var x = document.getElementById("crearUsuarioDiv");
    if (x.style.display === "none") {
      x.style.display = "block";
    } else {
      x.style.display = "none";
    }
  }
  toggleCrearUsuarioForm();
</script>
</html>
