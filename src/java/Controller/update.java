/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.Product;
import Model.User;
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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
/**
 *
 * @author ducda
 */
@MultipartConfig
public class update extends HttpServlet {

    DAO dao;

    public void init() {
        dao = new DAO();
    }

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
//            out.println("<title>Servlet update</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet update at " + request.getContextPath() + "</h1>");
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

    }

    public Product getPr(int id) {
        for (Product o : dao.getProduct()) {
            if (o.getProductID() == id) {
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
//if shop id = shop id thi cho update k thi thoi
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("acc");
        String nameProduct = request.getParameter("nameProduct");
        Part imgp1 = request.getPart("imgp1");
        Part imgp2 = request.getPart("imgp2");
        Part imgp3 = request.getPart("imgp3");
        Part imgp4 = request.getPart("imgp4");
        Part imgp5 = request.getPart("imgp5");
        String detailp = request.getParameter("detailp");
        String brandp = request.getParameter("brandp");
        String countryp = request.getParameter("countryp");
        String weightp = request.getParameter("weightp");
        String materialp = request.getParameter("materialp");
        String category = request.getParameter("category");
        
        String path1 = "";
        String path2 = "";
        String path3 = "";
        String path4 = "";
        String path5 = "";
        String prid1 = request.getParameter("prID");
        int prid = Integer.parseInt(prid1);
        Product pro = getPr(prid);
        if(detailp.isEmpty()){
            detailp = pro.getProductDetail();
        }
        String filePathSave = "/" + user.getUserID();
        String uploadFolder = request.getServletContext().getRealPath(filePathSave);
        Path uploadPath = Paths.get(uploadFolder);
        if (!Files.exists(uploadPath)) {
            Files.createDirectory(uploadPath); // neu chua ton tai foder postimg thi tao
        }
        String img1 = Paths.get(imgp1.getSubmittedFileName()).getFileName().toString(); // lay ra ten cua file moi chon
        String img2 = Paths.get(imgp2.getSubmittedFileName()).getFileName().toString(); // lay ra ten cua file moi chon
        String img3 = Paths.get(imgp3.getSubmittedFileName()).getFileName().toString(); // lay ra ten cua file moi chon
        String img4 = Paths.get(imgp4.getSubmittedFileName()).getFileName().toString(); // lay ra ten cua file moi chon
        String img5 = Paths.get(imgp5.getSubmittedFileName()).getFileName().toString(); // lay ra ten cua file moi chon
        if (imgp1.getSize() != 0) {
            imgp1.write(Paths.get(uploadPath.toString(), img1).toString());
            path1 += user.getUserID() + "/";
            path1 += imgp1.getSubmittedFileName();

        } else {
            path1 += pro.getProductImg1();
        }

        if (imgp2.getSize() != 0) {
            imgp2.write(Paths.get(uploadPath.toString(), img2).toString());
            path2 += user.getUserID() + "/";
            path2 += imgp2.getSubmittedFileName();

        } else {
            path2 += pro.getProductImg2();
        }
        if (imgp3.getSize() != 0) {
            imgp3.write(Paths.get(uploadPath.toString(), img3).toString());
            path3 += user.getUserID() + "/";
            path3 += imgp3.getSubmittedFileName();

        } else {
            path4 += pro.getProductImg3();
        }
        if (imgp4.getSize() != 0) {
            imgp4.write(Paths.get(uploadPath.toString(), img4).toString());
            path4 += user.getUserID() + "/";
            path4 += imgp4.getSubmittedFileName();

        } else {
            path4 += pro.getProductImg4();
        }
        if (imgp5.getSize() != 0) {
            imgp5.write(Paths.get(uploadPath.toString(), img5).toString());
            path5 += user.getUserID() + "/";
            path5 += imgp5.getSubmittedFileName();

        } else {
            path5 += pro.getProductImg5();
        }
        int cate = 0;
        cate = Integer.parseInt(category);

//        dao.updateProduct(prid, detailp, countryp, img1, img2, img3, img4, img5, prid, cate, countryp, countryp, pp4, materialp, uploadFolder, uploadFolder, uploadFolder, uploadFolder, path1, pp1, cate, cate, cate, cate, pp2, pp3, pp4, path2, path3, path4);
        dao.updateProduct(prid, detailp, nameProduct, path1, path2, path3, path4, path5, pro.getShopID(), cate, brandp, countryp, 34, materialp);
        response.sendRedirect("allProduct");
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
