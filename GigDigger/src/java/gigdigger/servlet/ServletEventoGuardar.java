/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.EtiquetaEventoFacade;
import gigdigger.dao.EtiquetaFacade;
import gigdigger.dao.EventoFacade;
import gigdigger.dao.UsuarioFacade;
import gigdigger.entity.Etiqueta;
import gigdigger.entity.EtiquetaEvento;
import gigdigger.entity.Evento;
import gigdigger.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
 * @author ruben
 */
@WebServlet(name = "ServletEventoGuardar", urlPatterns = {"/ServletEventoGuardar"})
public class ServletEventoGuardar extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    @EJB
    private EventoFacade eventoFacade;

    @EJB
    private EtiquetaFacade etiquetaFacade;

    @EJB
    private EtiquetaEventoFacade etiquetaEventoFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        
        String titulo, descripcion, fecha, fechaLimite, aforo, precio, limiteEntradas, nFilas, nAsientosFila;
        String[] listaEtiquetasSeleccionadas = request.getParameterValues("etiquetasSeleccionadas");

        titulo = request.getParameter("titulo");
        descripcion = request.getParameter("descripcion");
        fecha = request.getParameter("fecha");
        fechaLimite = request.getParameter("fechaLimite");
        aforo = request.getParameter("aforo");
        precio = request.getParameter("precio");
        limiteEntradas = request.getParameter("limiteEntradas");
        nFilas = request.getParameter("nFilas");
        nAsientosFila = request.getParameter("nAsientosFila");

        Evento nuevoEvento = new Evento();

        nuevoEvento.setTitulo(titulo);
        nuevoEvento.setDescripcion(descripcion);
        nuevoEvento.setFechaEvento(new SimpleDateFormat("yyyy-MM-dd").parse(fecha));
        //nuevoEvento.setFechaEvento(new SimpleDateFormat("dd/MM/yyyy").parse("02/03/2021"));
        nuevoEvento.setFechaLimite(new SimpleDateFormat("yyyy-MM-dd").parse(fechaLimite));
        //nuevoEvento.setFechaLimite(new SimpleDateFormat("dd/MM/yyyy").parse("05/04/2021"));
        nuevoEvento.setAforo(Integer.parseInt(aforo));
        nuevoEvento.setPrecio(Double.parseDouble(precio));
        nuevoEvento.setLimiteUsuario(Integer.parseInt(limiteEntradas));
        nuevoEvento.setNFilas(Integer.parseInt(nFilas));
        nuevoEvento.setNAsientosFila(Integer.parseInt(nAsientosFila));
            
        HttpSession session = request.getSession();
        Usuario u = usuarioFacade.find(session.getAttribute("userId"));
        nuevoEvento.setIdCreador(u);
        this.eventoFacade.create(nuevoEvento);

        List<Etiqueta> etiquetas = etiquetaFacade.findAll();
        if (listaEtiquetasSeleccionadas != null) {
            for (String e : listaEtiquetasSeleccionadas) {
                for (Etiqueta etiqueta : etiquetas) {
                    if (e.equalsIgnoreCase(etiqueta.getEtiqueta())) {
                        EtiquetaEvento nuevaEtiquetaEvento = new EtiquetaEvento();
                        nuevaEtiquetaEvento.setIdEtiqueta(etiqueta);
                        nuevaEtiquetaEvento.setIdEvento(nuevoEvento);
                        etiquetaEventoFacade.create(nuevaEtiquetaEvento);
                    }
                }
            }
        }

        response.sendRedirect("/");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ServletEventoGuardar.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ServletEventoGuardar.class.getName()).log(Level.SEVERE, null, ex);
        }
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
