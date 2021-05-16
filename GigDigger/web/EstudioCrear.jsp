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
        <title>Datos del Estudio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">        
        <link href="https://i.imgur.com/asll5wB.png" rel="icon">

    </head>

    <body>
        <h1>Datos del Estudio</h1>
        <form method="post" action="ServletEstudioGuardar?id=102" name="crearEstudio" accept-charset="UTF-8">
            <table>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="nombre" maxlength="50" size="20"/></td>
                </tr>
                <tr>
                    <td>Descripción: </td>
                    <td><input type="text" name="descripcion" maxlength="150" size="50"/></td>
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

                <input type="submit" name="Crear estudio" class="btn btn-info" >
            </div>

            <div id="filtrosUsuarios" style="display:block;">
                <input type="checkbox" name="eventosConAforo" > Eventos con aforo <br>
                <br>

                <input type="checkbox" name="eventosSinAforo" > Eventos sin aforo <br>
                <br>

                <input type="checkbox" name="eventosTerminados" > Eventos terminados <br>
                <br>

                <input type="checkbox" name="eventosProximos" > Eventos próximos <br>
                <br>

                <input type="submit" name="Crear estudio" class="btn btn-info" >
            </div>

        </form>

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
