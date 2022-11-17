<%-- 
    Document   : signup
    Created on : Jul 5, 2022, 2:15:36 PM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/font/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets/css/styleLazada.css">
        <link rel="icon" type="image/x-icon" href="assets/imgLazada/logoIcon.png">
        <title>LAPADA</title>
    </head>
    <body>

        <div style="height: 110px" id="header">
            <jsp:include page="headerShop.jsp"/>
            <div class="cate">
                <p>Danh mục</p>
                <div class="ti-angle-down"></div>
            </div>
        </div>


        <div id="containLogin">
            <div class="topLogin">
                <h1>Tạo tài khoản Lapada</h1>
            </div>
            <div class="fullBotLogin">
                <form action="signup" method="post">
                    <p style="margin-left: 30px; color: red; margin-bottom: -20px; margin-top: 10px" class="text-danger">${mess}</p>
                    <div class="midelLogin">
                        <div class="leftLogin">
                            <p>User Name*</p>
                            <input type="text" name="username" placeholder="User Name" required>
                            <p>Mật khẩu*</p>
                            <input type="password" name="pass" id="" placeholder="Vui lòng nhập mật khẩu" required>
                            <p>Xác Minh Mật khẩu*</p>
                            <input type="password" name="repass" id="" placeholder="Vui lòng nhập lại mật khẩu" required>
                            <p>Email*</p>
                            <input type="email" name="email" placeholder="Vui lòng nhập email của bạn" required>

                        </div>
                        <div class="rightLogin">
                            <div class="citySignup">
                                <p>Họ tên*</p>
                                <input class="city" naem="name" type="text" placeholder="Họ tên" required>
                            </div>
                            <div class="veriSignup">
                                <input type="checkbox" name="" id="">
                                <p>Tôi đã đọc và đồng ý với Điều Khoản Sử Dụng và Chính Sách Bảo Mật của Lapada của Lapada,
                                    bao
                                    gồm quyền thu thập, sử dụng, và tiết lộ dữ liệu cá nhân của tôi theo pháp luật quy định.
                                </p>
                            </div>
                            <input class="SignUpBtn" type="submit" value="ĐĂNG KÍ">
                            <p class="optionLinkLogin">Bạn đã là thành viên? <a href="#">Đăng nhập</a> tại đây</p>
                        </div>
                </form>
            </div>


        </div>

    </div>
 <jsp:include page="footer.jsp"/>
</body>

</html>
