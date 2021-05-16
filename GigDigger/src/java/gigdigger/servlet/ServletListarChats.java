/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.ChatFacade;
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

/**
 *
 * @author Usuario
 */
@WebServlet(name = "ServletListarChats", urlPatterns = {"/ServletListarChats"})
public class ServletListarChats extends HttpServlet {
    
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
        
        String id = request.getParameter("idUser");
        
        Boolean hayChat = false;
        
        try{
            Chat chat = chatFacade.find(new Integer(request.getParameter("idChat")));
            request.setAttribute("chat", chat);
            hayChat=true;
        } catch (Exception e){
            
        }
        request.setAttribute("hayChat", hayChat);
        Usuario usuario = usuarioFacade.findByID(new Integer(id));
        ArrayList<Chat> listaChats = new ArrayList<Chat>(chatFacade.findByUser(usuario.getId()));
        
        request.setAttribute("listaChats", listaChats);
        request.setAttribute("usuario", usuario);
        
        RequestDispatcher rd = request.getRequestDispatcher("listaChats.jsp");
        rd.forward(request, response);
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
