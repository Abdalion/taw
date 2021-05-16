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
                        <a class="nav-item nav-link" href="ServletLogout">Cerrar sesion</a>
                        <%
                        } else {
                        %>
                        <a class="nav-item nav-link" href="ServletAutenticacion">Iniciar sesion</a>
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
            <form method="post" action="PanelAdministrador" name="crearUsuario" accept-charset="UTF-8">
                <table>
                    <tr>
                        <td>NOMBRE </td>
                        <td><input type="text" name="nombre" maxlength="40"/></td>
                    </tr>
                    <tr>
                        <td>APELLIDOS</td>
                        <td><input type="text" name="apellidos" maxlength="40"/></td>
                    </tr>
                    <tr>
                        <td>DOMICILIO</td>
                        <td><input type="text" name="domicilio" maxlength="40"/></td>
                    </tr>
                    <tr>
                        <td>CIUDAD DE RESIDENCIA</td>
                        <td><input type="text" name="ciudad" maxlength="40"/></td>
                    </tr>
                    <tr>
                        <td>EDAD</td>
                        <td><input type="text" name="edad" maxlength="40"/></td>
                    </tr>
                    <tr>
                        <td>SEXO</td>
                        <td><input type="text" name="sexo" maxlength="40"/></td>
                    </tr>
                    <tr>
                        <td>CORREO </td>
                        <td><input type="text" name="email" maxlength="40"/></td>
                    </tr>
                    <tr>
                        <td>CONTRASEÑA </td>
                        <td><input type="text" name="password" maxlength="40"/></td>
                    </tr>
                    <tr>
                </table>
                <br/>
                <input type="submit" value="Enviar">
            </form>
        </div>

    </body>
</html>
