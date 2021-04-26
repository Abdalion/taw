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


@WebServlet(name = "NewChat", urlPatterns = {"/NewChat"})
public class NewChat extends HttpServlet {


    private List<AsyncContext> contexts = new LinkedList<>();
    private static final Logger LOG = Logger.getLogger(NewChat.class.getName());
    
    @EJB
    private UsuarioFacade usuarioFacade;
    
    @EJB
    private ChatFacade chatFacade;
    
    @EJB
    private MensajeFacade mensajeFacade;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd = request.getRequestDispatcher("ChatTeleoperador.jsp");
        rd.forward(request, response);
        
    }
    
    private void crearMensaje(HttpServletRequest request, HttpServletResponse response, Chat idChat, Usuario idEmisor){
        //mensaje: idchat, idemisor, texto
        String texto = request.getParameter("texto");
        
        
        Mensaje newMensaje = new Mensaje();
        
        
        newMensaje.setIdChat(idChat);
        newMensaje.setIdEmisor(idEmisor);
        newMensaje.setTexto(texto);
        System.out.println(idChat);
        System.out.println(idEmisor);
        System.out.println(texto);
        Date date = new Date(System.currentTimeMillis());
        newMensaje.setFecha(date);
        newMensaje.setHora(date);
        //TODO: meter el mensaje luego desps de verlo en la BD
        //idChat.addMensaje(newMensaje);
        mensajeFacade.create(newMensaje);
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /*EntityManagerFactory emf =
        Persistence.createEntityManagerFactory("GigDiggerPU");
        EntityManager em = emf.createEntityManager();*/
        
        //final AsyncContext asyncContext = request.startAsync(request, response);
        //asyncContext.setTimeout(10 * 60 * 1000);
        //contexts.add(asyncContext);
        
        HttpSession session = request.getSession();

        //Conseguimos la id usuario (TODO: cuando pedro haga lo suyo cambiarlo)
        Integer id = Integer.parseInt(request.getParameter("id"));
        //session.setAttribute("id", id);
        //Buscamos al user por su id
        Usuario user;
        user = this.usuarioFacade.findByID(id);


        //Buscamos conversacion activa del usutario
        Chat chatActivo = this.chatFacade.findCurrentChat(id);
        
        //Si no tiene activa, la creamos (solo si hay teleoperadores libres)
        if(chatActivo == null){
            
            
            Usuario telFree = this.usuarioFacade.findTeleoperadorLibre();
            
            
            if(telFree == null){ //si no hay teleoperadores libres: error
                
                //TODO: CONTROLAR ERROR EN JSP
                String msg = "No hay teleoperadores disponibles";
                session.setAttribute("msg", msg);
                
            }else{ //si hay teleoperadores libres: ok, la creamos

                Chat nuevoChat = new Chat();
                
                nuevoChat.setIdUsuario(user);
            
                nuevoChat.setIdTeleoperador(telFree);

                ArrayList<Mensaje> mensajes = nuevoChat.getMensajeList();

                session.setAttribute("mensajes", mensajes);
                
                //crearMensaje(request, response, nuevoChat, user);
            }
        
            
        }else{ //Si tiene conversacion activa le redirigimos a ella

            ArrayList<Mensaje> mensajes = chatActivo.getMensajeList();
            session.setAttribute("mensajes", mensajes);
            //crearMensaje(request, response, chatActivo, user);
        }
        
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<AsyncContext> asyncContexts = new ArrayList<>(this.contexts);
        this.contexts.clear();
        
        String message = request.getParameter("message");
        Integer idChat = Integer.parseInt(request.getParameter("idChat"));
        System.out.println("IdChat: " + idChat);
        Integer idUser = Integer.parseInt(request.getParameter("idUser"));
        Chat chat = chatFacade.findById(idChat);
        Usuario user = usuarioFacade.findByID(idUser);
 
        crearMensaje(request, response, chat, user);
        
        ServletContext application = request.getServletContext();
        
        /*if (application.getAttribute("messages") == null) {
            application.setAttribute("messages", message);
        } else {
            String currentMessages = (String) application.getAttribute("messages");
            application.setAttribute("messages", message + currentMessages);
        }*/
        
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
