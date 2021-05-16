/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.EstudioEventosFacade;
import gigdigger.dao.EstudioFacade;
import gigdigger.dao.EstudioUsuariosFacade;
import gigdigger.dao.EventoFacade;
import gigdigger.dao.UsuarioAutoFacade;
import gigdigger.entity.Estudio;
import gigdigger.entity.EstudioEventos;
import gigdigger.entity.EstudioUsuarios;
import gigdigger.entity.Evento;
import gigdigger.entity.UsuarioAuto;
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
 * @author ruben
 */
@WebServlet(name = "ServletEstudioMostrar", urlPatterns = {"/ServletEstudioMostrar"})
public class ServletEstudioMostrar extends HttpServlet {

    @EJB
    private EventoFacade eventoFacade;

    @EJB
    private UsuarioAutoFacade usuarioAutoFacade;

    @EJB
    private EstudioUsuariosFacade estudioUsuariosFacade;

    @EJB
    private EstudioEventosFacade estudioEventosFacade;

    @EJB
    private EstudioFacade estudioFacade;

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
        String idEstudio = request.getParameter("id");

        Estudio estudio = estudioFacade.find(new Integer(idEstudio));
        
        request.setAttribute("estudio", estudio);

        if (estudio.getTipo().equalsIgnoreCase("Usuarios")) {
            List<EstudioUsuarios> listaEstudioUsuarios = estudioUsuariosFacade.findUsuariosByEstudio(estudio);
            List<UsuarioAuto> listaUsuarios = new ArrayList<>();

            for (EstudioUsuarios eu : listaEstudioUsuarios) {
                listaUsuarios.add(usuarioAutoFacade.find(eu.getIdUsuario().getId()));
            }

            request.setAttribute("listaUsuarios", listaUsuarios);
        }else{
            List<EstudioEventos> listaEstudioEventos = estudioEventosFacade.findEventosByEstudio(estudio);
            List<Evento> listaEventos = new ArrayList<>();

            for (EstudioEventos ee : listaEstudioEventos) {
                listaEventos.add(eventoFacade.find(ee.getIdEvento().getId()));
            }

            request.setAttribute("listaEventos", listaEventos);
        }

        RequestDispatcher rd = request.getRequestDispatcher("Estudio.jsp");
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
