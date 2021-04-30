<%-- 
    Document   : chatTeleopera
    Created on : 19-abr-2021, 13:49:41
    Author     : jesus
--%>
<%@page import="gigdigger.entity.Mensaje"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gigdigger.entity.Chat"%>
<%@page import="gigdigger.servlet.NewChat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat teleoperador</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/styles.css" rel="stylesheet" type="text/css">

    </head>
    <%
    ArrayList<Mensaje> listaMensajes = (ArrayList)session.getAttribute("mensajes");
    
    %>
    <body>
        <br>
        <h1 class="center">Página chat (v.alpha 0.1)</h1>
        <hr>
        <div class="row">
            <div class="col-4 chat-border">
                <h4 class="center">Conversaciones</h4>
                <p>ninguna ahora mismo brode no ralles</p>



            </div>
            <div class="col-8">
                <h4 class="center">Chat con fulanito</h4>
                <hr>
                <div id="content">
                <%

                   for(Mensaje men : listaMensajes){
                  %>


                      <p>IDChat: <%=men.getIdChat()%> | IDmensaje: <%=men.getId()%> | IDEmisor: <%=men.getIdEmisor()%> | Texto : <%=men.getTexto()%> | Fecha : <%=men.getFecha()%> | Hora : <%=men.getHora()%></p>

                  

                  <%
                   } 

                %>
                </div>
                <hr>
                <br>
                
                
                <div>
                    <label>idChat</label>
                    <input id="idChat" type="text" name="id" placeholder="id" value="2">
                    
                    <label>idUsuario</label>
                    <input id="idUsuario" type="text" name="id" placeholder="id" value="2">
                    
                    <label for="texto"><p>Nuevo mensaje</p></label>
                        <br>
                        <textarea id="texto" class="form-control" name="texto" rows="3" type="text" placeholder="Escribe tu mensaje aqui..."></textarea>
                        <br>
                    <input type="button" onclick="postMessage();" value="Enviar">
                </div>
            </div>

        </div>
        <script>
            function postMessage() {
                var xmlhttp = new XMLHttpRequest();
                //xmlhttp.open("POST", "shoutServlet?t="+new Date(), false);
                xmlhttp.open("POST", "NewChat", false);
                xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                var idChat = escape(document.getElementById("idChat").value);
                var idUsuario = escape(document.getElementById("idUsuario").value);
                var texto = escape(document.getElementById("texto").value);
                document.getElementById("texto").value = "";
                xmlhttp.send("idChat="+idChat+"&idUser="+idUsuario+"&texto="+texto);
            }
            var messagesWaiting = false;
            function getMessages(){
                if(!messagesWaiting){
                    messagesWaiting = true;
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange=function(){
                        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                            messagesWaiting = false;
                            var contentElement = document.getElementById("content");
                            contentElement.innerHTML = xmlhttp.responseText + contentElement.innerHTML;
                        }
                    }
                    //xmlhttp.open("GET", "shoutServlet?t="+new Date(), true);
                    xmlhttp.open("GET", "NewChat", true);
                    xmlhttp.send();
                }
            }
            setInterval(getMessages, 1000);
        </script>
    </body>
</html>