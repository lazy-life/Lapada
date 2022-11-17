/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
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
/**
 *
 * @author ducda
 */
public class cart extends HttpServlet {

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
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("acc");
        if (user == null) {
            response.sendRedirect("login");
        } else {
            ArrayList<Cart> lstCart = dao.getCartById(user.getUserID());
            ArrayList<OptionProduct> lstOp = new ArrayList<>();
            ArrayList<Product> lstPro = new ArrayList<>();
            ArrayList<Shop> lstSh = new ArrayList<>();
            for (Cart c : lstCart) {
                for (OptionProduct o : dao.getOptionPro()) {
                    if(c.getOptionID() == o.getOptionID()){
                        lstOp.add(o);
                    }
                }
            }
            
            PrintWriter out = response.getWriter();
//            out.println(lstSh);
            //them product vao moi in ra duoc
            int max = -5;
            request.setAttribute("maxCart", max);
            request.setAttribute("listCart", lstCart);
            request.setAttribute("listPro", dao.getProduct());
            request.setAttribute("listOp", lstOp);
            request.setAttribute("listSh", dao.getShop());
            request.getRequestDispatcher("./Views/US/Cart.jsp").forward(request, response);
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
