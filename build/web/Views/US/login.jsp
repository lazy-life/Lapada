<%-- 
    Document   : login
    Created on : Jul 5, 2022, 2:15:12 PM
    Author     : ducda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>LAZADA</title>
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
                <h1>Chào mừng đến với Lapada. Đăng nhập ngay!</h1>
            </div>
            <div class="fullBotLogin">
                <form action="login" method="post">
                    <p style="margin-left: 30px; color: red; margin-bottom: -20px; margin-top: 10px" class="text-danger">${mess}</p>
                    <div class="midelLogin">
                        <div class="leftLogin">
                            <p>Username*</p>
                            <input type="text" name="name" placeholder="Vui lòng nhập username của bạn">
                            <p>Mật khẩu*</p>
                            <input type="password" name="pass" id="" placeholder="Vui lòng nhập mật khẩu của bạn">
                            <p><a href="#">Quên mật khẩu?</a></p>
                        </div>
                        <div class="rightLogin">
                            <input type="submit" value="ĐĂNG NHẬP">
                            <p>Thành viên mới? <a href="signup">Đăng kí</a> tại đây</p>
                        </div>
                </form>
            </div>


        </div>

    </div>
 <jsp:include page="footer.jsp"/>
</body>

</html>
