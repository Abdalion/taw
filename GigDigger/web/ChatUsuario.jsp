<%-- 
    Document   : ChatUsuario
    Created on : 23-abr-2021, 11:08:10
    Author     : Usuario
--%>

<%@page import="gigdigger.entity.Usuario"%>
<%@page import="gigdigger.entity.Chat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="gigdigger.entity.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>
    <%
            Boolean error = (Boolean) session.getAttribute("error");
            
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
                        <a class="nav-item nav-link active" href="/">Home </a>
                        <a class="nav-item nav-link" href="/help">Ayuda <span class="sr-only">(current)</span></a>
                    </div>
                </div>
                        
            </div>
            
        </nav>
        
        <%
            if(error == true){
                
          %>
          
        <div class="bg-coral">
                                
            
            <br>
            <br>
            <h1 class="center"><b>Ayuda>Chat</b></h1>
            <br>
            <br>
            
        </div>
          <br>
          <br>
        <h4 class="center"> No hay teleoperadores disponibles</h4>
        <br/>
        <h3 class="center">Puedes intentarlo más tarde</h3> 
        <%
             }else{   
                Chat chat = (Chat) session.getAttribute("chat");
                Usuario tele = chat.getIdTeleoperador();
                String nombreTele = tele.getNombreUsuario();
                ArrayList<Mensaje> mensajes;
                Integer idCh = chat.getId();
                try{
                    mensajes = chat.getMensajeList();
                } catch (NullPointerException e){
                    mensajes = new ArrayList<Mensaje>();
                }
    
            %>
            
            <div class="bg-coral">
                                
            
            <br>
            <br>
            <h1 class="center"><b>Ayuda> Estás hablando con <%=nombreTele%></b></h1>
            <br>
            <br>
            
            </div>
            <div class="container">
                <br>
                <br>
            <%
                for(Mensaje m : mensajes){
                       if(m.getIdEmisor()==chat.getIdTeleoperador()){
                %>
                
                
                
                <div class="card w-75">
                    <div class="card-body">
                        <p class="card-text"><%=m.getTexto()%></p>
                    </div>
                    <div class="card-footer text-muted">
                            <%=m.fechaToString()%> | <%=m.horaToString()%>
                    </div>
                </div>
                            
                <br>
                            
            <%
                 }else{
             %>
             
                    <div class="card w-75 a-Derecha">
                        <div class="card-body">
                            <p class="card-text"><%=m.getTexto()%></p>

                        </div>
                            <div class="card-footer text-muted">
                                <%=m.fechaToString()%> | <%=m.horaToString()%>
                        </div>
                    </div>
             
             
             <br>                
                
            <% 
                }
            }
%>                  
                    </div>
                    <br>
                    <br>
                    <div class="center">
                        <a class="btn btn-danger center" href="/ServletFinChat?idChat=<%=chat.getId()%>">Finalizar Chat</a>

                    </div>
                    <hr>
                    <div class="container">
                        
                        <form name="crearMensaje" action="NewChat?idUser=<%=chat.getIdUsuario().getId()%>&idChat=<%=chat.getId()%>" method="POST">
                            <div class="form-group">
                                <label for="message">Mensaje: </label>
                                <textarea id="message" class="form-control" name="message" rows="3" type="text"></textarea>
                            </div>
                            <br>
                            <input type="submit" value="Enviar" class="btn btn-primary">
                        </form>
                    <button onClick="window.location.reload();">Actualizar</button>

                        
                    </div>
                            <br>
                            <br>
                    
                    
                    
<%
}
                %>
          
    </body>
</html>
