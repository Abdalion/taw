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
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>

    <%
        Estudio estudio = (Estudio) request.getAttribute("estudio");
        String tipo = estudio.getTipo();
        Usuario u = (Usuario) request.getAttribute("usuario");
    %>

    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <img src="https://i.imgur.com/asll5wB.png" alt="logo gigDigger" height="50px">
                <a class="navbar-brand" href="/">GigDigger</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="/">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="/help">Ayuda</a>

                        <%  if (u != null) {
                                if (u.getRol().equals("ANALISTA")) {
                        %>
                        <a class="nav-item nav-link" href="ServletEstudioListar">Estudios</a>
                        <%
                            }
                        %>

                        <a class="nav-item nav-link" href="ServletPerfil">Mi perfil</a>
                        <a class="nav-item nav-link" href="ServletLogout">Cerrar sesion</a>

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
            <h1 class="center"><b>Estudio <%= estudio.getNombreEstudio()%></b></h1>
            <br>
            <br>

        </div>
        <br>
        <br>

        <div class="container">

            <div class="container">
        
            <h5 class="color-coral"><b>Nombre</b></h5>
            <hr>
            <h5 class="font-weight-normal"><%= estudio.getNombreEstudio()%></h5>
            <br>           
            
            <h5 class="color-coral"><b>Descripción</b></h5>
            <hr>
            <h5 class="font-weight-normal"><%= estudio.getDescripcion()%></h5>
            <br>         
            
            <h5 class="color-coral"><b>Fecha de creación</b></h5>
            <hr>
            <h5 class="font-weight-normal"><%= new SimpleDateFormat("dd/MM/yyyy").format(estudio.getFechaCreacion())%></h5>
            <br>     
            
            <h5 class="color-coral"><b>Tipo</b></h5>
            <hr>
            <h5 class="font-weight-normal"><%= tipo%></h5>
            <br> 
            
        </div>


            <br>
            <%
                if (tipo.equalsIgnoreCase("Usuarios")) {
                    List<UsuarioAuto> listaUsuarios = (List) request.getAttribute("listaUsuarios");

            %>

            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Usuario</th>
                    </tr>
                </thead>
                <tbody>
                    <%                    for (UsuarioAuto ua : listaUsuarios) {
                    %>
                    <tr>
                        <td><%= ua.getNombre() + " " + ua.getApellidos()%></td>
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

            <table class="table table-striped">
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
                        <td><%= e.getDescripcion()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <%
                }
            %>
        </div>


    </body>
</html>
