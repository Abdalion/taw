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
import javax.ejb.EJB;
import javax.persistence.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jesus
 */


@WebServlet(name = "NewChat", urlPatterns = {"/NewChat"})
public class NewChat extends HttpServlet {


    @EJB
    private UsuarioFacade usuarioFacade;
    
    @EJB
    private ChatFacade chatFacade;
    
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
        
        EntityManagerFactory emf =
        Persistence.createEntityManagerFactory("GigDiggerPU");
        EntityManager em = emf.createEntityManager();
        
        
        HttpSession session = request.getSession();

        //Conseguimos la id usuario (TODO: cuando pedro haga lo suyo cambiarlo)
        Integer id = Integer.parseInt(request.getParameter("id"));
        
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
                
                crearMensaje(request, response, nuevoChat, user);
            }
        
            
        }else{ //Si tiene conversacion activa le redirigimos a ella

            ArrayList<Mensaje> mensajes = chatActivo.getMensajeList();
            session.setAttribute("mensajes", mensajes);
            crearMensaje(request, response, chatActivo, user);
        }
        
        
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
        //TODO FECHA Y HORA
        idChat.addMensaje(newMensaje);
        
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
