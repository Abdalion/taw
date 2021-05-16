<%-- 
    Document   : Perfil
    Created on : 13-may-2021, 18:51:10
    Author     : egonb
--%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.HashMap"%>
<%@page import="gigdigger.entity.Entrada"%>
<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page import="gigdigger.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mi Perfil</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

        <style>
            .container2 {
                display:flex;
                flex-direction:row
            }
        </style>
    </head>
    <body>
        <%
        
                    Usuario u = (Usuario)request.getAttribute("usuario");
                    //if u==nul no hay boton de crear chat ni de ir a chats.

        %>
       
    
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <img src="https://i.imgur.com/asll5wB.png" alt="logo gigDigger" height="50px">
                <a class="navbar-brand" href="/">GigDigger</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="/">Home </a>
                        <a class="nav-item nav-link" href="/help">Ayuda <span class="sr-only">(current)</span></a>

                            <%
                                if(u != null) {
                                    if(u.getRol().equals("ADMINISTRADOR")) {
                                        %>
                        <a class="nav-item nav-link" href="PanelAdministrador">Panel admin</a>
                                        <%
                                    }else if(u.getRol().equals("ANALISTA")) {
                                        %>
                        <a class="nav-item nav-link" href="ServletEstudioListar">Estudios</a>
                                        <%
                                    }
                                %>
                        <a class="nav-item nav-link" href="ServletPerfil">Mi perfil</a>
                        <a class="nav-item nav-link" href="ServletLogout">Cerrar sesion</a>
                                <%
                                }else {
                                    %>
                        <a class="nav-item nav-link" href="ServletAutenticacion">Iniciar sesion</a>
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
            <h1 class="center"><b>Mi Perfil</b></h1>
            <br>
            <br>
            
        </div>
        <div class="container">
        
            <h5 class="color-coral"><b>Nombre de Usuario</b></h5>
            <hr>
            <h5 class="font-weight-normal"><%=u.getNombreUsuario()%></h5>
            <br>           
            
            <h5 class="color-coral"><b>Email</b></h5>
            <hr>
            <h5 class="font-weight-normal"><%=u.getEmail()%></h5>
            <br>         
            
            <h5 class="color-coral"><b>Rol</b></h5>
            <hr>
            <h5 class="font-weight-normal"><%=u.getRol()%></h5>
            <br>                     
            
        </div>
        <%
            if (u == null) {
        %>
        <h1>Algo salió mal.</h1>
        <%
        } else {
        %>
        
        <%
            if (u.getRol().equals("AUTOREGISTRADO")) {
            HashMap<Evento, List<Entrada>> eventosEntradas = (HashMap<Evento, List<Entrada>>) request.getAttribute("eventosEntradas");
        %>
        <h3 class="color-coral center">Eventos en los que tienes reservas</h3>
        <div class="container container2">
        <%
            for (Evento evento : eventosEntradas.keySet()) {
                if(evento.getFechaEvento().after(new Date())) {
                   
        %>
        <div class="col-4">
            <div class="card center border-transparent w-100" onclick="location.href = '/ServletEvento?eventoId=<%=evento.getId()%>';"
                 style="width: 18rem; --levitate-hvr:5;">
                <img src="https://www.dodmagazine.es/wp-content/uploads/2020/05/festival-cruilla-barcelona.jpg"
                     class="card-img-top" alt="1">
                <div class="card-body-ini">
                    <h4><b><%= evento.getTitulo()%></b></h4>
                    <p class="card-text"><%= evento.getDescripcion()%></p>
                                    <h3>Tus entradas:</h3>
            <%
                for(Entrada e : eventosEntradas.get(evento)) {
                    %>
                    Fila: <%=e.getFila()%>
                    Asiento: <%=e.getAsiento()%><br>
                    <%
                }
              }
            %>
                </div>
            </div>

            <br>
        </div>
        <%
            }
        %>
        </div>
        <h3 class="color-coral center">Eventos a los que has asistido</h3>
                <div class="container container2">
                <%
            for (Evento evento : eventosEntradas.keySet()) {
                if(evento.getFechaEvento().before(new Date())) {
                   
        %>
        <div class="col-4">
            <div class="card center border-transparent w-100" onclick="location.href = '/ServletEvento?eventoId=<%=evento.getId()%>';"
                 style="width: 18rem; --levitate-hvr:5;">
                <img src="https://www.dodmagazine.es/wp-content/uploads/2020/05/festival-cruilla-barcelona.jpg"
                     class="card-img-top" alt="1">
                <div class="card-body">
                    <h4><b><%= evento.getTitulo()%></b></h4>
                    <p class="card-text"><%= evento.getDescripcion()%></p>
                                    <h3>Tus entradas:</h3>
            <%
                for(Entrada e : eventosEntradas.get(evento)) {
                    %>
                    Fila: <%=e.getFila()%>
                    Asiento: <%=e.getAsiento()%><br>
                    <%
                }
              }
            %>
                </div>
            </div>

            <br>
        </div>
        <%
            }
        %>
                </div>
        <%
        } else if (u.getRol().equals("ANALISTA")) {
        %>
        <a class="center nav-item nav-link" href="ServletEstudioListar">Estudios</a>
        <%
            }
        %>
        <%
            }
        %>
    </body>
</html>
