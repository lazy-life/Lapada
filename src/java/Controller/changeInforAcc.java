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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author ducda
 */
@MultipartConfig
public class changeInforAcc extends HttpServlet {

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
            out.println("<title>Servlet changeInforAcc</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changeInforAcc at " + request.getContextPath() + "</h1>");
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
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("acc");
        if(user != null){
            String name = request.getParameter("nameUs");
            String email = request.getParameter("mail");
            String phone = request.getParameter("phone");
            Part imgp1 = request.getPart("avt");
            String path1 = "";
            String filePathSave = "/" + user.getUserID();
            String uploadFolder = request.getServletContext().getRealPath(filePathSave);
            Path uploadPath = Paths.get(uploadFolder);
            if (!Files.exists(uploadPath)) {
                Files.createDirectory(uploadPath); // neu chua ton tai foder postimg thi tao
            }
            String img1 = Paths.get(imgp1.getSubmittedFileName()).getFileName().toString(); // l
            if (imgp1.getSize() != 0) {
                imgp1.write(Paths.get(uploadPath.toString(), img1).toString());
                path1 += user.getUserID() + "/";
                path1 += imgp1.getSubmittedFileName();

            } else {
                path1 += user.getUserImg();
            }
            DAO dao = new DAO();
            dao.UpdateFullUser(user.getUserID(), phone, name, user.getUserPass(), user.getUserVeri(), email, path1, user.getUserStatus());
//        request.getRequestDispatcher("changeInfor").forward(request, response);
            response.sendRedirect("changeInfor");
        }else{
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
