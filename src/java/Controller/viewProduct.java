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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author ducda
 */
public class viewProduct extends HttpServlet {

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

    public Product getProductByID(int id) {
        DAO dao = new DAO();
        for (Product o : dao.getProduct()) {
            if (o.getProductID() == id) {
                return o;
            }
        }
        return null;
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
        DAO dao = new DAO();
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        Product pr = getProductByID(Integer.parseInt(id));
        ArrayList<OptionProduct> lstOp = new ArrayList<>();
        request.setAttribute("pr", pr);
        for (OptionProduct o : dao.getOptionPro()) {
            if (o.getProductID() == pr.getProductID()) {
                lstOp.add(o);
            }
        }
        float price1 = 0;
        int quan = 0;
        for (OptionProduct o : dao.getOptionPro()) {
            if (o.getProductID() == pr.getProductID()) {
                price1 = o.getOptionPrice();
                break;
            }
        }
        for (OptionProduct o : dao.getOptionPro()) {
            if (o.getProductID() == pr.getProductID()) {
                quan = o.getOptionQuan();
            }
        }

        HttpSession ses = request.getSession();
        User user = (User) ses.getAttribute("acc");
        if (user != null) {
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
            request.setAttribute("lstCity", dao.getCity());
            request.setAttribute("lstDis", dao.getDistrict());
            request.setAttribute("lstAdd", lstAdd);
            request.setAttribute("detailL", addD);
            request.setAttribute("location", addr);
            request.setAttribute("lstOp", lstOp);
            request.setAttribute("lstPro", dao.getProduct());

//            request.setAttribute("search", search);
//            request.setAttribute("DAO", dao);
        }
        ArrayList<Product> lstProduct = dao.getTop24();
        ArrayList<Category> lstCate = dao.getCategory();
        ArrayList<OptionProduct> st = dao.getOptionPro();
        Set<OptionProduct> set = new TreeSet<>(new Comparator<OptionProduct>() {
            @Override
            public int compare(OptionProduct o1, OptionProduct o2) {
                if (o1.getProductID() == (o2.getProductID())) {
                    return 0;
                }
                return 1;
            }
        });

        set.addAll(st);
        st.clear();
        st.addAll(set);
        request.setAttribute("listP", lstProduct);
        request.setAttribute("listOp", st);
        

        request.setAttribute("ListO", lstOp);
        request.setAttribute("prOP", price1);
        request.setAttribute("prQuan", quan);
        request.getRequestDispatcher("./Views/US/viewProduct.jsp").forward(request, response);
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
