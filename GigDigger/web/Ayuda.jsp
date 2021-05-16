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
        <link href="https://i.imgur.com/asll5wB.png" rel="icon">
    </head>
    <body>
        <%
        
                    Usuario u = (Usuario)request.getAttribute("usuario");
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
            <br>
            <br>
            <%
                if(u!=null){
                    if(u.getRol().equals("TELEOPERADOR")){
                    %>
                    
                    <a class="btn btn-primary btn-lg btn-block" href="ServletChatTeleoperador?idUser=<%=u.getId()%>">Ir a los chats</a>
                    <br>
                    <%
                }
}
            %>
                
         
        
            
            <h3 class="color-coral"><b>¿Qué es Gigdigger?</b></h3>
            <hr>
            <h5 class="font-weight-normal">Gigdigger es una plataforma que te permite comprar entradas de forma rápida y segura de tus eventos más próximos.</h5>
            <br>
            <br>
            
            <h3 class="color-coral"><b>¿Cómo me puedo registrar?</b></h3>
            <hr>
            <h5 class="font-weight-normal">Para darte de alta como usuario de Gigdigger solo hace falta un email y algunos datos personales, que estarán protegidos correctamente.</h5>
            <br>
            <br>
            
            <h3 class="color-coral"><b>¿Cuántas entradas puedo comprar?</b></h3>
            <hr>
            <h5 class="font-weight-normal">Cada usuario registrado en Gigdigger puede realizar una compra máxima de 5 entradas por cada evento.</h5>
            <br>
            <br>
            
            <h3 class="color-coral"><b>Método de Contacto</b></h3>
            <hr>
            <h5 class="font-weight-normal">Si un usuario registrado necesita cualquier tipo de ayuda puede contactar con un teleoperador.</h5>
            <br>
            <br>
        
        <%
        
            if(u!=null){
                if(u.getRol().equals("AUTOREGISTRADO")) {
                    
                    %>
                    <a class="btn btn-primary btn-lg btn-block" href="NewChat?id=<%=u.getId()%>">Contactar con teleoperador</a>
                    <%
                } else if(u.getRol().equals("TELEOPERADOR")){
                    %>
                    <a class="btn btn-primary btn-lg btn-block" href="ServletChatTeleoperador?idUser=<%=u.getId()%>">Ir a los chats</a>
                    <%
                }
            }
        
        %>
        </div>
<br>
            <br><br>
            <br><br>
            <br><br>
            <br><br>
            <br>
</body>