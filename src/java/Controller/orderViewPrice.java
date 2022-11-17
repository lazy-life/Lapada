/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.Address;
import Model.Cart;
import Model.City;
import Model.District;
import Model.OptionProduct;
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

/**
 *
 * @author ducda
 */
public class orderViewPrice extends HttpServlet {

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
            out.println("<title>Servlet orderViewPrice</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderViewPrice at " + request.getContextPath() + "</h1>");
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
        User user = (User) ses.getAttribute("acc");
        PrintWriter out = response.getWriter();
        String type = request.getParameter("type");
        String idCarts = request.getParameter("idCarts");
        if (!idCarts.isEmpty()) {
            String[] strSplit = idCarts.split(",");
            // Now convert string into ArrayList
            ArrayList<String> cartList = new ArrayList<String>(
                    Arrays.asList(strSplit));
            // Now print the ArrayList
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
                if (addres.getUserID().equals(user.getUserID())) {
                    lstAdd.add(addres);
                }
            }
            out.println("<div class=\"inforOrder\">\n"
                    + "                    <p>Thông tin đơn hàng</p>\n"
                    + "                    <div class=\"tempCal\">\n"
                    + "                        <p>Tạm tính (" + numberPro + " sản phẩm)</p>\n"
                    + "                        <p class=\"price\">" + priceTotalPro + " VND</p>\n"
                    + "                    </div>\n"
                    + "                    <div class=\"ship\">\n"
                    + "                        <p>Phí vận chuyển</p>\n"
                    + "                        <p class=\"price\">0 VND</p>\n"
                    + "                    </div>\n"
                    + "                </div>\n"
                    + "\n"
                    + "                <div class=\"vocher\">\n"
                    + "                    <input class=\"enterOrder\" type=\"text\" placeholder=\"Mã giảm giá\">\n"
                    + "                    <input class=\"smt\" type=\"button\" value=\"ÁP DỤNG\">\n"
                    + "                </div>\n"
                    + "\n"
                    + "                <div style=\"margin-top: 30px\" class=\"total\">\n"
                    + "                    <p>Tổng cộng</p>\n"
                    + "                    <div style=\"margin-bottom: 5px;\" class=\"totalPrice\">\n"
                    + "                        <p style=\"font-size: 18px\">" + priceTotalPro + " VND</p>\n"
                    + "                    </div>\n"
                    + "                </div>\n"
                    + "                <div class=\"addInfor\">\n"
                    + "                    <p>Đã bao gồm VAT (nếu có)</p>\n"
                    + "                </div>"
                    + "<div class=\"cf\">\n"
                    + "                            <!--<button style=\"height: 50px; width: 200px; border: none\" onclick=\"setProductOrder()\">-->\n"
                    + "                            <input type=\"button\" onclick=\"setProductOrder()\" class=\"smtOrder\" value=\"XÁC NHẬN GIỎ HÀNG("+ numberPro +")\">\n"
                    + "                            <!--</button>-->\n"
                    + "                        </div>");

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
