<%-- 
    Document   : veriEmail
    Created on : Jul 5, 2022, 5:12:57 PM
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


        <div style="margin-top: 300px;">
            <div style="text-align: center; margin-top: 100px;">
                <h1 style="font-weight: 500;">TÀI KHOẢN ĐÃ ĐƯỢC KÍCH HOẠT</h1>
                <i style="font-size: 100px; color: green;" class="mdi mdi-checkbox-marked-circle-outline"></i>
                <h2><a style="color: #1a9cb7;" href="login">ĐĂNG NHẬP NGAY</a></h2>
            </div>
        </div>

    </div>
 <jsp:include page="footer.jsp"/>
</body>
</html>
