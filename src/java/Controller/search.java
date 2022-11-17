/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.*;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
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
public class search extends HttpServlet {

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

        String key = request.getParameter("searchLapada");
        HttpSession ses = request.getSession();
        if (key.trim().length() == 0) {
            response.sendRedirect("Home");
        } else {
            request.setAttribute("key", key);
            List<Product> lstSearch = dao.getSearchProduct(key);
            ses.setAttribute("keyS", key);

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

            ArrayList<String> lstBrandPro = dao.getSearchBrand(key);
            ArrayList<String> lstMaterial = dao.getMaterial(key);

            int total = lstSearch.size();
            request.setAttribute("key", key);
            request.setAttribute("total", total);
            Cookie c = new Cookie("key", key);
            response.addCookie(c);

//                phan trang
            int size = lstSearch.size();
            int page, numberPerPage = 6;
            int num = (size % numberPerPage == 0 ? (size / numberPerPage) : (size / numberPerPage)+ 1);
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
            List<Product> lstPro = dao.getListByPage(lstSearch, start, end);

            request.setAttribute("data", lstPro);
            request.setAttribute("page", page);
//            request.setAttribute("number", num);

//            ServletContext context = getServletContext();
            //            context.getRequestDispatcher("/sortProduct").forward(request, response);
//            request.setAttribute("lstSearch", lstSearch);
            request.setAttribute("lstBrand", lstBrandPro);
            request.setAttribute("lstMaterial", lstMaterial);
            request.setAttribute("listOp", st);
            request.getRequestDispatcher("./Views/US/Search.jsp").forward(request, response);
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
