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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
/**
 *
 * @author ducda
 */
public class addCart extends HttpServlet {

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
        String amount = request.getParameter("amount");
        String idPr = request.getParameter("idPr");
        String idOp = request.getParameter("idOp");
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        int quantity = Integer.parseInt(amount);
        int ProductId = Integer.parseInt(idPr);
        int OptionId = Integer.parseInt(idOp);
        Product pro = getProductById(ProductId);
        Cart cart = getCardById(OptionId,user.getUserID());
        if (cart == null) {
            dao.InsertCart(quantity, user.getUserID(), pro.getShopID(), ProductId, OptionId);
        }else{
            dao.updateCart(cart.getProductAmount()+quantity, cart.getCartID());
        }
//        out.println("<p>"+ quantity + " " + ProductId + " " + shop.getShopID() + " " + user.getUserID() +"</p>");

    }

    public Product getProductById(int id) {
        DAO dao = new DAO();
        for (Product o : dao.getProduct()) {
            if (o.getProductID() == id) {
                return o;
            }
        }
        return null;
    }

    public Cart getCardById(int prId, String usid) {
        DAO dao = new DAO();
        for (Cart o : dao.getCart()) {
            if (o.getOptionID()== prId && o.getUserID().equals(usid)) {
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
