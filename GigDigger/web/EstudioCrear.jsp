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

    </head>
    
    <%
        //<%= //creador.getId()
    %>
    
    <body>
        <h1>Datos del Estudio</h1>
        <form method="post" action="ServletEstudioGuardar?id=202" name="crearEstudio" accept-charset="UTF-8">
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
            <input type="submit" value="Crear estudio" class="btn btn-info" >

        </form>
    </body>
    

</html>
