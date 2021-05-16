<%-- 
    Document   : chatTeleoperadorVF
    Created on : 08-may-2021, 17:13:37
    Author     : jesus
--%>

<%@page import="gigdigger.entity.Usuario"%>
<%@page import="gigdigger.entity.Mensaje"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gigdigger.entity.Chat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vista Chat Teleoperador</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
    </head>
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
            <h1 class="center"><b>Chats del teleoperador</b></h1>
            <br>
            <br>
            
        </div>
        
        
        
        
        
        <%
            Boolean error = (Boolean) session.getAttribute("error");
            Usuario user = (Usuario) session.getAttribute("usuario");
            if(error == true){
                 %>
                
                 <h2 class="center"> Ha ocurrido un error</h2>
                <br/>
                <p class="center">El usuario que ha hecho el post no es teleoperador</p>
                
                <%   
            } else {
                Chat chat = (Chat) session.getAttribute("chat");
                ArrayList<Chat> chats = (ArrayList)session.getAttribute("chats");
             

%>
             
                <div class="row">
                    
                    <div class="col-3"> 
                        
                        <h3 class="color-coral center"><b>Conversaciones</b></h3>
                        <hr>
                        <%
                        for(Chat c : chats){
                        %>
                        <div class="container">
                            
                        <h4><b><%=c.getIdUsuario().getNombreUsuario()%></b></h4>
                        <p>Notificaciones: <%=c.getNotificaciones()%></p>
                        <a class="btn btn-primary" href="ServletChatTeleoperador?idUser=<%=user.getId()%>&idChat=<%=c.getId()%>">Entrar al chat</a>
                            
                        </div>
                        
                        <hr>
                        <%    
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
                            <form name="crearMensaje" action="NewChat?idUser=<%=chat.getIdUsuario().getId()%>" method="POST">
                                <div class="form-group">
                                    <label for="message">Mensaje: </label>
                                    <textarea id="message" class="form-control" name="message" rows="3" type="text"></textarea>
                                </div>
                                <br>
                                <input type="submit" value="Enviar" class="btn btn-primary">
                            </form>
                        </div>
                        
                    </div>
                        
                         
                    
                    
                </div>
                
                
           
            
                <%
                    }

            }
        %>
         
    </body>
</html>
