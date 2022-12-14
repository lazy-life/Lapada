/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.User;
import Utility.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ducda
 */
public class changePass extends HttpServlet {

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
            out.println("<title>Servlet changePass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changePass at " + request.getContextPath() + "</h1>");
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
        if (user != null) {
            request.setAttribute("us", user);
            request.getRequestDispatcher("./Views/US/changePass.jsp").forward(request, response);
        }else{
            response.sendRedirect("login");
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
//        processRequest(request, response);
        DAO dao = new DAO();
        Utility uti = new Utility();
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("acc");
        if (user != null) {
            String oldPass = request.getParameter("oldPass");
            String newPass = request.getParameter("newPass");
            String rePass = request.getParameter("rePass");
            if (newPass.equals(rePass)) {
                for (User u : dao.getUs()) {
                    if (u.getUserID().equals(user.getUserID())) {
                        try {
                            if (u.getUserPass().equals(uti.toHexString(uti.getSHA(oldPass)))) {
                                String newP = uti.toHexString(uti.getSHA(newPass));
                                dao.UpdateUser(user.getUserID(), user.getUserName(), newP, user.getUserVeri(), user.getUserEmail(), user.getUserImg(), user.getUserStatus());
                                request.setAttribute("mess1", "M???t kh???u ???? ???????c thay ?????i");
                                doGet(request, response);
                            } else {
                                request.setAttribute("mess", "M???t kh???u c?? kh??ng ????ng");
                                doGet(request, response);
                            }
                        } catch (NoSuchAlgorithmException ex) {
                            Logger.getLogger(changePass.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            } else {
                request.setAttribute("mess", "M???t kh???u m???i kh??ng kh???p");
                doGet(request, response);
            }
        } else {
            response.sendRedirect("login");
        }
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
