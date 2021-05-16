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
import gigdigger.entity.Evento;
import gigdigger.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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
@WebServlet(name = "ServletPerfil", urlPatterns = {"/ServletPerfil"})
public class ServletPerfil extends HttpServlet {

    @EJB
    private EventoFacade eventoFacade;

    @EJB
    private EntradaFacade entradaFacade;

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

        HttpSession session = request.getSession();
        if(session.getAttribute("userId") != null) {
            Usuario usuario = usuarioFacade.find(session.getAttribute("userId"));
            request.setAttribute("usuario", usuario);
            
            if(usuario.getRol().equals("AUTOREGISTRADO")) {
                List<Entrada> entradas = entradaFacade.findByUserId(usuario.getId());
                HashMap<Evento, List<Entrada>> eventosEntradas = new HashMap<>();
                if(entradas != null) {
                    for(Entrada e : entradas){
                    Evento ev = eventoFacade.find(e.getIdEvento().getId());
                    List<Entrada> entradasParaEseEvento;
                    if(eventosEntradas.containsKey(ev)) {
                        entradasParaEseEvento = eventosEntradas.get(ev);
                    }else{
                        entradasParaEseEvento = new ArrayList<>();
                    }
                        entradasParaEseEvento.add(e);
                        eventosEntradas.put(ev, entradasParaEseEvento);
                    }
                }
                
                request.setAttribute("eventosEntradas", eventosEntradas);
            }else if(usuario.getRol().equals("ANALISTA")) {
                
            }else if(usuario.getRol().equals("CREADOR")) {
                request.setAttribute("eventosCreador", eventoFacade.findByCreador(usuario));
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("Perfil.jsp");
            rd.forward(request, response);
        }else {
            response.sendRedirect("MainServlet");
        }
        
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
