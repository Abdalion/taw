<%-- 
    Document   : chatTerminado
    Created on : 14-may-2021, 17:18:28
    Author     : Usuario
--%>

<%@page import="gigdigger.entity.Mensaje"%>
<%@page import="gigdigger.entity.Chat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Chat chat = (Chat) request.getAttribute("chat");
        %>
    <body>
        <h1>Chats concluido de <%=chat.getIdTeleoperador().getNombreUsuario()%> con <%=chat.getIdTeleoperador().getNombreUsuario()%> </h1>
        
        <%
            for(Mensaje m : chat.getMensajeList()){
               if(m.getIdEmisor().equals(chat.getIdTeleoperador())){ 
            %>
            <p class="text-end">IDmensaje: <%=m.getId()%><p>
            <p class="text-end">Texto : <%=m.getTexto()%></p>
            <p class="text-end">Fecha : <%=m.getFecha()%> | Hora : <%=m.getHora()%></p>
        <%
            }else{
            %>
        <div class="bg-light">
                            
            <p>IDmensaje: <%=m.getId()%><p>
            <p>Texto : <%=m.getTexto()%></p>
            <p>Fecha : <%=m.getFecha()%> | Hora : <%=m.getHora()%></p>
        </div>            
    
                            
        <%
            }
        }
        %>
    </body>
</html>
