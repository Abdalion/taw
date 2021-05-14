/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.EntradaFacade;
import gigdigger.dao.EtiquetaEventoFacade;
import gigdigger.dao.EtiquetaFacade;
import gigdigger.dao.EventoFacade;
import gigdigger.dao.UsuarioFacade;
import gigdigger.entity.Entrada;
import gigdigger.entity.Etiqueta;
import gigdigger.entity.EtiquetaEvento;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author egonb
 */
@WebServlet(name = "ServletEvento", urlPatterns = {"/ServletEvento"})
public class ServletEvento extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    @EJB
    private EntradaFacade entradaFacade;

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
    private EventoFacade eventoFacade;
    
    @EJB
    private EtiquetaFacade etiquetaFacade;
    
    @EJB
    private EtiquetaEventoFacade etiquetaEventoFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Integer eventoId;
        if(request.getParameter("eventoId") != null)
            eventoId = new Integer(request.getParameter("eventoId"));
        else
            //Si lo estoy llamando desde ServletCrearReserva
            eventoId = (Integer)request.getAttribute("eventoId");
            
        Evento e = eventoFacade.find(eventoId);
        request.setAttribute("evento", e);
        
        //TO-DO:obtener el userid de la sesion
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") != null) {
            Usuario usuario = usuarioFacade.find(session.getAttribute("userId"));
            request.setAttribute("usuario", usuario);
            request.setAttribute("userId", usuario.getId());
        }
        
        List<EtiquetaEvento> listaEtiquetasEventos = etiquetaEventoFacade.findAll();
        List<Etiqueta> listaEtiquetas = etiquetaFacade.findAll();
        request.setAttribute("listaEtiquetas", listaEtiquetas);
        request.setAttribute("listaEtiquetasEventos", listaEtiquetasEventos);
        
        List<Entrada> entradas = entradaFacade.findByEventoId(e.getId());
        
        request.setAttribute("entradas", entradas);
        
        RequestDispatcher rd = request.getRequestDispatcher("Evento.jsp");
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
