/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.*;
import gigdigger.entity.Estudio;
import gigdigger.entity.EstudioEventos;
import gigdigger.entity.EstudioUsuarios;
import gigdigger.entity.Evento;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ruben
 */
@WebServlet(name = "ServletEstudioGuardar", urlPatterns = {"/ServletEstudioGuardar"})
public class ServletEstudioGuardar extends HttpServlet {

    @EJB
    private UsuarioAutoFacade usuarioAutoFacade;

    @EJB
    private EstudioUsuariosFacade estudioUsuariosFacade;

    @EJB
    private EstudioEventosFacade estudioEventosFacade;

    @EJB
    private EstudioFacade estudioFacade;

    @EJB
    private UsuarioFacade usuarioFacade;

    @EJB
    private EventoFacade eventoFacade;

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
        String tipo = request.getParameter("tipo");

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        HttpSession session = request.getSession();
        Integer idCreador = (Integer) session.getAttribute("userId");

        Estudio estudio = new Estudio();
        estudio.setNombreEstudio(nombre);
        estudio.setDescripcion(descripcion);
        estudio.setTipo(tipo);

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaCreacion = new Date(System.currentTimeMillis());

        estudio.setFechaCreacion(fechaCreacion);

        Usuario creador = usuarioFacade.findByID(idCreador);

        estudio.setCreadorEstudio(creador);

        estudioFacade.create(estudio);

        if (tipo.equalsIgnoreCase("Usuarios")) {
            List<UsuarioAuto> listaUsuariosAuto = new ArrayList<>();

            if ("on".equalsIgnoreCase(usuariosConEventos)) {
                List<UsuarioAuto> lista = usuarioAutoFacade.findConEventoReservado();
                if (lista != null) {
                    listaUsuariosAuto.addAll(lista);
                }
            }
            if ("on".equalsIgnoreCase(usuariosSinEventos)) {
                List<UsuarioAuto> listaUsuariosConEntrada = usuarioAutoFacade.findConEventoReservado();
                List<UsuarioAuto> listaUsuarios = usuarioAutoFacade.findAll();

                if (listaUsuariosConEntrada != null) {
                    for (UsuarioAuto ua : listaUsuariosConEntrada) {
                        listaUsuarios.remove(ua);
                    }
                    listaUsuariosAuto.addAll(listaUsuarios);
                }

            }
            if ("on".equalsIgnoreCase(usuariosMenoresDe18)) {
                List<UsuarioAuto> lista = usuarioAutoFacade.findMenores();
                if (lista != null) {
                    listaUsuariosAuto.addAll(lista);
                }
            }
            if ("on".equalsIgnoreCase(usuariosMayoresDe18)) {
                List<UsuarioAuto> lista = usuarioAutoFacade.findMayores();
                if (lista != null) {
                    listaUsuariosAuto.addAll(lista);
                }
            }
            if ("on".equalsIgnoreCase(usuariosFemeninos)) {
                List<UsuarioAuto> lista = usuarioAutoFacade.findMujeres();
                if (lista != null) {
                    listaUsuariosAuto.addAll(lista);
                }
            }

            if ("on".equalsIgnoreCase(usuariosMasculinos)) {
                List<UsuarioAuto> lista = usuarioAutoFacade.findHombres();
                if (lista != null) {
                    listaUsuariosAuto.addAll(lista);
                }
            }

            if (listaUsuariosAuto != null) {
                for (UsuarioAuto u : listaUsuariosAuto) {
                    EstudioUsuarios estudioU = new EstudioUsuarios();
                    estudioU.setIdEstudio(estudio);
                    estudioU.setIdUsuario(u);
                    estudioUsuariosFacade.create(estudioU);
                }
            }

        } else {
            List<Evento> listaEventos = new ArrayList<>();

            /*if ("on".equalsIgnoreCase(eventosConAforo)) {
                List<Evento> lista = eventoFacade.findAforo();
                if (lista != null) {
                    listaEventos.addAll(lista);
                }
            }

            if ("on".equalsIgnoreCase(eventosSinAforo)) {
                List<Evento> lista = eventoFacade.findNoAforo();
                if (lista != null) {
                    listaEventos.addAll(lista);
                }
            }*/

            if ("on".equalsIgnoreCase(eventosTerminados)) {
                List<Evento> lista = eventoFacade.findTerminados();
                if (lista != null) {
                    listaEventos.addAll(lista);
                }
            }

            if ("on".equalsIgnoreCase(eventosProximos)) {
                List<Evento> lista = eventoFacade.findProximos();
                if (lista != null) {
                    listaEventos.addAll(lista);
                }
            }

            if (listaEventos != null) {
                for (Evento e : listaEventos) {
                    EstudioEventos estudioE = new EstudioEventos();
                    estudioE.setIdEstudio(estudio);
                    estudioE.setIdEvento(e);
                    estudioEventosFacade.create(estudioE);
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
