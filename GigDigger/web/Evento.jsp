<%-- 
    Document   : Evento
    Created on : 11-may-2021, 22:13:33
    Author     : egonb
--%>

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
            Evento evento = (Evento)request.getAttribute("evento");
        List<Etiqueta> listaEtiquetas = (List)request.getAttribute("listaEtiquetas");
        List<EtiquetaEvento> listaEtiquetasEventos = (List)request.getAttribute("listaEtiquetasEventos");
        
        Integer userId = (Integer)request.getAttribute("userId");
        %>
        <title><%=evento.getTitulo()%></title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>
    <body  class = "center">
        <h1>Evento: <%=evento.getTitulo()%></h1>
        <%
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                String fecha = formatter.format(evento.getFechaEvento());
                String fechaLimite = formatter.format(evento.getFechaLimite());
                
            %>
            
            Titulo: <%= evento.getTitulo() %><br>
            Descripcion: <%= evento.getDescripcion() %></br>
            Fecha: <%= fecha %><br>
            Fecha limite: <%= fechaLimite %><br>
            Precio de la entrada: <%= evento.getPrecio() %>€<br>
            Etiquetas:<br>
                <%
                    for(EtiquetaEvento etiquetaEvento: listaEtiquetasEventos){
                        if(etiquetaEvento.getIdEvento().getId() == evento.getId()){
                        
                %>
                #<%= etiquetaEvento.getIdEtiqueta().getEtiqueta() %><br>
                <%
                        }
                    }
                %>
                
                
                Aforo: <%= evento.getAforo() %><br>
                Limite de compra: <%= evento.getLimiteUsuario() %><br>

                
                <h2>Reserva de entradas</h2>
                Elige los asientos:<br><br>
                (Escenario)
                <%
                    //TODO: Los ya reservados los marcamos en gris
                    int asientoId = 0;
                    for(int i = 1; i <= evento.getNFilas() ; i++) {
                    %>
                    <p>
                        <%
                            for(int j = 1; j <= evento.getNAsientosFila(); j++) {
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
    <script>
            var lista = [];
            var reservasTotales = 0;
            var cantidadAReservar = 0;
            var yaReservadasPorElUsuario = 0;
            <%
                List<Entrada> entradas = (List<Entrada>)request.getAttribute("entradas");
                if(entradas != null) {
                    for(Entrada e : entradas) {
                        if(e.getIdUsuario().getId().equals(userId)) {
                            %>
                                yaReservadasPorElUsuario++;
                            <%
                        }
                        
                        %>
                          disableNoDisponible("<%=e.getFila()%>", "<%=e.getAsiento()%>");  
                        <%
                    }
                }
                if(entradas != null) {   
                    %>
                reservasTotales = <%=entradas.size()%>;
            <%
                }
            %>
            var aforo = <%=evento.getAforo()%>;
            
        function reservar(fila, asiento) {
                elemento = document.getElementById(fila+","+asiento);
                if(elemento.classList.contains("btn-dark")) {
                    if(reservasTotales >= aforo) {
                        alert("No se pueden realizar mas reservas dado que el aforo ha sido superado.");
                    }else if(cantidadAReservar+yaReservadasPorElUsuario >= <%=evento.getLimiteUsuario()%>){
                        alert("Este evento solo permite realizar <%=evento.getLimiteUsuario()%> reservas por usuario.");
                    }else {
                        elemento.classList.remove("btn-dark");
                        elemento.classList.add("btn-success");
                        addElementToForm(fila, asiento);                        
                    }
                }else {
                    elemento.classList.add("btn-dark");
                    elemento.classList.remove("btn-success");
                    removeElementFromForm(fila, asiento);
            }
        }
        
        function addElementToForm(fila, asiento) {
         var form = document.getElementById("reservasForm");
         var input = document.createElement("INPUT");
         input.setAttribute("id", "input-"+fila+","+asiento);
         input.setAttribute("name","entrada");
         input.setAttribute("type", "hidden");
         input.setAttribute("value", fila+","+asiento);
         form.appendChild(input);
         reservasTotales++;
         cantidadAReservar++;
        }
        
        function removeElementFromForm(fila, asiento) {

         var form = document.getElementById("reservasForm");
         var input = document.getElementById("input-"+fila+","+asiento);
         form.removeChild(input);
         reservasTotales--;
         cantidadAReservar--;
        }
        
        function disableNoDisponible(fila, asiento) {
            elemento = document.getElementById(fila+","+asiento);
            elemento.setAttribute("disabled", true);
        }
        
        

    </script>
    </body>
     
</html>
