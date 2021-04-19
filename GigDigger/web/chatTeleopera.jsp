<%-- 
    Document   : chatTeleopera
    Created on : 19-abr-2021, 13:49:41
    Author     : jesus
--%>

<%@page import="gigdigger.entity.Chat"%>
<%@page import="gigdigger.servlet.NewChat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>En esta página iria el chat</h1>
        
        <%String mensaje = (String) request.getAttribute("msg");%>
        <h3><%=mensaje%></h3>
    </body>
</html>
