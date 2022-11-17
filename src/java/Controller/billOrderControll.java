/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.*;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import static javax.management.Query.div;

/**
 *
 * @author ducda
 */
public class billOrderControll extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet billOrderControll</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet billOrderControll at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        processRequest(request, response);
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        String id = request.getParameter("orderID");
        String type = request.getParameter("type");

        if (type.equals("1")) {
            int Oid = Integer.parseInt(id);
            dao.updateOrder(Oid, 4);
        } else if (type.equals("0")) {
            int Oid = Integer.parseInt(id);
            dao.updateOrder(Oid, 1);
        } else if (type.equals("2")) {
            int Oid = Integer.parseInt(id);
            String cmt = request.getParameter("cmt");
            dao.updateCmt(Oid, cmt);
        }
    }

    public int getShopById(String id) {
        DAO dao = new DAO();
        for (Shop o : dao.getShop()) {
            if (o.getUserID().equals(id)) {
                return o.getShopID();
            }
        }
        return 0;
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
        String cmt = request.getParameter("cmtGreen");
        String id = request.getParameter("id");
        int idc = Integer.parseInt(id);
        String idO = request.getParameter("idO");
        int idOc = Integer.parseInt(idO);
        DAO dao = new DAO();
        dao.updateCmt(idc, cmt);
        dao.updateOrder(idOc, 5);
        response.sendRedirect("myOrder");
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
