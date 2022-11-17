/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAO;
import Model.User;
import Utility.Utility;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.PasswordAuthentication;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
/**
 *
 * @author ducda
 */
public class signup extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    DAO dao;

    public void init() {
        dao = new DAO();
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    Utility uti = new Utility();

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
//        request.setAttribute("path", request.getContextPath());
        //processRequest(request, response);
//        response.sendRedirect("./Views/register.jsp");
        request.getRequestDispatcher("./Views/US/signup.jsp").forward(request, response);
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
            throws ServletException, IOException, UnsupportedEncodingException {
//        processRequest(request, response);
//        request.setAttribute("path", request.getContextPath());

        int code;
        code = codeVerifi();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String Us = request.getParameter("username");
        String Pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String codeString = String.valueOf(code);
        String convertKey = Us + codeString;
        String convertKey1 = "";
        String convertUs = "";
        try {
            convertKey1 = uti.toHexString(uti.getSHA(convertKey));
            convertUs = uti.toHexString(uti.getSHA(Us));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        }
        String link = "hello <a href='http://localhost:9999/Lapada/VerifiedEmail?key1=" + convertKey1 + "&key2=" + convertUs + "'>Click me</a>";
//        
        int status = 0;
        if (checkUser(Us) != null) {
            request.setAttribute("mess", "Username already exists");
            doGet(request, response);
        } else if (!Pass.equals(repass)) {
            request.setAttribute("mess", "Wrong password");
            doGet(request, response);
        } else {
            try {
                dao.InsertUser(Us, name, uti.toHexString(uti.getSHA(Pass)), code, email, "avt", status);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("sendMail");
            String subject = "OTP code for account verification";
            try {
                sendEmail(host, port, user, pass, email, subject, link);
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }

    }

    private User checkUser(String u) {
        for (User us : dao.getUs()) {
            if (us.getUserID().equals(u)) {
                return us;
            }
        }
        return null;
    }

    private static int codeVerifi() {
        Random generator = new Random();
        int code = (int) Math.floor(((Math.random() * 899999) + 100000));
        return code;
    }

    

    public static void sendEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message) throws AddressException,
            MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
//        msg.setText(message);

        // Send the actual HTML message, as big as you like
        msg.setContent(message, "text/html");

        // Send message
        // sends the e-mail
        Transport.send(msg);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
