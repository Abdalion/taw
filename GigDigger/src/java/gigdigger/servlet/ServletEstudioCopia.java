/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.EstudioEventosFacade;
import gigdigger.dao.EstudioFacade;
import gigdigger.dao.EstudioUsuariosFacade;
import gigdigger.entity.Estudio;
import gigdigger.entity.EstudioEventos;
import gigdigger.entity.EstudioUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ServletEstudioCopia", urlPatterns = {"/ServletEstudioCopia"})
public class ServletEstudioCopia extends HttpServlet {

    @EJB
    private EstudioFacade estudioFacade;

    @EJB
    private EstudioUsuariosFacade estudioUsuariosFacade;

    @EJB
    private EstudioEventosFacade estudioEventosFacade;

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
        String id = request.getParameter("id");

        Estudio estudio = estudioFacade.find(new Integer(id));

        Estudio copiaEstudio = new Estudio();
        copiaEstudio.setCreadorEstudio(estudio.getCreadorEstudio());
        copiaEstudio.setDescripcion(estudio.getDescripcion());
        copiaEstudio.setFechaCreacion(estudio.getFechaCreacion());
        copiaEstudio.setNombreEstudio("Copia " + estudio.getNombreEstudio());
        copiaEstudio.setTipo(estudio.getTipo());

        estudioFacade.create(copiaEstudio);

        if (estudio.getTipo().equalsIgnoreCase("USUARIOS")) {
            List<EstudioUsuarios> listaUsuarios = estudioUsuariosFacade.findUsuariosByEstudio(estudio);

            if (listaUsuarios != null) {
                for (EstudioUsuarios eu : listaUsuarios) {
                    EstudioUsuarios euCopia = new EstudioUsuarios();
                    euCopia.setIdEstudio(copiaEstudio);
                    euCopia.setIdUsuario(eu.getIdUsuario());
                    estudioUsuariosFacade.create(euCopia);
                }
            }

        } else {
            List<EstudioEventos> listaEventos = estudioEventosFacade.findEventosByEstudio(estudio);

            if (listaEventos != null) {
                for (EstudioEventos ee : listaEventos) {
                    EstudioEventos eeCopia = new EstudioEventos();
                    eeCopia.setIdEstudio(copiaEstudio);
                    eeCopia.setIdEvento(ee.getIdEvento());
                    estudioEventosFacade.create(eeCopia);
                }
            }
        }

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
