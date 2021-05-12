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
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/styles.css" rel="stylesheet" type="text/css">
    </head>
    <%
            Boolean error = (Boolean) session.getAttribute("error");
            
                 %>
                 
    <body>
        <%
            if(error == true){
                
          %>
          
         <h1> No hay teleoperadores disponibles</h1>
                <br/>
                <p>Puedes intentarlo más tarde</p> 
        <%
             }else{   
                Chat chat = (Chat) session.getAttribute("chat");
                Usuario tele = chat.getIdTeleoperador();
                String nombreTele = tele.getNombreUsuario();
                List<Mensaje> mensajes = chat.getMensajeList();
    
            %>
            <h1>Estás hablando con <%=nombreTele%></h1>
            
            <%
                for(Mensaje m : mensajes){
                       if(m.getIdEmisor()==chat.getIdTeleoperador()){
                %>
                
                <div class="bg-light">
                            
                            <p>IDmensaje: <%=m.getId()%><p>
                            <p>Texto : <%=m.getTexto()%></p>
                            <p>Fecha : <%=m.getFecha()%> | Hora : <%=m.getHora()%></p>
                </div>
                            
                            <br>
                            
            <%
                 }else{
             %>
             <p class="text-end">IDmensaje: <%=m.getId()%><p>
             <p class="text-end">Texto : <%=m.getTexto()%></p>
             <p class="text-end">Fecha : <%=m.getFecha()%> | Hora : <%=m.getHora()%></p>                        
                
            <% 
                }
            }
%>                  
                <form method="POST" action="NewChat?idUser=<%=chat.getIdUsuario().getId()%>">
                    <label>idChat</label>
                    <input id="idChat" type="text" name="idChat" placeholder="id" value="2">
                    
                    <label>idUsuario</label>
                    <input id="idUsuario" type="text" name="idUsuario" placeholder="id" value="2">
                    <label for="message"><p>Nuevo mensaje</p></label>
                        <br>
                        <textarea id="message" class="form-control" name="message" rows="3" type="text" placeholder="Escribe tu mensaje aqui..."></textarea>
                        <br>
                    <input type="button" value="Enviar">
                </form>
<a href="/ServletFinChat?idChat=<%=chat.getId()%>">Finalizar Chat</a>
<%
}
                %>
          
    </body>
</html>
