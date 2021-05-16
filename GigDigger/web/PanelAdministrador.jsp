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
        <title>GigDigger</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
        <link href="https://i.imgur.com/asll5wB.png" rel="icon">
        

    </head>
    <body>
    <%
        List<Evento> listaEventos = (List)request.getAttribute("listaEventos");
        List<Usuario> listaUsuarios = (List)request.getAttribute("listaUsuarios");
        Usuario u = (Usuario) request.getAttribute("usuario");       
    %> 
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <img src="https://i.imgur.com/asll5wB.png" alt="logo gigDigger" height="50px">
                <a class="navbar-brand" href="">GigDigger</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="/">Home </a>
                        <a class="nav-item nav-link" href="/help">Ayuda</a>

                        <%                            if (u != null) {
                                if (u.getRol().equals("ADMINISTRADOR")) {
                        %>
                        <a class="nav-item nav-link" href="PanelAdministrador">Panel admin</a>
                        <%
                        } else if (u.getRol().equals("ANALISTA")) {
                        %>
                        <a class="nav-item nav-link" href="ServletEstudioListar">Estudios</a>
                        <%
                        } else if (u.getRol().equals("CREADOR")) {
                        %>
                        <a class="nav-item nav-link" href="ServletEventoCrear">Crear evento</a>
                        <%
                            }
                        %>
                        <a class="nav-item nav-link" href="ServletPerfil">Mi perfil</a>
                        <a class="nav-item nav-link" href="ServletLogout">Cerrar sesión</a>

                        <%
                        } else {
                        %>
                        <a class="nav-item nav-link" href="ServletAutenticacion">Iniciar sesión</a>
                        <a class="nav-item nav-link" href="ServletRegistro">Registrarse</a>
                        <%
                            }

                        %>



                    </div>
                </div>

            </div>

        </nav>
        
        <div class="bg-coral">
                                
            
            <br>
            <br>
            <h1 class="center"><b>Panel de administrador</b></h1>
            <br>
            <br>
            
                 
        </div>
        <br>
        <br>
        <div class="container">
            

        <h1>Lista de usuarios</h1>

        <table class="table table-striped">
            <thead class="thead-dark">
            <tr >
              <th scope="col">USUARIO</th>
              <th scope="col">ROLES</th>
            </tr>
            <%
                for(Usuario usuario: listaUsuarios){                  
            %>
            </thead>
            <tbody>
            <tr>
                <td><%= usuario.getNombreUsuario() %></td>
                <td><%= usuario.getRol() %></td>
                <td> 
                    <form action="UsuarioEliminar" method="POST">
                    <input name="id" type="hidden" value="<%= usuario.getId() %>">
                    <input type="submit" class="btn btn-danger center" value="Eliminar usuario">
                    </form>
                </td>
            </tr>
            
            
            <%
                }
            %>
            </tbody>
            </table>
            <br>
            <input type="submit" value="Crear usuario" onClick="toggleCrearUsuarioForm()"/>
            
            <div id="crearUsuarioDiv">
            <h1>Datos del usuario</h1>
                <form method="post" action="PanelAdministrador" name="crearUsuario" accept-charset="UTF-8">
                        <table class="table table-striped">
                        <tr>
                            <td>NOMBRE </td>
                            <td><input type="text" name="name" maxlength="100"/></td>
                        </tr>
                        <tr>
                            <td>CORREO </td>
                            <td><input type="text" name="email" maxlength="100"/></td>
                        </tr>
                        <tr>
                            <td>CONTRASEÑA </td>
                            <td><input type="text" name="password" maxlength="100"/></td>
                        </tr>
                        <tr>
                            <td>ROL (CREADOR/ADMINISTRADOR/TELEOPERADOR)</td>
                            <td><input type="text" name="role" maxlength="100"/></td>
                        </tr>
                    </table>
                <br/>
                    <input type="submit" value="Enviar">
                </form>

            </div>
            </div>
        
            <div class="center">
        <h1>Lista de eventos</h1>

        <table class="table table-striped">
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
        </table>
        </div>
         </div>
                </div>
                                </div>
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
        
        .center {
            margin: auto;
            width: 50%;
            padding: 10px;
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
