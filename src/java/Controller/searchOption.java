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
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author ducda
 */
public class searchOption extends HttpServlet {

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
            out.println("<title>Servlet searchOption</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchOption at " + request.getContextPath() + "</h1>");
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
    private static List<OptionProduct> getPriceWithoutDuplicates(final List<OptionProduct> cars) {
        Set<OptionProduct> carSet = new TreeSet<OptionProduct>(new Utility());
        for (OptionProduct car : cars) {
            carSet.add(car);
        }
        List<OptionProduct> withoutDuplicates = new ArrayList<OptionProduct>(carSet);
        return withoutDuplicates;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        DAO dao = new DAO();
        PrintWriter out = response.getWriter();
        String brand = request.getParameter("brand");
        String mate = request.getParameter("mate");
        String priceOne = request.getParameter("priceOne");
        String priceSecond = request.getParameter("priceSecond");
        String type = request.getParameter("type");
        if (brand.isEmpty()) {
            brand = "empty";
        }
        if (mate.isEmpty()) {
            mate = "empty";
        }
        if (priceOne.isEmpty()) {
            priceOne = "empty";
        }
        if (priceSecond.isEmpty()) {
            priceSecond = "empty";
        }
        if (type.equals("0")) {
//            th1:
            if (!brand.equals("empty") && mate.equals("empty") && priceOne.equals("empty") && priceSecond.equals("empty")) {
                String sql = "select * from Product_HE161204 where ProductBrand like'%adsasd%'";
                ArrayList<Product> lstProduct = dao.getProductSearch(sql);
                ArrayList<OptionProduct> st = dao.getOptionPro();
                List<OptionProduct> lstOp = getPriceWithoutDuplicates(st);
                for (Product o : lstProduct) {
                    for (OptionProduct optionProduct : lstOp) {
                        if (o.getProductID() == optionProduct.getProductID()) {
                            out.println("<a href=\"viewProduct?id="+o.getProductID()+"\" class=\"proH\" style=\"margin-right: 10px; margin-bottom: 10px\">\n" +
"                                    <div style=\"width: 25%; height: 325px; padding: 0 10px; margin: 15px 10px 0 0;\" class=\"productCount\">\n" +
"                                        <div style=\"width: 210px; height: 325px; background-color: white;\" class=\"product-lst\">\n" +
"                                            <img src='"+o.getProductImg1()+"' width=\"220px\" height=\"220px\" alt=\"alt\"/>\n" +
"                                            <p style=\"width: 173px; height: 36px;font-size: 14px ;line-height: 18px; color: black; overflow: hidden; margin: 10px 5px 5px 5px\">"+o.getProductName()+"</p>\n" +
"                                            <div style=\"display: flex\">\n" +
"                                                <p style=\"margin: 5px 5px 0 7px; color: #f57224; font-size: 18px\">"+optionProduct.getOptionPrice()+"</p>\n" +
"                                            </div>\n" +
"                                            <p style=\"margin: 3px 5px 0 160px; opacity: 0.7; font-size: 12px; color: black\">Còn \n" +
"                                                "+optionProduct.getOptionQuan()+"</p>\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </a>");
                        }
                    }
                }

            } //            th2:
            else if (brand.equals("empty") && !mate.equals("empty") && priceOne.equals("empty") && priceSecond.equals("empty")) {
                //brand
            } //            th3:
            else if (brand.equals("empty") && mate.equals("empty") && !priceOne.equals("empty") && priceSecond.equals("empty")) {
                //brand
            } //            th4:
            else if (brand.equals("empty") && mate.equals("empty") && priceOne.equals("empty") && !priceSecond.equals("empty")) {
                //brand
            } //            th5:
            else if (!brand.equals("empty") && !mate.equals("empty") && priceOne.equals("empty") && priceSecond.equals("empty")) {
                //brand
//            th6:
            } else if (brand.equals("empty") && !mate.equals("empty") && !priceOne.equals("empty") && priceSecond.equals("empty")) {
                //brand
            } //            th7:
            else if (brand.equals("empty") && mate.equals("empty") && !priceOne.equals("empty") && !priceSecond.equals("empty")) {
                //brand
            } //           th8
            else if (!brand.equals("empty") && mate.equals("empty") && priceOne.equals("empty") && !priceSecond.equals("empty")) {
                //brand
            } //           th9
            else if (!brand.equals("empty") && !mate.equals("empty") && !priceOne.equals("empty") && priceSecond.equals("empty")) {
                //brand
            } //           th10
            else if (brand.equals("empty") && !mate.equals("empty") && !priceOne.equals("empty") && !priceSecond.equals("empty")) {
                //brand
            } //            th11
            else if (!brand.equals("empty") && mate.equals("empty") && !priceOne.equals("empty") && !priceSecond.equals("empty")) {
                //brand
            } //           th12
            else if (!brand.equals("empty") && !mate.equals("empty") && priceOne.equals("empty") && !priceSecond.equals("empty")) {
                //brand
            } //           th13
            else {
                out.println("hello");
            }
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
