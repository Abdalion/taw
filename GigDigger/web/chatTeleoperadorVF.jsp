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
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/styles.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            Boolean error = (Boolean) session.getAttribute("error");
            Usuario user = (Usuario) session.getAttribute("usuario");
            if(error == true){
                 %>
                
                <h1> Ha ocurrido un error</h1>
                <br/>
                <p>El usuario que ha hecho el post no es teleoperador</p>
                
                <%   
            } else {
                Chat chat = (Chat) session.getAttribute("chat");
                ArrayList<Chat> chats = (ArrayList)session.getAttribute("chats");
             

%>
             
                <h1>Chats del teleoperador</h1>
                <hr>
                <div class="row">
                    
                    <div class="col-4">  
                        <%
                        for(Chat c : chats){
                        %>
                        
                        <h4><%=c.getIdUsuario().getNombreUsuario()%></h4>
                        <p>Notificaciones: <%=c.getNotificaciones()%></p>
                        <a href="ServletChatTeleoperador?idUser=<%=user.getId()%>&idChat=<%=c.getId()%>">Entrar al chat</a>
                        <hr>
                        <%    
                        }
                        %>
                        
                    </div>
                    <div class="col-8">
                        
                        <%
                        if(chat==null){
                            
                        
                        %>
                        
                        Selecciona un Chat primero
                        
                        <%
                            }else{
                        %>
                <h2>Chat con <%=chat.getIdUsuario().getNombreUsuario()%></h2>
                        <hr>
                        
                        <%
                        ArrayList<Mensaje> mensajes = new ArrayList<Mensaje>(chat.getMensajeList());
                        
                        for(Mensaje m : mensajes){
                            if(m.getIdEmisor()==chat.getIdUsuario()){
                                %>
                        <!--Mensaje es del usuario se coloca a la izq-->
                        
                        <div class="bg-light">
                            
                            <p>IDmensaje: <%=m.getId()%><p>
                            <p>Texto : <%=m.getTexto()%></p>
                            <p>Fecha : <%=m.getFecha()%> | Hora : <%=m.getHora()%></p>
                        </div>
                            
                            <br>
                        
                        
                        <%
                                
                                
                            } else {
                                %>
                        <!--Mensaje es del teleopera se coloca a la der-->
                        
                      
                        
                        <p class="text-end">IDmensaje: <%=m.getId()%><p>
                        <p class="text-end">Texto : <%=m.getTexto()%></p>
                        <p class="text-end">Fecha : <%=m.getFecha()%> | Hora : <%=m.getHora()%></p>
                        
                        
                        <%
                            }
                        }
                        %>
                        
                        
                        
                        
                                                
                        
                        
                    </div>
                        
                         <form name="crearMensaje" action="ServletChatTeleoperador?idUser=<%=chat.getIdUsuario().getId()%>" method="POST">
                    <label>idChat</label>
                    <input id="idChat" type="text" name="idChat" placeholder="id" value="2">
                    
                    <label>idUsuario</label>
                    <input id="idUsuario" type="text" name="idUsuario" placeholder="id" value="2">
                    <label for="message"><p>Nuevo mensaje</p></label>
                        <br>
                        <textarea id="message" class="form-control" name="message" rows="3" type="text" placeholder="Escribe tu mensaje aqui..."></textarea>
                        <br>
                    <input type="submit" value="Enviar">
                </form>
                    
                    
                </div>
                
                
           
            
            <a href="/ServletFinChat?idChat=<%=chat.getId()%>">Finalizar Chat</a>
                <%
                    }

            }
        %>
         
    </body>
</html>
