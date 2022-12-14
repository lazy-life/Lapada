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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author ducda
 */
public class sortProduct extends HttpServlet {

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
//        ArrayList<Product> lstP = request.getAttribute("ltSearch");
////            System.out.println();
//        String key = request.getAttribute("key");
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet sortProduct</title>");
//            out.println("</head>");
//            out.println("<body>");
//            for (Product o : lstP) {
//                out.println("<h1>Servlet sortProduct at " + o.getProductName() + "</h1>");
//            }
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
        DAO dao = new DAO();
        Cookie[] cookies = request.getCookies();
        String key = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("key")) {
                    key = cookie.getValue();
                }
            }
        }

        ArrayList<OptionProduct> lstOp = Utility.getDis(dao.getOptionAsc());
//        ArrayList<OptionProduct> lstOp1 = Collections.reverse(lstOp);;
        ArrayList<Product> lstSearch = dao.getSearchProduct(key);
        ArrayList<OptionProduct> st = dao.getOptionPro();
        Set<OptionProduct> set = new TreeSet<>(new Comparator<OptionProduct>() {
            @Override
            public int compare(OptionProduct o1, OptionProduct o2) {
                if (o1.getProductID() == (o2.getProductID())) {
                    return 0;
                }
                return 1;
            }
        });

        HttpSession ses = request.getSession();
        ArrayList<Product> lstSortName = dao.getSearchProduct1(key);
        set.addAll(st);
        st.clear();
        st.addAll(set);
        int size = lstSearch.size();
        int page, numberPerPage = 3;
        int num = (size % numberPerPage == 0 ? (size / numberPerPage) : (size / numberPerPage) + 1);
        ses.setAttribute("num", num);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numberPerPage;
        end = Math.min(page * numberPerPage, size);
        List<Product> lstPro = dao.getListByPage(lstSortName, start, end);

//        ArrayList<Product> lstSort1 = dao.getSearchProduct1(key);
        //getpara
        String type = request.getParameter("keyname");
        if (type.equals("tc")) {
            String pro = "";
            for (OptionProduct o : lstOp) {
                for (Product p : lstPro) {
                    if (o.getProductID() == p.getProductID()) {
                        pro = "<a href=\"viewProduct?id=" + p.getProductID() + "\" class=\"proH\" style=\"margin-right: 10px; margin-bottom: 10px\">\n"
                                + "                            <div style=\"width: 25%; height: 325px; padding: 0 10px; margin: 15px 10px 0 0;\" class=\"productCount\">\n"
                                + "                                <div style=\"width: 210px; height: 325px; background-color: white;\" class=\"product-lst\">\n"
                                + "                                    <img src='" + p.getProductImg1() + "' width=\"220px\" height=\"220px\" alt=\"alt\"/>\n"
                                + "                                    <p style=\"width: 173px; height: 36px;font-size: 14px ;line-height: 18px; color: black; overflow: hidden; margin: 10px 5px 5px 5px\">" + p.getProductName() + "</p>\n"
                                + "                                    <div style=\"display: flex\">\n"
                                + "                                        <p style=\"margin: 5px 5px 0 7px; color: #f57224; font-size: 18px\">" + o.getOptionPrice() + "</p>\n"
                                + "                                    </div>\n"
                                + "                                    <p style=\"margin: 3px 5px 0 160px; opacity: 0.7; font-size: 12px; color: black\">C??n " + o.getOptionQuan() + "</p>\n"
                                + "                                </div>\n"
                                + "                            </div>\n"
                                + "                        </a>\n";
                    }
                }
            }
            pro += "<div class=\"pageination\">\n"
                    + "                    <div style=\"justify-content: center; width: 100%; display:flex\">\n";
            for (int i = 1; i <= num; i++) {
                pro += "<a style=\"color: white; padding: 5px 7px; margin: 0 5px; font-size: 19px; border-radius: 7px;"
                        + "background-color: #f57224;\" href=\"sortProduct?page="+ i +"&searchLapada=${key}\">"+i+"</a>\n";
            }
            pro += "</div>\n" +
"                </div>";
            out.println(pro);
        } else if (type.equals("ct")) {
            Collections.reverse(lstOp);
            for (OptionProduct o : lstOp) {
                for (Product p : lstSortName) {
                    if (o.getProductID() == p.getProductID()) {
                        out.println("<a href=\"viewProduct?id=" + p.getProductID() + "\" class=\"proH\" style=\"margin-right: 10px; margin-bottom: 10px\">\n"
                                + "                            <div style=\"width: 25%; height: 325px; padding: 0 10px; margin: 15px 10px 0 0;\" class=\"productCount\">\n"
                                + "                                <div style=\"width: 210px; height: 325px; background-color: white;\" class=\"product-lst\">\n"
                                + "                                    <img src='" + p.getProductImg1() + "' width=\"220px\" height=\"220px\" alt=\"alt\"/>\n"
                                + "                                    <p style=\"width: 173px; height: 36px;font-size: 14px ;line-height: 18px; color: black; overflow: hidden; margin: 10px 5px 5px 5px\">" + p.getProductName() + "</p>\n"
                                + "                                    <div style=\"display: flex\">\n"
                                + "                                        <p style=\"margin: 5px 5px 0 7px; color: #f57224; font-size: 18px\">" + o.getOptionPrice() + "</p>\n"
                                + "                                    </div>\n"
                                + "                                    <p style=\"margin: 3px 5px 0 160px; opacity: 0.7; font-size: 12px; color: black\">C??n " + o.getOptionQuan() + "</p>\n"
                                + "                                </div>\n"
                                + "                            </div>\n"
                                + "                        </a>");
                    }
                }
            }
        } else if (type.equals("df")) {
            for (OptionProduct o : st) {
                for (Product p : lstSortName) {
                    if (o.getProductID() == p.getProductID()) {
                        out.println("<a href=\"viewProduct?id=" + p.getProductID() + "\" class=\"proH\" style=\"margin-right: 10px; margin-bottom: 10px\">\n"
                                + "                            <div style=\"width: 25%; height: 325px; padding: 0 10px; margin: 15px 10px 0 0;\" class=\"productCount\">\n"
                                + "                                <div style=\"width: 210px; height: 325px; background-color: white;\" class=\"product-lst\">\n"
                                + "                                    <img src='" + p.getProductImg1() + "' width=\"220px\" height=\"220px\" alt=\"alt\"/>\n"
                                + "                                    <p style=\"width: 173px; height: 36px;font-size: 14px ;line-height: 18px; color: black; overflow: hidden; margin: 10px 5px 5px 5px\">" + p.getProductName() + "</p>\n"
                                + "                                    <div style=\"display: flex\">\n"
                                + "                                        <p style=\"margin: 5px 5px 0 7px; color: #f57224; font-size: 18px\">" + o.getOptionPrice() + "</p>\n"
                                + "                                    </div>\n"
                                + "                                    <p style=\"margin: 3px 5px 0 160px; opacity: 0.7; font-size: 12px; color: black\">C??n " + o.getOptionQuan() + "</p>\n"
                                + "                                </div>\n"
                                + "                            </div>\n"
                                + "                        </a>");
                    }
                }
            }
        }
        //==1

        //==2
//        Collections.sort(lstP,new Utility());
//        request.setAttribute("lstP", lstP);
//in ra sang ben search
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
//
//    public static void main(String[] args) {
////        sortProduct sp = new sortProduct();
//    }
}
