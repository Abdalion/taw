<%-- 
    Document   : Registro
    Created on : 16-may-2021, 12:33:34
    Author     : egonb
--%>

<%@page import="gigdigger.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
                <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>
    <body>

        <%

            Usuario u = (Usuario) request.getAttribute("usuario");
            //if u==nul no hay boton de crear chat ni de ir a chats.

        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <img src="https://i.imgur.com/asll5wB.png" alt="logo gigDigger" height="50px">
                <a class="navbar-brand" href="">GigDigger</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="">Home </a>
                        <a class="nav-item nav-link" href="/help">Ayuda <span class="sr-only">(current)</span></a>

                        <%                                if (u != null) {
                                if (u.getRol().equals("ADMINISTRADOR")) {
                        %>
                        <a class="nav-item nav-link" href="PanelAdministrador">Panel admin</a>
                        <%
                        } else if (u.getRol().equals("ANALISTA")) {
                        %>
                        <a class="nav-item nav-link" href="ServletEstudioListar">Estudios</a>
                        <%
                            }
                        %>
                        <a class="nav-item nav-link" href="ServletPerfil">Mi perfil</a>
                        <a class="nav-item nav-link" href="ServletLogout">Cerrar sesión</a>
                        <%
                        } else {
                        %>
                        <a class="nav-item nav-link" href="ServletAutenticacion">Iniciar sesión</a>
                        <%
                            }

                        %>



                    </div>
                </div>

            </div>

        </nav>

        <div class="bg-coral">


            <br>
            <br>
            <h1 class="center"><b>Registro</b></h1>
            <br>
            <br>
        </div>
        <div class = "container">
            
            <br>
            <br>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    
                    <form>
                
                        <div class="form-group">
                          <label for="email">Correo electrónico</label>
                          <input id="email" type="email" name="email" maxlength="40" class="form-control"/>
                        </div>

                        <div class="form-group">
                          <label for="password">Contraseña</label>
                          <input id="password" type="text" name="password" maxlength="40" class="form-control"/>
                        </div>
                        <br>
                        <hr>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="nombre">Nombre</label>
                                <input id="nombre" type="text" name="nombre" maxlength="40" class="form-control"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="apellidos">Apellidos</label>
                                <input id="apellidos" type="text" name="apellidos" maxlength="40" class="form-control"/>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                          <label for="domicilio">Domicilio</label>
                          <input id="domicilio" type="text" name="domicilio" maxlength="40" class="form-control"/>
                        </div>


                        <div class="form-group">
                          <label for="ciudad">Ciudad de residencia</label>
                          <input id="ciudad" type="text" name="ciudad" maxlength="40" class="form-control"/>
                        </div>

                        <div class="form-group">
                          <label for="edad">Edad</label>
                          <input id="edad" type="number" name="edad" maxlength="40" class="form-control"/>
                        </div>

                        <div class="form-group">
                          <label for="sexo">Sexo</label>
                          <select id="sexo" name="sexo" class="custom-select my-1 mr-sm-2">
                                <option>MASCULINO</option>
                                <option>FEMENINO</option>
                           </select>
                        </div>
                        <br>

                        <input type="submit" value="Enviar">

                    </form>
                    
                </div>
                <div class="col-3"></div>

            </div>
            
            
            <br>
            <br>
            <br>
            <br>
        </div>

    </body>
</html>
