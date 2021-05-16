<%-- 
    Document   : Evento
    Created on : 11-may-2021, 22:13:33
    Author     : egonb
--%>

<%@page import="gigdigger.entity.Usuario"%>
<%@page import="gigdigger.entity.Entrada"%>
<%@page import="gigdigger.entity.Etiqueta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.EtiquetaEvento"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="gigdigger.entity.Evento"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            Evento evento = (Evento) request.getAttribute("evento");
            List<Etiqueta> listaEtiquetas = (List) request.getAttribute("listaEtiquetas");
            List<EtiquetaEvento> listaEtiquetasEventos = (List) request.getAttribute("listaEtiquetasEventos");
            Usuario u = (Usuario) request.getAttribute("usuario");

            Integer userId = (Integer) request.getAttribute("userId");
        %>
        <title><%=evento.getTitulo()%></title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
        <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <img src="https://i.imgur.com/asll5wB.png" alt="logo gigDigger" height="50px">
            <a class="navbar-brand" href="/">GigDigger</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="">Home <span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="/help">Ayuda</a>

                    <%                            if (u != null) {
                            if (u.getRol().equals("ADMINISTRADOR")) {
                    %>
                    <a class="nav-item nav-link" href="PanelAdministrador">Panel admin</a>
                    <%
                    } else if (u.getRol().equals("ANALISTA")) {
                    %>
                    <a class="nav-item nav-link" href="ServletEstudioListar">Crear estudio</a>
                    <%
                    } else if (u.getRol().equals("CREADOR")) {
                    %>
                    <a class="nav-item nav-link" href="ServletEventoCrear">Crear evento</a>
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
        <h1 class="center"><b><%=evento.getTitulo()%></b></h1>
        <h2 class="center"><b><%=evento.getDescripcion()%></b></h2>
        <br>
        <br>

    </div>                
    <div class="container">

        <%
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String fecha = formatter.format(evento.getFechaEvento());
            String fechaLimite = formatter.format(evento.getFechaLimite());

        %>
        <div class="center">

        Fecha: <%= fecha%><br>
        Fecha limite: <%= fechaLimite%><br>
        Precio de la entrada: <%= evento.getPrecio()%>€<br>
        Etiquetas:<br>
        <%
            for (EtiquetaEvento etiquetaEvento : listaEtiquetasEventos) {
                if (etiquetaEvento.getIdEvento().getId() == evento.getId()) {

        %>
        #<%= etiquetaEvento.getIdEtiqueta().getEtiqueta()%><br>
        <%
                }
            }
        %>


        Aforo: <%= evento.getAforo()%><br>
        Limite de compra: <%= evento.getLimiteUsuario()%><br>
        </div>
        <%
            if (u != null) {
                if (u.getRol().equalsIgnoreCase("AUTOREGISTRADO")) {
        %>
        <h2>Reserva de entradas</h2>
        Elige los asientos:<br><br>
        (Escenario)
        <%
            //TODO: Los ya reservados los marcamos en gris
            int asientoId = 0;
            for (int i = 1; i <= evento.getNFilas(); i++) {
        %>
        <p>
            <%
                for (int j = 1; j <= evento.getNAsientosFila(); j++) {
            %>
            <button id="<%=i%>,<%=j%>" class=" btn-dark" onclick="reservar(<%=i%>,<%=j%>)"><%=j%></button>
            <%
                }
            %>
        </p>
        <%
            }
        %>
        <form id="reservasForm" method="post" action="/ServletCrearReserva">
            <input type="hidden" name="eventoId" value="<%=evento.getId()%>">
            <input class="center" type="submit" value="Reservar los asientos seleccionados">
        </form>
        <%

                }
            }
        %>
    </div>
    <script>
        var lista = [];
        var reservasTotales = 0;
        var cantidadAReservar = 0;
        var yaReservadasPorElUsuario = 0;
        <%
            List<Entrada> entradas = (List<Entrada>) request.getAttribute("entradas");
            if (entradas != null) {
                for (Entrada e : entradas) {
                    if (e.getIdUsuario().getId().equals(userId)) {
        %>
        yaReservadasPorElUsuario++;
        <%
            }

        %>
        disableNoDisponible("<%=e.getFila()%>", "<%=e.getAsiento()%>");
        <%
                }
            }
            if (entradas != null) {
        %>
        reservasTotales = <%=entradas.size()%>;
        <%
            }
        %>
            var aforo = <%=evento.getAforo()%>;

        function reservar(fila, asiento) {
            elemento = document.getElementById(fila + "," + asiento);
            if (elemento.classList.contains("btn-dark")) {
                if (reservasTotales >= aforo) {
                    alert("No se pueden realizar mas reservas dado que el aforo ha sido superado.");
                    } else if (cantidadAReservar + yaReservadasPorElUsuario >= <%=evento.getLimiteUsuario()%>) {
                        alert("Este evento solo permite realizar <%=evento.getLimiteUsuario()%> reservas por usuario.");
                } else {
                    elemento.classList.remove("btn-dark");
                    elemento.classList.add("btn-success");
                    addElementToForm(fila, asiento);
                }
            } else {
                elemento.classList.add("btn-dark");
                elemento.classList.remove("btn-success");
                removeElementFromForm(fila, asiento);
            }
        }

        function addElementToForm(fila, asiento) {
            var form = document.getElementById("reservasForm");
            var input = document.createElement("INPUT");
            input.setAttribute("id", "input-" + fila + "," + asiento);
            input.setAttribute("name", "entrada");
            input.setAttribute("type", "hidden");
            input.setAttribute("value", fila + "," + asiento);
            form.appendChild(input);
            reservasTotales++;
            cantidadAReservar++;
        }

        function removeElementFromForm(fila, asiento) {

            var form = document.getElementById("reservasForm");
            var input = document.getElementById("input-" + fila + "," + asiento);
            form.removeChild(input);
            reservasTotales--;
            cantidadAReservar--;
        }

        function disableNoDisponible(fila, asiento) {
            elemento = document.getElementById(fila + "," + asiento);
            elemento.setAttribute("disabled", true);
        }



    </script>
</body>

</html>
