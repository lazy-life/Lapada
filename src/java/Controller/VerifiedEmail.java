/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.*;
import Utility.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
/**
 *
 * @author ducda
 */
public class VerifiedEmail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAO dao;

    public void init() {
        dao = new DAO();
    }
    Utility uti = new Utility();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
//        processRequest(request, response);
        String key1 = request.getParameter("key1");
        String key2 = request.getParameter("key2");
        try {
            User us = checkActive(key1, key2);
            if (us != null) {
                dao.UpdateUser(us.getUserID(), us.getUserName(), us.getUserPass(), 0, us.getUserEmail(), us.getUserImg(), 1);
                request.getRequestDispatcher("./Views/US/veriEmail.jsp").forward(request, response);
//                doGet(request, response);
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(VerifiedEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
//        request.getRequestDispatcher("./Views/US/veriEmail.jsp").forward(request, response);
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
//        processRequest(request, response);

    }

    public User checkActive(String key1, String key2) throws NoSuchAlgorithmException {
        for (User u : dao.getUs()) {
            String veriCode = u.getUserID() + String.valueOf(u.getUserVeri());
            if (key1.equals(uti.toHexString(uti.getSHA(veriCode))) && key2.equals(uti.toHexString(uti.getSHA(u.getUserID())))) {
                return u;
            }
        }
        return null;
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
