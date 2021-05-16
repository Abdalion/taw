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

/**
 *
 * @author ruben
 */
@WebServlet(name = "ServletEstudioGuardar", urlPatterns = {"/ServletEstudioGuardar"})
public class ServletEstudioGuardar extends HttpServlet {

    @EJB
    private EntradaFacade entradaFacade;

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
        String idCreador = request.getParameter("id");

        Estudio estudio = new Estudio();
        estudio.setNombreEstudio(nombre);
        estudio.setDescripcion(descripcion);
        estudio.setTipo(tipo);

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaCreacion = new Date(System.currentTimeMillis());

        estudio.setFechaCreacion(fechaCreacion);

        Usuario creador = usuarioFacade.findByID(new Integer(idCreador));

        estudio.setCreadorEstudio(creador);

        /*if(usuariosConEventos.equalsIgnoreCase("on")){
            //listaUsuariosAuto.addAll(usuarioFacade.findByHasEvents());
        }*/
        estudioFacade.create(estudio);

        if (tipo.equalsIgnoreCase("Usuarios")) {
            List<UsuarioAuto> listaUsuariosAuto = new ArrayList<>();

            if ("on".equalsIgnoreCase("usuariosConEventos")) {
                List<Integer> listaUsuariosConEntrada = entradaFacade.findIdUsuariosConEntrada();

                for (Integer i : listaUsuariosConEntrada) {
                    UsuarioAuto u = usuarioAutoFacade.find(i);
                    listaUsuariosAuto.add(u);
                }

            }
            if ("on".equalsIgnoreCase("usuariosSinEventos")) {
                List<Integer> listaUsuariosConEntrada = entradaFacade.findIdUsuariosConEntrada();
                List<UsuarioAuto> listaUsuarios = usuarioAutoFacade.findAll();

                for (Integer i : listaUsuariosConEntrada) {
                    UsuarioAuto u = usuarioAutoFacade.find(i);
                    listaUsuarios.remove(u);
                }
                listaUsuariosAuto.addAll(listaUsuarios);
            }
            if ("on".equalsIgnoreCase(usuariosMenoresDe18)) {
                listaUsuariosAuto.addAll(usuarioAutoFacade.findMenores());
            }
            if ("on".equalsIgnoreCase(usuariosMayoresDe18)) {
                listaUsuariosAuto.addAll(usuarioAutoFacade.findMayores());
            }
            if ("on".equalsIgnoreCase(usuariosFemeninos)) {
                listaUsuariosAuto.addAll(usuarioAutoFacade.findMujeres());
            }

            if ("on".equalsIgnoreCase(usuariosMasculinos)) {
                listaUsuariosAuto.addAll(usuarioAutoFacade.findHombres());
            }

            for (UsuarioAuto u : listaUsuariosAuto) {
                EstudioUsuarios estudioU = new EstudioUsuarios();
                estudioU.setIdEstudio(estudio);
                estudioU.setIdUsuario(u);
                estudioUsuariosFacade.create(estudioU);
            }

        } else {
            List<Evento> listaEventos = new ArrayList<>();

            if ("on".equalsIgnoreCase(eventosConAforo)) {
                listaEventos.addAll(eventoFacade.findAforo());
            }

            if ("on".equalsIgnoreCase(eventosSinAforo)) {
                listaEventos.addAll(eventoFacade.findNoAforo());
            }

            if ("on".equalsIgnoreCase(eventosTerminados)) {
                listaEventos.addAll(eventoFacade.findTerminados());
            }

            if ("on".equalsIgnoreCase(eventosProximos)) {
                listaEventos.addAll(eventoFacade.findProximos());
            }

            for (Evento e : listaEventos) {
                EstudioEventos estudioE = new EstudioEventos();
                estudioE.setIdEstudio(estudio);
                estudioE.setIdEvento(e);
                estudioEventosFacade.create(estudioE);
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
