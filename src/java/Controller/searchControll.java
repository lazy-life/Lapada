/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.Category;
import Model.OptionProduct;
import Model.Product;
import Model.Shop;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author ducda
 */
public class searchControll extends HttpServlet {

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

    }

    public Shop getShopById(String id) {
        DAO dao = new DAO();
        for (Shop o : dao.getShop()) {
            if (o.getUserID().equals(id)) {
                return o;
            }
        }
        return null;
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
        String key = request.getParameter("txt");
        HttpSession ses = request.getSession();
        DAO dao = new DAO();
        List<Product> lstSearch = dao.getSearchProduct(key);
        User user = (User) ses.getAttribute("acc");
        Shop shop = getShopById(user.getUserID());
        if (shop == null) {
            response.sendRedirect("signupShop");
        } else {
            ArrayList<Product> lstProdct = new ArrayList<>();
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

            set.addAll(st);
            st.clear();
            st.addAll(set);
            for (Product o : lstSearch) {
                if (o.getShopID() == shop.getShopID()) {
                    lstProdct.add(o);
                }
            }
            ArrayList<Category> lstCategory = dao.getCategory();

            int total = lstProdct.size();
            request.setAttribute("total", total);
            PrintWriter out = response.getWriter();
            for (Product p : lstProdct) {
                for (OptionProduct o : st) {
                    if (p.getProductID() == o.getProductID()) {
                        out.println("<div style=\"display: flex; border-top: 1px solid #cbced5; padding-top: 5px; padding-bottom: 15px;\"\n"
                                + "                                 class=\"mid\">\n"
                                + "                                <div style=\"width: 460px;\" class=\"inf\">\n"
                                + "                                    <div style=\"display: flex; margin-left: 40px;  font-size: 14px; margin-top: 6px; font-weight: 470;\">\n"
                                + "                                        <img style=\"border-radius: 10px;\" src=\""+ p.getProductImg1() +"\" alt=\"\" width=\"48px\"\n"
                                + "                                             height=\"48px\">\n"
                                + "                                        <p style=\"margin-left: 10px; margin-top: 0px; font-weight: bold; font-size: 14px; width: 400px; height: 40px;\n"
                                + "                                           overflow: hidden;\">" + p.getProductName() + "</p>\n"
                                + "                                    </div>\n"
                                + "                                </div>\n"
                                + "                                <div style=\"width: 202px;\" class=\"price\">\n"
                                + "                                    <p style=\"margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470;\">\n"
                                + "                                        <span style=\"margin-right: 2px; font-size: 12px;\">₫</span>" + o.getOptionPrice() + "\n"
                                + "                                    </p>\n"
                                + "                                </div>\n"
                                + "                                <div style=\"width: 182px;\" class=\"quan\">\n"
                                + "                                    <p style=\"margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470;\">" + o.getOptionQuan() + "</p>\n"
                                + "                                </div>\n"
                                + "                                <div style=\"width: 220px; height: 45px; overflow: hidden;\" class=\"contn\">\n"
                                + "                                    <p\n"
                                + "                                        style=\"margin-left: 20px; font-size: 13px; margin-top: 6px; font-weight: 470; text-align: justify;\">" + p.getProductDetail() + "</p>\n"
                                + "                                </div>\n"
                                + "                                <div style=\"width: 130px;\" class=\"optional\">\n"
                                + "                                    <a style=\"font-size: 14px; margin-left: 40px; font-weight: 450; margin-top: 10px; color: #1a71ff;\"\n"
                                + "                                       href='UpdateNewProduct?id=" + p.getProductID() + "'>Chỉnh sửa</a>\n"
                                + "                                    <a onclick=\"deleteProduct(" + p.getProductID() + ")\" style=\"font-size: 14px; margin-left: 40px; font-weight: 450; margin-top: 10px; color: #1a71ff;\"\n"
                                + "                                       href=''>Xoá</a>\n"
                                + "                                </div>\n"
                                + "                            </div>");
                    }
                }
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
