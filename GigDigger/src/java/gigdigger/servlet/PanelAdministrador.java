/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.EventoFacade;
import gigdigger.dao.UsuarioFacade;
import gigdigger.entity.Evento;
import gigdigger.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author egonb
 */
@WebServlet(name = "ServletPanelAdministrador", urlPatterns = {"/PanelAdministrador"})
public class PanelAdministrador extends HttpServlet {

    
    @EJB
    private EventoFacade eventoFacade;
    @EJB
    private UsuarioFacade usuarioFacade;
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
        List<Evento> listaEventos = this.eventoFacade.findAll();
        List<Usuario> listaUsuarios = usuarioFacade.findAll();
       
        request.setAttribute("listaEventos", listaEventos);
        request.setAttribute("listaUsuarios", listaUsuarios);
                
        RequestDispatcher rd = request.getRequestDispatcher("PanelAdministrador.jsp");
        
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
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
/*        Usuario nuevoUsuario = new Usuario(name, email, password, role);
        usuarioFacade.create(nuevoUsuario);
  */
        Usuario u = new Usuario();
        u.setNombreUsuario(name);
        u.setEmail(email);
        u.setPassword(password);
        u.setRol(role);
        this.usuarioFacade.create(u);
        
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
