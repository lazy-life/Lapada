/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.OptionProduct;
import Model.Product;
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
public class searchCate extends HttpServlet {

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
            out.println("<title>Servlet searchCate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchCate at " + request.getContextPath() + "</h1>");
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
        DAO dao = new DAO();
        HttpSession ses = request.getSession();
        String key = request.getParameter("idC");

        ArrayList<Product> lstSearch = new ArrayList<>();
        for (Product p : dao.getProduct()) {
            if (p.getCategoryID() == Integer.parseInt(key)) {
                lstSearch.add(p);
            }
        }
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

        String sqlB = "select DISTINCT ProductBrand from Product_HE161204 where CategoryID = " + key;
        ArrayList<String> lstBrandPro = dao.getSearchBrandS(sqlB);
        String sqlM = "select DISTINCT ProductMaterial from Product_HE161204 where CategoryID = " + key;
        ArrayList<String> lstMaterial = dao.getMaterialS(sqlM);

        int total = lstSearch.size();
        request.setAttribute("key", key);
        request.setAttribute("total", total);
        Cookie c = new Cookie("key", key);
        response.addCookie(c);

//                phan trang
        int size = lstSearch.size();
        int page, numberPerPage = 6;
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
        List<Product> lstPro = dao.getListByPage(lstSearch, start, end);

        request.setAttribute("data", lstPro);
        request.setAttribute("page", page);
        request.setAttribute("total", total);
        request.setAttribute("lstSearch", lstSearch);
        request.setAttribute("lstBrand", lstBrandPro);
        request.setAttribute("lstMaterial", lstMaterial);
        request.setAttribute("listOp", st);
        request.getRequestDispatcher("./Views/US/Search.jsp").forward(request, response);

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
