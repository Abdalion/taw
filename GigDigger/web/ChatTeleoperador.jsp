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
                <%

                   for(Mensaje men : listaMensajes){
                  %>

                  <div>

                      <p>IDchat: <%=men.getIdChat()%> | IDmensaje: <%=men.getId()%> | IDEmisor: <%=men.getIdEmisor()%> | Texto : <%=men.getTexto()%></p>

                  </div>


                  <%
                   } 

                %>
            </div>

        </div>
    </body>
</html>