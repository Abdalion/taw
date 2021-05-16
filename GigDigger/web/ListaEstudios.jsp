<%-- 
    Document   : eventos_list
    Created on : 18-abr-2021, 19:05:50
    Author     : ruben
--%>

<%@page import="gigdigger.entity.Usuario"%>
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
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
        <link href="https://i.imgur.com/asll5wB.png" rel="icon">

        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            ∫</style>

    </head>

    <%
        List<Estudio> listaEstudios = (List) request.getAttribute("listaEstudios");
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
            <h1 class="center"><b>Listado de Estudios</b></h1>
            <br>
            <br>

        </div>        
        <div class="container">
            <br>
            <br>              
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Fecha de creación</th>
                        <th scope="col">Tipo</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>

                    </tr>
                </thead>

                <tbody>

                    <%                for (Estudio estudio : listaEstudios) {
                            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

                            String fecha = formatter.format(estudio.getFechaCreacion());
                    %>

                    <tr>
                        <td><%= estudio.getNombreEstudio()%></td>
                        <td><%= estudio.getDescripcion()%></td>
                        <td><%= fecha%></td>
                        <td><%= estudio.getTipo()%></td>

                        <td><a href="ServletEstudioMostrar?id=<%= estudio.getId()%>">Ver estudio</a></td>
                        <td><a href="ServletEstudioCopia?id=<%= estudio.getId()%>">Hacer Copia</a></td>
                        <td><a href="ServletEstudioEliminar?id=<%= estudio.getId()%>">Eliminar</a></td>

                    </tr>

                    <%
                        }
                    %>
                </tbody>  
            </table>
            <br>
            <div class="center">
                <a href="ServletEstudioCrear" class="btn btn-primary">Nuevo estudio</a>
            </div>
        </div>
    </body>
</html>
