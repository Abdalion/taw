/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.EntradaFacade;
import gigdigger.dao.EstudioFacade;
import gigdigger.dao.UsuarioFacade;
import gigdigger.entity.Estudio;
import gigdigger.entity.Usuario;
import gigdigger.entity.UsuarioAuto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ruben
 */
@WebServlet(name = "ServletEstudioGuardar", urlPatterns = {"/ServletEstudioGuardar"})
public class ServletEstudioGuardar extends HttpServlet {
    
    
    @EJB
    private EstudioFacade estudioFacade;
    
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
        //Filtros
        String usuariosConEventos = request.getParameter("usuariosConEventos");
        String usuariosSinEventos = request.getParameter("usuariosSinEventos");
        String usuariosMenoresDe18 = request.getParameter("usuariosMenoresDe18");
        String usuariosMayoresDe18 = request.getParameter("usuariosMayoresDe18");
        String usuariosFemeninos = request.getParameter("usuariosFemeninos");
        String usuariosMasculinos = request.getParameter("usuariosMasculinos");
        String eventosConAforo = request.getParameter("eventosConAforo");
        String eventosSinAforo = request.getParameter("eventosSinAforo");
        String eventosTerminados = request.getParameter("eventosTerminados");
        String eventosProximos = request.getParameter("eventosProximos");
        

        
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String idCreador = request.getParameter("id");
        
        Estudio estudio = new Estudio();
        estudio.setNombreEstudio(nombre);
        estudio.setDescripcion(descripcion);
        
        SimpleDateFormat formatter= new SimpleDateFormat("dd/MM/yyyy");
        Date fechaCreacion = new Date(System.currentTimeMillis());
        
        estudio.setFechaCreacion(fechaCreacion);
                
        Usuario creador = usuarioFacade.findByID(new Integer(idCreador));
        
        estudio.setCreadorEstudio(creador);
        
        List<UsuarioAuto> listaUsuariosAuto = new ArrayList<>();
        if(usuariosConEventos.equalsIgnoreCase("on")){
            listaUsuariosAuto.addAll(usuarioFacade.findByHasEvents());
        }
        
        estudioFacade.create(estudio);
        
        response.sendRedirect("ServletEstudioListar");  
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
