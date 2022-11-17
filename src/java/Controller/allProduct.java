/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.City;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
public class allProduct extends HttpServlet {

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
//            out.println("<title>Servlet allProduct</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet allProduct at " + request.getContextPath() + "</h1>");
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
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("acc");
        Shop shop = getShopById(user.getUserID());
        DAO dao = new DAO();
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
            for (Product o : dao.getProduct()) {
                if (o.getShopID() == shop.getShopID()) {
                    lstProdct.add(o);
                }
            }
            ArrayList<Category> lstCategory = dao.getCategory();
            
            
        


            int total = lstProdct.size();
            request.setAttribute("total", total);

//                phan trang
            int size = lstProdct.size();
            int page, numberPerPage = 3;
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
            List<Product> lstPro = dao.getListByPage(lstProdct, start, end);

            request.setAttribute("data", lstPro);
            request.setAttribute("page", page);
//            request.setAttribute("number", num);

//            ServletContext context = getServletContext();
            //            context.getRequestDispatcher("/sortProduct").forward(request, response);
//            request.setAttribute("lstSearch", lstSearch);
            request.setAttribute("listOp", st);
            
            
            
            request.setAttribute("listC", lstCategory);
            request.setAttribute("listPro", lstProdct);
            request.setAttribute("listOp", st);
            request.getRequestDispatcher("./Views/shop/allProduct.jsp").forward(request, response);
//        }

        }

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
