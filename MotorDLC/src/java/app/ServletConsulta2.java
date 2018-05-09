/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import bd.TablaPosteo;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dlcusr
 */
public class ServletConsulta2 extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
//        String dest = "";
        try {
            Renombrar gestor= new Renombrar();
                        
//            Map vocab=tp.loadVocabulario(); //Esto no se deberia hacer aca, sino que se deberia cargar el vocabulario una vez (en servletMotor)
            
            HttpSession session = request.getSession();
            Map vocabulario = (Map) session.getAttribute("vocabulario");
            
            String consulta=request.getParameter("txt_busqueda");
            
            List resultado=gestor.rankeo(vocabulario, consulta);
            
            if (resultado==null) {
                request.setAttribute("resultado",null);
            }
            else
            {  request.setAttribute("resultado",resultado); 
            }
            
        }
        catch (ClassNotFoundException e) {
//             errorMsg = new ErrorMsg(errorTitle, e.getMessage());
//            request.setAttribute("errorMsg", errorMsg);
        }
        ServletContext app = this.getServletContext();
        RequestDispatcher disp = app.getRequestDispatcher("/index.jsp");
        disp.forward(request, response);
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