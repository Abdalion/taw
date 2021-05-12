/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;

import gigdigger.dao.EntradaFacade;
import gigdigger.dao.EventoFacade;
import gigdigger.dao.UsuarioFacade;
import gigdigger.entity.Entrada;
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
 * @author egonb
 */
@WebServlet(name = "ServletCrearReserva", urlPatterns = {"/ServletCrearReserva"})
public class ServletCrearReserva extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    @EJB
    private EventoFacade eventoFacade;

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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String[] entradas = request.getParameterValues("entrada");
        String eventoId = request.getParameter("eventoId");
        List<Entrada> entradasList = new ArrayList<>();
        //TO-DO:obtener el userid de la sesion
        String userId = "1";
        for(String s : entradas) {
          System.out.println(s);
          Entrada e = new Entrada();
          e.setFila(Integer.parseInt(s.split(",")[0]));
          e.setAsiento(Integer.parseInt(s.split(",")[1]));
          e.setIdUsuario(usuarioFacade.find(Integer.parseInt(userId)));
          e.setIdEvento(eventoFacade.find(Integer.parseInt(eventoId)));
          entradasList.add(e);
          entradaFacade.create(e);
        }
        request.setAttribute("entradas", entradasList);
        
        RequestDispatcher rd = request.getRequestDispatcher("ReservaCreada.jsp");
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
