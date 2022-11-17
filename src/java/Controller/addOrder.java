/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.Cart;
import Model.Product;
import Model.*;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

/**
 *
 * @author ducda
 */
public class addOrder extends HttpServlet {

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
            out.println("<title>Servlet addOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addOrder at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession ses = request.getSession();
        String location = request.getParameter("location");
        String type = request.getParameter("type");
        int locationC = Integer.parseInt(location);
        User user = (User) ses.getAttribute("acc");
        DAO dao = new DAO();
        if (type.equals("1")) {
            String idCarts = (String) getServletContext().getAttribute("idCarts");
            String[] strSplit = idCarts.split(",");
            ArrayList<String> cartList = new ArrayList<String>(
                    Arrays.asList(strSplit));
            ArrayList<Cart> lstC = new ArrayList<>();
            ArrayList<OptionProduct> lstOp = new ArrayList<>();
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
            for (Cart c : lstC) {
                for (OptionProduct p : lstOp) {
                    if (c.getOptionID() == p.getOptionID()) {
                        for (Shop s : dao.getShop()) {
                            if (c.getShopID() == s.getShopID()) {
                                dao.InsertOrder(c.getProductAmount(), p.getOptionPrice() * c.getProductAmount(), 0, user.getUserID(),
                                        s.getShopID(), p.getProductID(), locationC);
                                dao.updateQuan(p.getOptionID(), p.getOptionQuan() - c.getProductAmount());
                                dao.deleteCart(c.getCartID());
                            }
                        }
                    }
                }
            }
        } else if (type.equals("0")) {
            String name = "";
            String phone = "";
            String detailAdd = "";
            for (Address addres : dao.getAddress()) {
                if (addres.getAddressID() == locationC) {
                    name += addres.getCusName();
                    phone += addres.getAddressPhone();
                    detailAdd += addres.getAddressDetail() + ", ";
                    for (District district : dao.getDistrict()) {
                        if (district.getDistrictID().equals(addres.getDistrictID())) {
                            detailAdd += district.getDistrictName() + ", ";
                            for (City city : dao.getCity()) {
                                if (city.getCityID().equals(addres.getCityID())) {
                                    detailAdd += city.getCityName();
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    break;
                }
            }
            out.println("<div style=\"display: flex;margin-left: 10px; margin-bottom: 15px; padding-top: 15px;\" class=\"namePhone\">\n"
                    + "                        <p style=\"font-size: 15px; margin-right: 20px;\">"+name+"</p>\n"
                    + "                        <p style=\"font-size: 15px;\">"+phone+"</p>\n"
                    + "                    </div>\n"
                    + "                    <div style=\"display: flex; margin-left: 10px;\" class=\"add\">\n"
                    + "                        <p style=\"font-weight: 500; color: white; background-color: rgb(255 83 48);\n"
                    + "                           font-size: 14px; border-radius: 20px; height: fit-content;\n"
                    + "                           padding: 1px 10px 2px 20px; width: 90px;\">\n"
                    + "                            Địa\n"
                    + "                            chỉ</p>\n"
                    + "                        <p style=\"font-size: 14px; width: 670px;\n"
                    + "                           margin-left: 10px; font-weight: 400; overflow: hidden;\">"+detailAdd+"</p>\n"
                    + "                    </div>");

//        response.sendRedirect("Home");
        }else if (type.equals("2")) {
            String name = "";
            String phone = "";
            String detailAdd = "";
            for (Address addres : dao.getAddress()) {
                if (addres.getAddressID() == locationC) {
                    name += addres.getCusName();
                    phone += addres.getAddressPhone();
                    detailAdd += addres.getAddressDetail() + ", ";
                    for (District district : dao.getDistrict()) {
                        if (district.getDistrictID().equals(addres.getDistrictID())) {
                            detailAdd += district.getDistrictName() + ", ";
                            for (City city : dao.getCity()) {
                                if (city.getCityID().equals(addres.getCityID())) {
                                    detailAdd += city.getCityName();
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    break;
                }
            }
            out.println(detailAdd);

//        response.sendRedirect("Home");
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
