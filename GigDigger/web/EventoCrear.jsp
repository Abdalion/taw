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
        <form method="get" action="EventoCrear" name="datos" accept-charset="UTF-8">
            <table>
                <tr>
                    <td>T�tulo: </td>
                    <td><input type="text" name="titulo" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Descripci�n: </td>
                    <td><input type="text" name="descripcion" maxlength="200" size="50"/></td>
                </tr>
                <tr>
                    <td>Fecha del Evento: </td>
                    <td><input type="text" name="fecha" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Fecha l�mite para comprar la entrada: </td>
                    <td><input type="text" name="fechaLimite" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Precio: </td>
                    <td><input type="text" name="precio" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Hay aforo?: </td>
                    <td>
                    <label class="switch">
                    <input type="checkbox">
                    <span class="slider round"></span>
                    </label></td>
                </tr>
                <tr>
                    <td>Aforo: </td>
                    <td><input type="text" name="aforo" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>L�mite de entradas que se puede llevar un usuario: </td>
                    <td><input type="text" name="limiteEntradas" maxlength="20" size="20"/></td>
                </tr>
            </table>
            <br/>
            <button>Enviar</button>

        </form>
    </body>
    
    <style>
        /* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
    </style>
</html>