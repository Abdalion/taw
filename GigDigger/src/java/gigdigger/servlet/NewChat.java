/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.servlet;
        
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import gigdigger.entity.*;
import javax.persistence.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jesus
 */


@WebServlet(name = "NewChat", urlPatterns = {"/NewChat"})
public class NewChat extends HttpServlet {


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
        
        EntityManagerFactory emf =
        Persistence.createEntityManagerFactory("GigDiggerPU");
        EntityManager em = emf.createEntityManager();
        
        
        HttpSession session = request.getSession();

        Integer id = Integer.parseInt(request.getParameter("id"));
        
        
        Usuario prueba = new Usuario();
        prueba.setId(id);
        
          //Query query = em.createNamedQuery("Country.findAll"); 
        TypedQuery<Chat> query;

        String consulta = "SELECT c FROM Chat c WHERE c.idUsuario.id = :idUser AND c.fechaFin IS NULL";
        query = em.createQuery(consulta, Chat.class).
               setParameter("idUser",id);
        
        List<Chat> results = query.getResultList(); 
        
        if(results.isEmpty()){
            
            
            Query queryTele = em.createNamedQuery("Usuario.findTeleoperadorLibre");
            
            List teleoperadores = queryTele.getResultList();
            
            if(teleoperadores.isEmpty()){
                
                //TODO: CONTROLAR ERROR EN JSP
                String msg = "No hay teleoperadores disponibles";
                session.setAttribute("msg", msg);
            }else{
                Query queryId = em.createNamedQuery("Usuario.findById")
                .setParameter("id",id);
            
                List<Usuario> resultado = queryId.getResultList();

                Chat nuevoChat = new Chat();
                nuevoChat.setIdUsuario(resultado.get(0));
            
                nuevoChat.setIdTeleoperador((Usuario)teleoperadores.get(0));
            
                nuevoChat.setMensajeList(new ArrayList());

                ArrayList<Mensaje> mensajes = (ArrayList<Mensaje>) nuevoChat.getMensajeList();

                session.setAttribute("mensajes", mensajes);
            }
            
        }else{
            
           Chat chat = results.get(0);
            
            //ArrayList<Mensaje> mensajes = (ArrayList<Mensaje>) chat.getMensajeList();
            
            ArrayList<Mensaje> mensajes = new ArrayList<Mensaje>(chat.getMensajeList());
            session.setAttribute("mensajes", mensajes);
        }
        
        //session.setAttribute("msg", msg);
        
        RequestDispatcher rd = request.getRequestDispatcher("ChatTeleoperador.jsp");
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
