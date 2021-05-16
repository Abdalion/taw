/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.UsuarioAutoFacade;
import gigdigger.dao.UsuarioFacade;
import gigdigger.entity.Usuario;
import gigdigger.entity.UsuarioAuto;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ServletRegistro", urlPatterns = {"/ServletRegistro"})
public class ServletRegistro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB
    private UsuarioFacade usuarioFacade;
    @EJB
    private UsuarioAutoFacade usuarioAutoFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("Registro.jsp");
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

        String name = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String domicilio = request.getParameter("domicilio");
        String ciudad = request.getParameter("ciudad");
        String edad = request.getParameter("edad");
        String sexo = request.getParameter("sexo");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        /*        Usuario nuevoUsuario = new Usuario(name, email, password, role);
        usuarioFacade.create(nuevoUsuario);
         */
        Usuario u = new Usuario();
        UsuarioAuto ua = new UsuarioAuto();
        u.setNombreUsuario(name);
        u.setEmail(email);
        u.setPassword(password);
        u.setRol("AUTOREGISTRADO");
        this.usuarioFacade.create(u);
        ua.setId(u.getId());
        u.setUsuarioAuto(ua);
        
        ua.setUsuario(u);
        ua.setNombre(name);
        ua.setApellidos(apellidos);
        ua.setDomicilio(domicilio);
        ua.setCiudad(ciudad);
        ua.setSexo(sexo);
        ua.setEdad(new Integer(edad));
        
        usuarioAutoFacade.create(ua);
        
        response.sendRedirect("/");
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
