<%-- 
    Document   : listaChats
    Created on : 12-may-2021, 23:46:30
    Author     : Usuario
--%>

<%@page import="gigdigger.entity.Mensaje"%>
<%@page import="gigdigger.entity.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gigdigger.entity.Chat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vista Historial Chat Teleoperador</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>
    <%
        List<Chat> listaChats = (ArrayList<Chat>) request.getAttribute("listaChats");
        Usuario usuario = (Usuario) request.getAttribute("usuario");
        Boolean hayChat = (Boolean) request.getAttribute("hayChat");
        Chat chat;
        if(hayChat){
            chat = (Chat) request.getAttribute("chat");
        } else {
            chat = null;
        }
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
        
        <div class="bg-coral">
                                
            
            <br>
            <br>
            <h1 class="center"><b>Historial de chats de <%=usuario.getNombreUsuario()%></b></h1>
            <br>
            <br>
            
        </div>
        
        <br/>
        
        <div class="row">
                    
                    <div class="col-3"> 
                        <h3 class="color-coral center"><b>Conversaciones</b></h3>
                        <hr>
                        
                        <%
                            for(Chat c:listaChats){

                                if(c.getFechaFin()!=null){
                            %>
                    <div class="container">
                            <h4><b><%=c.getIdUsuario().getNombreUsuario()%></b></h4>
                            <h5 class="font-weight-normal">Le atendió: <b><%=c.getIdTeleoperador().getNombreUsuario()%></b></h5>
                            <a class="btn btn-primary" href="ServletListarChats?idChat=<%=c.getId()%>&idUser=<%=c.getIdUsuario().getId()%>">Entrar al chat</a>
                    </div>
                            <hr>
                        <% 
                            }
                        }
                        %>
                        
                    </div>
                    <div class="col-9">
                            
                        <%
                        if(chat==null){
                            
                        
                        %>
                        
                        <br>
                        <br>
                        <h2 class="color-coral center"><b>Selecciona un Chat primero</b></h2>
                        
                        <%
                        }else{
                        %>
                        <h3 class="color-coral center"><b>Chat con <%=chat.getIdUsuario().getNombreUsuario()%></b></h3>
                        <hr>
                        <div class="container-sm">
                        <%
                        ArrayList<Mensaje> mensajes = new ArrayList<Mensaje>(chat.getMensajeList());
                        
                        for(Mensaje m : mensajes){
                            if(m.getIdEmisor()==chat.getIdUsuario()){
                                %>
                        <!--Mensaje es del usuario se coloca a la izq-->
                        
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
                                
                                
                            } else {
                                %>
                        <!--Mensaje es del teleopera se coloca a la der-->
                        
                      
                        
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
}
                        %>    
                        
                            
                    </div>
                        
                        
                        
                        
                        
                        
                        
        </div>
        
        
    </body>
</html>
