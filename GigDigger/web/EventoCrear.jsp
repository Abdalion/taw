<%@page import="gigdigger.entity.Usuario"%>
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
        <title>Crear Evento</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">  
        <link href="https://i.imgur.com/asll5wB.png" rel="icon">


    </head>

    <%
        List<Etiqueta> listaEtiquetas = (List) request.getAttribute("listaEtiquetas");

    %>  


    <body>

        <%            Usuario u = (Usuario) request.getAttribute("usuario");
            //if u==nul no hay boton de crear chat ni de ir a chats.

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

                        <%                                if (u != null) {
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
            <h1 class="center"><b>Crear Evento</b></h1>
            <br>
            <br>

        </div> 

    </div>
    <div class = "container">

        <br>
        <br>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">


                <form method="post" action="ServletEventoGuardar" name="crearEvento" accept-charset="UTF-8">
                    <table>
                        <tr>
                            <td>T?tulo: </td>
                            <td><input type="text" name="titulo" maxlength="20" size="20" required/></td>                               
                        </tr>                          
                        <tr>
                            <td>Descripci?n: </td>
                            <td><input type="text" name="descripcion" maxlength="200" size="50" required/></td>                          
                        </tr>                           
                        <tr>
                            <td>Fecha del evento: </td>
                            <td><input type="date" name="fecha" maxlength="20" size="20" required/></td>
                        </tr>
                        <tr>
                            <td>Fecha l?mite de compra: </td>
                            <td><input type="date" name="fechaLimite" maxlength="20" size="20" required/></td>
                        </tr>
                        <tr>
                            <td>Precio: </td>
                            <td><input type="text" name="precio" maxlength="20" size="20" required/></td>
                        </tr>

                        <tr>
                            <td>Etiquetas: </td>
                            <td><select multiple class="form-control" name="etiquetasSeleccionadas">
                                    <%                                for (Etiqueta e : listaEtiquetas) {
                                    %>

                                    <option><%=e.getEtiqueta()%></option>

                                    <%
                                        }
                                    %>

                                </select></td>
                        </tr>

                       
                            <td>Aforo: </td>
                            <td><input type="number" name="aforo" maxlength="20" size="20" required/></td>
                        </tr>
                        <tr>
                            <td>L?mite de entradas: </td>
                            <td><input type="number" name="limiteEntradas" maxlength="20" size="20" required/></td>
                        </tr>
                        <tr>
                            <td>N?mero de filas: </td>
                            <td><input type="number" name="nFilas" maxlength="20" size="20" required/></td>
                        </tr>
                        <tr>
                            <td>Asientos por fila: </td>
                            <td><input type="number" name="nAsientosFila" maxlength="20" size="20" required/></td>
                        </tr>
                    </table>
                    <br/>

                    <div class = "center"> 
                        <input type="submit" value="Crear evento" class="btn btn-primary" >
                    </div>
                </form>
            </div>
            <div class="col-3"></div>
        </div>


        <br>
        <br>

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
