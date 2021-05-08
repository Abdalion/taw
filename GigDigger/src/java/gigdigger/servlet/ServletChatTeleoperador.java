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
import gigdigger.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        System.out.println("entró");
        Integer idUser = new Integer(request.getParameter("idUser"));
        Usuario user = usuarioFacade.find(idUser);
        
        if(user.getRol().equals("TELEOPERADOR")){
            session.setAttribute("error", false);
            Integer idChat = new Integer(request.getParameter("idChat"));
            
            Chat chat = chatFacade.find(idChat);
            chat.setNotificaciones(0);
            
            //Si es null controlar en el jsp
            ArrayList<Chat> chats = new ArrayList<Chat>(chatFacade.findByTeleoperador(user.getId()));
            
            session.setAttribute("chat", chat);
            session.setAttribute("chats", chats);
            
        } else {
            session.setAttribute("error", true);
        }
        
        
        processRequest(request, response);
    }

    
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
