/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.OptionProduct;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

/**
 *
 * @author ducda
 */
public class three extends HttpServlet {

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

//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet loadMore</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet loadMore at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
        String name = request.getParameter("name");
        String qu = request.getParameter("quan");
        String pr = request.getParameter("price");

        Utility.Utility.addOP(name, pr, qu);
        if (Utility.Utility.getTemp().isEmpty()) {
            out.println("so1");
        } else {
            out.println("<div style=\"width: 100%; height: 50px; display: flex\">\n"
                    + "                            <input type=\"text\"style=\"width: 35%; height: 100%; text-align: center; margin-top: 0; font-size: 14px;\n"
                    + "                                   font-weight: 500\" placeholder=\"Ví Dụ: màu sắc, kích thước,...\"  value=\"" + name + "\" readonly>\n"
                    + "                            <input type=\"text\" style=\"width:30%; height: 100%;text-align: center;\n"
                    + "                                   padding-top: 0; font-size: 14px; font-weight: 500\" placeholder=\"Giá theo VND\" value=\"" + pr + "\" readonly>\n"
                    + "                            <input type=\"text\" readonly value=\"" + qu + "\" style=\"width: 35%; height: 100%;text-align: center; margin-top: 0; font-size: 14px; font-weight: 500\" placeholder=\"Số lượng\">\n"
                    + "                        </div>");
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
