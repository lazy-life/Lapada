/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.OptionProduct;
import Model.Product;
import Utility.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author ducda
 */
public class loadMore extends HttpServlet {

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
        String amount = request.getParameter("exits");
        int iamount = Integer.parseInt(amount);
        DAO dao = new DAO();
        ArrayList<Product> lstProduct = dao.getNext3Product(iamount);
        PrintWriter out = response.getWriter();
        ArrayList<OptionProduct> st = dao.getOptionPro();
        List<OptionProduct> lstOp = getPriceWithoutDuplicates(st);
        for (Product o : lstProduct) {
            for (OptionProduct optionProduct : lstOp) {
                if (o.getProductID() == optionProduct.getProductID()) {
                    out.println(" <a href=\"viewProduct?id=" + o.getProductID() + "\" class=\"proH\" style=\"margin-top: 10px; margin-right: 5px\">\n"
                            + "                                    <div style=\"width: 185px; height: 325px; padding: 0 5px 0 3px; margin: 5px 10px 0 0;\" class=\"productCount\">\n"
                            + "                                        <div style=\"width: 190px; height: 325px; background-color: white;\" class=\"product-lst\">\n"
                            + "                                            <img src='" + o.getProductImg1() + "' width=\"189px\" height=\"189px\" alt=\"alt\"/>\n"
                            + "                                            <p style=\"width: 173px; height: 36px;font-size: 14px ;line-height: 18px; color: black; overflow: hidden; margin: 10px 5px 5px 5px\">" + o.getProductName() + "</p>\n"
                            + "                                            <div style=\"display: flex\">\n"
                            + "                                                <p style=\"margin: 5px 5px 0 7px; color: #f57224; font-size: 18px\">" + optionProduct.getOptionPrice() + "</p>\n"
                            + "                                            </div>\n"
                            + "                                            <p style=\"margin: 3px 5px 0 130px; opacity: 0.7; font-size: 12px; color: black\">Còn \n"
                            + "                                                " + optionProduct.getOptionQuan() + "</p>\n"
                            + "                                        </div>\n"
                            + "                                    </div>\n"
                            + "                                </a>");
                }
            }
        }
    }

    private static List<OptionProduct> getPriceWithoutDuplicates(final List<OptionProduct> cars) {
        Set<OptionProduct> carSet = new TreeSet<OptionProduct>(new Utility());
        for (OptionProduct car : cars) {
            carSet.add(car);
        }
        List<OptionProduct> withoutDuplicates = new ArrayList<OptionProduct>(carSet);
        return withoutDuplicates;
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
