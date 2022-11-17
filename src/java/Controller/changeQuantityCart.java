/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.Cart;
import Model.Product;
import Model.User;
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

/**
 *
 * @author ducda
 */
public class changeQuantityCart extends HttpServlet {

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
            out.println("<title>Servlet changeQuantityCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changeQuantityCart at " + request.getContextPath() + "</h1>");
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
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("acc");
        PrintWriter out = response.getWriter();
        String total = request.getParameter("amount");
        String idCart = request.getParameter("idCart");
        String idCartD = request.getParameter("idCartD");
        String type = request.getParameter("type");
        DAO dao = new DAO();
        if (type.equals("1")) {
            int totalC = Integer.parseInt(total);
            int idCartC = Integer.parseInt(idCart);
            int sum = totalC + 1;
            dao.updateCart(sum, idCartC);
        } else if (type.equals("0")) {
            int totalC = Integer.parseInt(total);
            int idCartC = Integer.parseInt(idCart);
            int sum = totalC - 1;
            dao.updateCart(sum, idCartC);
        } else if (type.equals("2")) {
            int idCartC = Integer.parseInt(idCart);
            dao.deleteCart(idCartC);

//            ArrayList<Cart> lstCart = dao.getCartById(user.getUserID());
//            ArrayList<Product> lstPro = new ArrayList<>();
//            for (Product o : dao.getProduct()) {
//                for (Cart c : dao.getCartById(user.getUserID())) {
//                    if (o.getProductID() == c.getProductID()) {
//                        lstPro.add(o);
//                    }
//                }
//            }
//            request.getRequestDispatcher("./Views/US/Cart.jsp").forward(request, response);
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
