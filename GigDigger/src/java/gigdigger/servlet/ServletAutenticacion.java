/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.UsuarioFacade;
import gigdigger.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Pedro
 */
@WebServlet(name = "ServletAutenticacion", urlPatterns = {"/ServletAutenticacion"})
public class ServletAutenticacion extends HttpServlet {
    
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

      HttpSession session = request.getSession();
      
     if(session.getAttribute("userId") != null) {
         response.sendRedirect("");
     }else {
        RequestDispatcher rd = request.getRequestDispatcher("autenticacion.jsp");
        rd.forward(request, response);
     }

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
              String strUsuario = request.getParameter("usuario");
      String strPassword = request.getParameter("password");
      Usuario usuario;
            HttpSession session = request.getSession();

      String strError = "", strTo = "";
              if (strUsuario == null || strUsuario.isEmpty() || strPassword == null || strPassword.isEmpty()) { // Error en la autenticación 
          strError = "Error en la autenticación";
          request.setAttribute("error", strError);
          strTo = "autenticacion.jsp";
      } else {
          usuario = this.usuarioFacade.findByEmailAndPassword(strUsuario, strPassword);
          if (usuario == null) {
            strError = "Error en la autenticación";
            request.setAttribute("error", strError);
            strTo = "autenticacion.jsp";
          }else {
              session.setAttribute("userId", usuario.getId());
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
