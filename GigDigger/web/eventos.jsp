<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Datos del Evento</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Datos del Evento</h1>
        <form method="get" action="ServletEventoCrear" name="datos" accept-charset="UTF-8">
            <table>
                <tr>
                    <td>Título: </td>
                    <td><input type="text" name="titulo" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Descripción: </td>
                    <td><input type="text" name="descripcion" maxlength="200" size="50"/></td>
                </tr>
                <tr>
                    <td>Fecha del Evento: </td>
                    <td><input type="text" name="fecha" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Fecha límite para comprar la entrada: </td>
                    <td><input type="text" name="fechaLimite" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Precio: </td>
                    <td><input type="text" name="precio" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Aforo: </td>
                    <td><input type="text" name="aforo" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Límite de entradas que se puede llevar un usuario: </td>
                    <td><input type="text" name="limiteEntradas" maxlength="20" size="20"/></td>
                </tr>
            </table>
            <br/>
            <button>Enviar</button>

        </form>
    </body>
</html>
