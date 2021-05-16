/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.ChatFacade;
import gigdigger.dao.MensajeFacade;
import gigdigger.dao.UsuarioFacade;
import gigdigger.entity.Chat;
import gigdigger.entity.Mensaje;
import gigdigger.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jesus
 */
@WebServlet(name = "ServletChatTeleoperador", urlPatterns = {"/ServletChatTeleoperador"})
public class ServletChatTeleoperador extends HttpServlet {

    
    @EJB
    private UsuarioFacade usuarioFacade;
    
    @EJB
    private ChatFacade chatFacade;
    
    @EJB
    private MensajeFacade mensajeFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("chatTeleoperadorVF.jsp");
        rd.forward(request, response);

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        HttpSession session = request.getSession();
        
        Integer idUser = new Integer(request.getParameter("idUser"));
        Usuario user = usuarioFacade.find(idUser);
        session.setAttribute("usuario", user);

        if(user.getRol().equals("TELEOPERADOR")){
            session.setAttribute("error", false);
            Integer idChat=null;
            try{
                             idChat = new Integer(request.getParameter("idChat"));

            } catch (NumberFormatException e){
                 idChat = null;
            }
            
            if(idChat==null){   
                session.setAttribute("chat", null);
            } else{
                Chat chat = chatFacade.find(idChat);
                chat.setNotificaciones(0);

                //Si es null controlar en el jsp
                
                session.setAttribute("chat", chat);
            }
            ArrayList<Chat> chats = new ArrayList<Chat>(chatFacade.findByTeleoperador(user.getId()));
            session.setAttribute("chats", chats);

            if(chats==null){
                
                session.setAttribute("chatsVacio", true);
            }
            
        } else {
            session.setAttribute("error", true);
        }
        
        
        processRequest(request, response);
    }
    
    private void crearMensaje(HttpServletRequest request, HttpServletResponse response, Chat idChat, Usuario idEmisor){
        //mensaje: idchat, idemisor, texto
        String texto = request.getParameter("texto");
        
        
        Mensaje newMensaje = new Mensaje();
        
        
        newMensaje.setIdChat(idChat);
        newMensaje.setIdEmisor(idEmisor);
        newMensaje.setTexto(texto);
        Date date = new Date(System.currentTimeMillis());
        newMensaje.setFecha(date);
        newMensaje.setHora(date);
        mensajeFacade.create(newMensaje);
        
        ArrayList<Mensaje> mensajesActualizados = idChat.getMensajeList();
        mensajesActualizados.add(newMensaje);
        idChat.setMensajeList(mensajesActualizados);
        
        chatFacade.edit(idChat);
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String message = request.getParameter("message");
        Integer idChat = Integer.parseInt(request.getParameter("idChat"));
        Integer idUser = Integer.parseInt(request.getParameter("idUser"));
        Chat chat = chatFacade.findById(idChat);
        Usuario user = usuarioFacade.findByID(idUser);
 
        String rol = user.getRol();
        
        /*if(rol.equalsIgnoreCase("AUTOREGISTRADO")){
            int notificaciones = chat.getNotificaciones();
            notificaciones++;
            chat.setNotificaciones(notificaciones);
            chatFacade.edit(chat);
        }*/
        
        crearMensaje(request, response, chat, user);
        
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
