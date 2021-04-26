/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.EventoFacade;
import gigdigger.entity.Evento;
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

/**
 *
 * @author ruben
 */
@WebServlet(name = "ServletEventoGuardar", urlPatterns = {"/ServletEventoGuardar"})
public class ServletEventoGuardar extends HttpServlet {
    
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
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        String titulo, descripcion, fecha, fechaLimite, aforo, precio, limiteEntradas, nFilas, nAsientosFila;
        
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
        
        this.eventoFacade.create(nuevoEvento);        
        
        response.sendRedirect("ServletEventoListar");  
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
