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
    </head>
    <body>
        <%
            Usuario u = (Usuario)request.getAttribute("usuario");
            List<Evento> listaEventos = (List)request.getAttribute("listaEventos");
            List<Etiqueta> listaEtiquetas = (List)request.getAttribute("listaEtiquetas");
            List<EtiquetaEvento> listaEtiquetasEventos = (List)request.getAttribute("listaEtiquetasEventos");
            if(u != null) {
                //El usuario esta logueado, mostrar lo que haya que mostrar
                String nombre = u.getNombreUsuario();
                
                if(u.getRol().equals("AUTOREGISTRADO")) {
                    %>
                    <div class="container">
                        <br>
                        <br>
                        <h1 class="center">Bienvenido</h1>
                        <h1 class="center">Estos son los eventos que tenemos para ti!</h1>
                        <br>
                        <br>
                        <div class="center">
                        </div>
                        <br>
                        <hr>
                        <br>
                        <br>

                        <div class="row">
            <%
                for(Evento evento: listaEventos){      
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                
                String fecha = formatter.format(evento.getFechaEvento());
                String fechaLimite = formatter.format(evento.getFechaLimite());
                
            %>
            
             <div class="col-4">
                                <div class="card center border-transparent w-100" onclick="location.href='/ServletEvento?eventoId=<%=evento.getId()%>';"
                                     style="width: 18rem; --levitate-hvr:5;">
                                    <img src="https://www.dodmagazine.es/wp-content/uploads/2020/05/festival-cruilla-barcelona.jpg"
                                         class="card-img-top" alt="1">
                                    <div class="card-body">
                                        <h4><b><%= evento.getTitulo() %></b></h4>
                                        <p class="card-text"><%= evento.getDescripcion() %></p>
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
                }
            }else {
                //El usuario no esta logueado, mostrar las cosas que haya que mostrar
            }
        %>

    </body>
</html>
