<%-- 
    Document   : Main
    Created on : 11-may-2021, 21:38:22
    Author     : egonb
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="gigdigger.entity.EtiquetaEvento"%>
<%@page import="gigdigger.entity.Etiqueta"%>
<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page import="gigdigger.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GigDigger</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>
    <body>
        <%
            Usuario u = (Usuario) request.getAttribute("usuario");
            List<Evento> listaEventos = (List) request.getAttribute("listaEventos");
            List<Etiqueta> listaEtiquetas = (List) request.getAttribute("listaEtiquetas");
            List<EtiquetaEvento> listaEtiquetasEventos = (List) request.getAttribute("listaEtiquetasEventos");

            /*
             */
            //if(u != null) {
            //El usuario esta logueado, mostrar lo que haya que mostrar
            // String nombre = u.getNombreUsuario();
            //if(u.getRol().equals("AUTOREGISTRADO")) {
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
                        <a class="nav-item nav-link active" href="">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="/help">Ayuda</a>

                        <%                                if (u != null) {
                                if (u.getRol().equals("ADMINISTRADOR")) {
                        %>
                        <a class="nav-item nav-link" href="PanelAdministrador">Panel admin</a>
                        <%
                        } else if (u.getRol().equals("ANALISTA")) {
                        %>
                        <a class="nav-item nav-link" href="ServletEstudioListar">Estudios</a>
                        <%
                            }
                        %>
                        <a class="nav-item nav-link" href="ServletPerfil">Mi perfil</a>
                        <a class="nav-item nav-link" href="ServletLogout">Cerrar sesion</a>
                        <%
                        } else {
                        %>
                        <a class="nav-item nav-link" href="ServletAutenticacion">Iniciar sesion</a>
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
            <h1 class="center"><b>Bienvenido a GigDigger</b></h1>
            <h1 class="center"><b>¡Estos son los eventos que tenemos para ti!</b></h1>
            <br>
            <br>

        </div>                
        <div class="container">



            <br>
            <br>

            <div class="row">
                <%                for (Evento evento : listaEventos) {
                        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

                        String fecha = formatter.format(evento.getFechaEvento());
                        String fechaLimite = formatter.format(evento.getFechaLimite());

                %>

                <div class="col-4">
                    <div class="card center border-transparent w-100" onclick="location.href = '/ServletEvento?eventoId=<%=evento.getId()%>';"
                         style="width: 18rem; --levitate-hvr:5;">
                        <img src="https://www.dodmagazine.es/wp-content/uploads/2020/05/festival-cruilla-barcelona.jpg"
                             class="card-img-top" alt="1">
                        <div class="card-body-ini">
                            <h4><b><%= evento.getTitulo()%></b></h4>
                            <p class="card-text"><%= evento.getDescripcion()%></p>
                        </div>
                    </div>
                    <br>
                </div>


                <%
                    }
                %>
            </div>
        </div>
        <%
            //}
            // }else {
            //El usuario no esta logueado, mostrar las cosas que haya que mostrar
                        //}
%>

    </body>
</html>
