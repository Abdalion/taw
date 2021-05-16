<%-- 
    Document   : autenticacion
    Created on : 29-abr-2021, 18:25:53
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido al sistema</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
    </head>
    
    <body>
        <%
            String strError = (String)request.getAttribute("error");
            if (strError == null) strError = "";        
        %>
        
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
    
    <div class="overlay-coral">
                                
            
            <br>
            <br>
            <h1 class="center"><b>Iniciar sesión</b></h1>
            <br>
            <br>
            <div class="container">
                <div class="shadow p-3 mb-5 bg-white rounded">
                
                    <div class="row">
                        
                        <div class="col-4"></div>
                        <div class="col-4">
                            
                            <form method="POST" action="ServletAutenticacion">
                                <%= strError %> <br/>

                                <label for="usuario" style="color: #000"><h5 class="font-weight-normal">Email</h5></label>
                                <input id="usuario" type="text" name="usuario"/>
                                <br/>
                                <br>
                                <label for="password" style="color: #000"><h5 class="font-weight-normal">Contraseña</h5></label>
                                <input type="password" name="password"/>
                                <br/>

                                <input type="submit" value="Enviar"/>
                            </form>
                            
                        </div>
                        <div class="col-4"></div>
                        

                        

                    </div>
                                <br>
                                <br>
                </div>
            </div>
            
            
            
            <br>
            <br>
            
            
        </div>
    
    
    </body>
</html>
