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
import java.util.ArrayList;
import java.util.Arrays;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

/**
 *
 * @author ducda
 */
public class buyOrderProduct extends HttpServlet {

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
//            out.println("<title>Servlet buyOrderProduct</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet buyOrderProduct at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("acc");
        String idCarts = (String) getServletContext().getAttribute("idCarts");
        String[] strSplit = idCarts.split(",");
        ArrayList<String> cartList = new ArrayList<String>(
                Arrays.asList(strSplit));

        ArrayList<Cart> lstC = new ArrayList<>();
        ArrayList<OptionProduct> lstOp = new ArrayList<>();
        DAO dao = new DAO();
        for (String cid : cartList) {
            for (Cart c : dao.getCart()) {
                if (Integer.parseInt(cid) == c.getCartID()) {
                    lstC.add(c);
                }
            }
        }
        for (Cart c : lstC) {
            for (OptionProduct p : dao.getOptionPro()) {
                if (c.getOptionID() == p.getOptionID()) {
                    lstOp.add(p);
                }
            }
        }
        int numberPro = lstC.size();
        float priceTotalPro = 0;
//        float totalSumPrice = 0;
        for (Cart c : lstC) {
            for (OptionProduct p : lstOp) {
                if (c.getOptionID() == p.getOptionID()) {
                    priceTotalPro += p.getOptionPrice() * c.getProductAmount();
                }
            }
        }
        Address addr = new Address();
        for (Address addres : dao.getAddress()) {
            if (addres.getUserID().equals(user.getUserID())) {
                addr = addres;
                break;
            }
        }
        String addD = addr.getAddressDetail() + ", ";
        for (District district : dao.getDistrict()) {
            if (district.getDistrictID().equals(addr.getDistrictID())) {
                addD += district.getDistrictName() + ", ";
                break;
            }
        }
        for (City city : dao.getCity()) {
            if (city.getCityID().equals(addr.getCityID())) {
                addD += city.getCityName();
                break;
            }
        }
        ArrayList<Address> lstAdd = new ArrayList<>();
        for (Address addres : dao.getAddress()) {
            if(addres.getUserID().equals(user.getUserID())){
                lstAdd.add(addres);
            }
        }
        request.setAttribute("lstCity", dao.getCity());
        request.setAttribute("lstDis", dao.getDistrict());
        request.setAttribute("lstAdd", lstAdd);
        request.setAttribute("detailL", addD);
        request.setAttribute("location", addr);
        request.setAttribute("number", numberPro);
        request.setAttribute("totalPrice", priceTotalPro);
        request.setAttribute("lstCart", lstC);
        request.setAttribute("lstOp", lstOp);
        request.setAttribute("lstPro", dao.getProduct());
//        out.println(addD);
//        out.println(addr.getCityID() + " " + addr.getDistrictID() + " " + addr.getAddressDetail());
        request.getRequestDispatcher("./Views/US/order.jsp").forward(request, response);
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
