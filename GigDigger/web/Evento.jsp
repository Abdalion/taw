<%-- 
    Document   : Evento
    Created on : 11-may-2021, 22:13:33
    Author     : egonb
--%>

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
        %>
        <title><%=evento.getTitulo()%></title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
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
                            <button id="<%=i%>, <%=j%>" class=" btn-dark" onclick="reservar(<%=i%>, <%=j%>)"><%=j%></button>
                            <%
                            }
                        %>
                        </p>
                    <%
                    }
                %>
                <button onclick="enviarReserva()">Reservar los asientos seleccionados</button>
    <script>
            var lista = [];
        function reservar(fila, asiento) {
            elemento = document.getElementById(fila+", "+asiento);
            if(elemento.classList.contains("btn-dark")) {
                elemento.classList.remove("btn-dark");
                elemento.classList.add("btn-success");
                addElementToForm(fila, asiento);
            }else {
                elemento.classList.add("btn-dark");
                elemento.classList.remove("btn-success");
                removeElementFromForm(fila, asiento);
            }
        }
        
        function addElementToForm(fila, asiento) {
            
        }
        
        function removeElementFromForm(fila, asiento) {
            
        }
        
        

    </script>
    </body>
     
</html>
