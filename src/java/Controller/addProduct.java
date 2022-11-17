/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.Category;
import Model.Product;
import Model.Shop;
import Model.User;
import Model.tempOp;
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

/**
 *
 * @author ducda
 */
@MultipartConfig
public class addProduct extends HttpServlet {

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
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet addProduct</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet addProduct at " + request.getContextPath() + "</h1>");
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
        ArrayList<Category> lstCategory = dao.getCategory();
        request.setAttribute("listC", lstCategory);
        request.getRequestDispatcher("./Views/shop/addProduct.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
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
        String nameOP = request.getParameter("nameOp");
        String priceOP = request.getParameter("priceOp");
        String quanOP = request.getParameter("quanOp");
        String path1 = "";
        String path2 = "";
        String path3 = "";
        String path4 = "";
        String path5 = "";
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
        imgp1.write(Paths.get(uploadPath.toString(), img1).toString());
        path1 += user.getUserID() + "/";
        if (imgp2.getSize() != 0) {
            imgp2.write(Paths.get(uploadPath.toString(), img2).toString());
            path2 += user.getUserID() + "/";
        }
        if (imgp3.getSize() != 0) {
            imgp3.write(Paths.get(uploadPath.toString(), img3).toString());
            path3 += user.getUserID() + "/";
        }
        if (imgp4.getSize() != 0) {
            imgp4.write(Paths.get(uploadPath.toString(), img4).toString());
            path4 += user.getUserID() + "/";
        }
        if (imgp5.getSize() != 0) {
            imgp5.write(Paths.get(uploadPath.toString(), img5).toString());
            path5 += user.getUserID() + "/";
        }
        path1 += imgp1.getSubmittedFileName();
        path2 += imgp2.getSubmittedFileName();
        path3 += imgp3.getSubmittedFileName();
        path4 += imgp4.getSubmittedFileName();
        path5 += imgp5.getSubmittedFileName();

//        float priceOPC = Float.parseFloat(priceOP);
//        int quanOPC = Integer.parseInt(quanOP);
        float pp3 = 0;
        float weightPro = 0;

        int cate = 0;
        cate = Integer.parseInt(category);
        weightPro = Float.parseFloat(weightp);
        int key = randomKey();
        String keyC = String.valueOf(key);
        int shopID = getShopId(user.getUserID());
        dao.InsertProduct(detailp, nameProduct, path1, path2, path3, path4, path5, shopID, cate, brandp, countryp, weightPro, materialp, key);
        int prID = 0;
        for (Product p : dao.getProduct()) {
            if (p.getCodeCheck() == key) {
                prID = p.getProductID();
                break;
            }
        }
        ArrayList<tempOp> lstT = Utility.Utility.getTemp();
        for (tempOp op : lstT) {
            String name = op.getName();
            float price = Float.parseFloat(op.getPrice());
            int amount = Integer.parseInt(op.getQuan());
            dao.InsertOption(name, price, amount, prID);
        }
        dao.updateProductCode(prID, 0);
        Utility.Utility.removeAll();
        response.sendRedirect("allProduct");
    }

    public int getShopId(String usId) {
        for (Shop o : dao.getShop()) {
            if (o.getUserID().equals(usId)) {
                return o.getShopID();
            }
        }
        return 0;
    }

    public int randomKey() {
        Random r = new Random();
        int low = 10;
        int high = 100;
        int result = r.nextInt(high - low) + low;
        return result;
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
