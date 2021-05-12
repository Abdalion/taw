/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;
        
import gigdigger.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import gigdigger.entity.*;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.persistence.*;
import javax.servlet.AsyncContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jesus
 */


@WebServlet(name = "NewChat", urlPatterns = {"/NewChat"}, asyncSupported=true)
public class NewChat extends HttpServlet {

    private List<AsyncContext> contexts = new LinkedList<>();
    private static final Logger LOG = Logger.getLogger(NewChat.class.getName());
    
    @EJB
    private UsuarioFacade usuarioFacade;
    
    @EJB
    private ChatFacade chatFacade;
    
    @EJB
    private MensajeFacade mensajeFacade;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("ChatUsuario.jsp");
        rd.forward(request, response);

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        //Conseguimos la id usuario (TODO: cuando pedro haga lo suyo cambiarlo)
        Integer id = Integer.parseInt(request.getParameter("id"));
        //session.setAttribute("id", id);
        //Buscamos al user por su id
        Usuario user;
        user = this.usuarioFacade.findByID(id);
        session.setAttribute("error", false);

        //Buscamos conversacion activa del usutario
        Chat chatActivo = this.chatFacade.findCurrentChat(id);   
        //Si no tiene activa, la creamos (solo si hay teleoperadores libres)
        if(chatActivo == null){
                       
            Usuario telFree = this.usuarioFacade.findTeleoperadorLibre();
                        
            if(telFree == null){ //si no hay teleoperadores libres: error
                //TODO: CONTROLAR ERROR EN JSP
                String msg = "No hay teleoperadores disponibles";
                session.setAttribute("msg", msg);
                session.setAttribute("error", true);
                
            }else{ //si hay teleoperadores libres: ok, la creamos

                Chat nuevoChat = new Chat();
                nuevoChat.setIdUsuario(user);
                nuevoChat.setIdTeleoperador(telFree);
                
                /*ArrayList<Mensaje> mensajes = nuevoChat.getMensajeList();
                session.setAttribute("mensajes", mensajes);*/
                
                session.setAttribute("chat", nuevoChat);
                //crearMensaje(request, response, nuevoChat, user);
            }
        }else{ //Si tiene conversacion activa le redirigimos a ella

            /*ArrayList<Mensaje> mensajes = chatActivo.getMensajeList();
            session.setAttribute("mensajes", mensajes);*/
            session.setAttribute("chat", chatActivo);
            
        }
        //final AsyncContext asyncContext = request.startAsync(request, response);
        //asyncContext.setTimeout(10 * 60 * 1000);
        //contexts.add(asyncContext);
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<AsyncContext> asyncContexts = new ArrayList<>(this.contexts);
        this.contexts.clear();
        
        String message = request.getParameter("message");
        Integer idChat = Integer.parseInt(request.getParameter("idChat"));
        Integer idUser = Integer.parseInt(request.getParameter("idUser"));
        Chat chat = chatFacade.findById(idChat);
        Usuario user = usuarioFacade.findByID(idUser);
 
        String rol = user.getRol();
        
        if(rol.equalsIgnoreCase("AUTOREGISTRADO")){
            int notificaciones = chat.getNotificaciones();
            notificaciones++;
            chat.setNotificaciones(notificaciones);
            chatFacade.edit(chat);
        }
        crearMensaje(request, response, chat, user);
        
        
        
        for (AsyncContext asyncContext : asyncContexts) {
            try (PrintWriter writer = asyncContext.getResponse().getWriter()) {
                writer.println(message);
                writer.flush();
                asyncContext.complete();
            } catch (Exception ex) {
                LOG.severe("Se ha producido la siguiente excepcion: " + ex.getMessage());
            }
        }
        
        processRequest(request, response);
        
    }
    
}
