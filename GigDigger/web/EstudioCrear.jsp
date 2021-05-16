<%@page import="gigdigger.entity.Usuario"%>
<%@page import="gigdigger.entity.Estudio"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page import="gigdigger.entity.Evento"%>
<%@page import="gigdigger.entity.Etiqueta"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Crear Estudio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>

    <%
        List<Estudio> listaEstudios = (List) request.getAttribute("listaEstudios");
        Usuario u = (Usuario) request.getAttribute("usuario");

    %>

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
                        <a class="nav-item nav-link active" href="/">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="/help">Ayuda</a>

                        <%  if (u != null) {
                                if (u.getRol().equals("ANALISTA")) {
                        %>
                        <a class="nav-item nav-link" href="ServletEstudioListar">Estudios</a>
                        <%
                            }
                        %>

                        <a class="nav-item nav-link" href="ServletPerfil">Mi perfil</a>
                        <a class="nav-item nav-link" href="ServletLogout">Cerrar sesion</a>

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
            <h1 class="center"><b>Crear Estudio</b></h1>
            <br>
            <br>

        </div>
        <br>
        <br>
        <div class="container">
            <form method="post" action="ServletEstudioGuardar?id=102" name="crearEstudio" accept-charset="UTF-8">
                <table>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="nombre" maxlength="50" size="20" required/></td>
                    </tr>
                    <tr>
                        <td>Descripción: </td>
                        <td><input type="text" name="descripcion" maxlength="150" size="50" required/></td>
                    </tr>
                </table>
                <br/>

                Filtros: <br>
                <select name="tipo" onchange="showDiv(this)">
                    <option select="selected" value="Eventos">Eventos</option>
                    <option value="Usuarios">Usuarios</option>
                </select><br><br>

                <div id="filtrosEventos" style="display:none;">
                    <input type="checkbox" name="usuariosConEventos" > Usuarios con eventos contratados <br>
                    <br>

                    <input type="checkbox" name="usuariosSinEventos" > Usuarios sin eventos contratados <br>
                    <br>

                    <input type="checkbox" name="usuariosMenoresDe18"> Usuarios menores de 18 años <br>
                    <br>

                    <input type="checkbox" name="usuariosMayoresDe18"> Usuarios mayores de 18 años <br>
                    <br>

                    <input type="checkbox" name="usuariosFemeninos" > Usuarios femeninos <br>
                    <br>

                    <input type="checkbox" name="usuariosMasculinos" > Usuarios masculinos <br>
                    <br>

                    <input type="submit" name="Crear estudio" class="btn btn-primary" >
                </div>

                <div id="filtrosUsuarios" style="display:block;">
                    <!--input type="checkbox" name="eventosConAforo" > Eventos con aforo <br>
                    <br>

                    <input type="checkbox" name="eventosSinAforo" > Eventos sin aforo <br>
                    <br-->

                    <input type="checkbox" name="eventosTerminados" > Eventos terminados <br>
                    <br>

                    <input type="checkbox" name="eventosProximos" > Eventos próximos <br>
                    <br>

                    <input type="submit" name="Crear estudio" class="btn btn-primary" >
                </div>

            </form>
        </div>
        <br>
        <br>
        
        <script>
            function showDiv(select) {
                if (select.value == "Usuarios") {
                    document.getElementById('filtrosUsuarios').style.display = "none";
                    document.getElementById('filtrosEventos').style.display = "block";

                } else {
                    document.getElementById('filtrosUsuarios').style.display = "block";
                    document.getElementById('filtrosEventos').style.display = "none";
                }
            }
        </script>

    </body>


</html>
