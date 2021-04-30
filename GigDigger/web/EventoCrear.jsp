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
        <title>Datos del Evento</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">        

    </head>
    
    <%
        List<Etiqueta> listaEtiquetas = (List)request.getAttribute("listaEtiquetas");

    %>  
    
    
    <body>
        <h1>Datos del Evento</h1>
        <form method="post" action="ServletEventoGuardar" name="crearEvento" accept-charset="UTF-8">
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
                    <td>Fecha del evento: </td>
                    <td><input type="date" name="fecha" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Fecha límite para comprar la entrada: </td>
                    <td><input type="date" name="fechaLimite" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Precio: </td>
                    <td><input type="text" name="precio" maxlength="20" size="20"/></td>
                </tr>
                
                <tr>
                    <td>Etiquetas: </td>
                    <td><select multiple class="form-control" name="etiquetasSeleccionadas">
                            <%
                            for(Etiqueta e: listaEtiquetas){
                            %>
                            
                            <option><%=e.getEtiqueta()%></option>
                            
                            <%
                            }
                            %>
                            
                        </select></td>
                </tr>
                
                <tr>
                    <td>¿Hay aforo? </td>
                    <td>
                    <label class="switch">
                    <input type="checkbox">
                    <span class="slider round"></span>
                    </label></td>
                </tr>
                <tr>
                    <td>Aforo: </td>
                    <td><input type="number" name="aforo" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Límite de entradas que se puede llevar un usuario: </td>
                    <td><input type="number" name="limiteEntradas" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Número de filas: </td>
                    <td><input type="number" name="nFilas" maxlength="20" size="20"/></td>
                </tr>
                <tr>
                    <td>Numero de asientos por fila: </td>
                    <td><input type="number" name="nAsientosFila" maxlength="20" size="20"/></td>
                </tr>
            </table>
            <br/>
            <input type="submit" value="Crear evento" class="btn btn-info" >

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
