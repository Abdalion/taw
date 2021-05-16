<%-- 
    Document   : Perfil
    Created on : 13-may-2021, 18:51:10
    Author     : egonb
--%>

<%@page import="java.util.HashMap"%>
<%@page import="gigdigger.entity.Entrada"%>
<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page import="gigdigger.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

        <style>
            .container {
                display:flex;
                flex-direction:row
            }
        </style>
    </head>
    <body>
        <%
            Usuario u = (Usuario) request.getAttribute("usuario");
            if (u == null) {
        %>
        <h1>Algo salió mal.</h1>
        <%
        } else {
        %>
        <h1 class="center">Hola, <%=u.getNombreUsuario()%></h1>
        <%
            if (u.getRol().equals("AUTOREGISTRADO")) {
            HashMap<Evento, List<Entrada>> eventosEntradas = (HashMap<Evento, List<Entrada>>) request.getAttribute("eventosEntradas");
        %>
        <h2 class="center">Eventos en los que tienes reservas</h2>
        <div class="container">
        <%
            for (Evento evento : eventosEntradas.keySet()) {
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
            %>
                </div>
            </div>

            <br>
        </div>
        <%
            }
        %>
        </div>
        <h2 class="center">Eventos a los que has asistido</h2>
        <%
        } else if (u.getRol().equals("ANALISTA")) {
        %>
        <a class="nav-item nav-link" href="ServletEstudioListar">Estudios</a>
        <%
            }
        %>
        <%
            }
        %>
    </body>
</html>
