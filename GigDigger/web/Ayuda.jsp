<%@page import="gigdigger.entity.Usuario"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

    <head>
        <title>Ayuda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="bonsai.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
        
                    Usuario u = (Usuario)request.getAttribute("usuario");
                    //if u==nul no hay boton de crear chat ni de ir a chats.

        %>
        <div>Esta es la pagina de ayuda</div>
        <a href="/NewChat">Ir a la pagina para hablar con teleopera</a>
        <form method="GET" action="/NewChat">
            <label>
                idUsuario
            </label>
            <input type="text" name="id" placeholder="id" value="2">
            <button type="submit">Entrar</button>
        </form>
        <hr>
        <p>Vista de teleoperador</p>
        <form method="GET" action="ServletChatTeleoperador">
            <label>idUsuario</label>
            <input type="text" name="idUser" placeholder="id" value="4">
            
            <label>idChat</label>
            <input type="text" name="idChat" placeholder="id" value="2">
            
            <button type="submit">Entrar</button>
        </form>
    
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <img src="https://i.imgur.com/asll5wB.png" alt="logo gigDigger" height="50px">
                <a class="navbar-brand" href="">GigDigger</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="/help">Ayuda</a>

                            <%
                                if(u != null) {
                                    if(u.getRol().equals("ADMINISTRADOR")) {
                                        %>
                        <a class="nav-item nav-link" href="PanelAdministrador">Panel admin</a>
                                        <%
                                    }else if(u.getRol().equals("ANALISTA")) {
                                        %>
                        <a class="nav-item nav-link" href="ServletEstudioListar">Estudios</a>
                                        <%
                                    }
                                %>
                        <a class="nav-item nav-link" href="ServletPerfil">Mi perfil</a>
                        <a class="nav-item nav-link" href="ServletLogout">Cerrar sesion</a>
                                <%
                                }else {
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
            <h1 class="center"><b>Ayuda</b></h1>
            <br>
            <br>
            
        </div>                
        <div class="container">
        Poner consejos de ayuda o yo no se que.
        
        
        <%
        
            if(u!=null){
                if(u.getRol().equals("AUTOREGISTRADO")) {
                    
                    %>
                    <a class="btn" href="NewChat?id=<%=u.getId()%>">Contactar con teleoperador</a>
                    <%
                } else if(u.getRol().equals("TELEOPERADOR")){
                    %>
                    <a class="btn" href="ServletChatTeleoperador?idUser=<%=u.getId()%>">Ir a los chats</a>
                    <%
                }
            }
        
        %>
        </div>

</body>