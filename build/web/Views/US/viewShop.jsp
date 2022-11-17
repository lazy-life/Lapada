<%-- 
    Document   : viewShop
    Created on : Jul 5, 2022, 2:15:49 PM
    Author     : ducda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/font/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets/css/styleLazada.css">
        <link rel="icon" type="image/x-icon" href="assets/imgLazada/logoIcon.png">
        <title>LAZADA</title>
        <style>

        </style>
    </head>
    <body>

        <div style="height: 110px" id="header">
            <jsp:include page="headerShop.jsp"/>
            <div class="cate">
                <p>Danh mục</p>
                <div class="ti-angle-down"></div>
            </div>
        </div>

        <div class="topContainerShop">
            <div class="inforShop">
                <div class="nameAndAvt">
                    <img width="76px" height="76px" src="assets/imgLazada/shinAvt.jpg" alt="Avatar">
                    <p>Kính mắt Candy</p>
                </div>
                <div class="twoBtnView">
                    <a href="#"><i class="mdi mdi-check"></i> Địa Chỉ</a>
                    <a href="#"><i class="mdi mdi-message-text-outline"></i> Đánh Giá</a>
                </div>
            </div>

            <div class="rightInforShop">
                <div class="leftTopViewShop">
                    <p><i style="font-size: 20px; margin-right: 7px;" class="mdi mdi-dropbox"></i> Sản Phẩm: 284 </p>
                    <p><i style="font-size: 20px; margin-right: 7px;" class="mdi mdi-logout"></i>Tỉ Lệ Hoàn Hàng: 2% </p>
                </div>
                <div class="rightTopViewShop">
                    <p><i style="font-size: 20px; margin-right: 7px;" class="mdi mdi-message-text-outline"></i>Đánh Giá: 5.0
                    </p>
                    <p><i style="font-size: 20px; margin-right: 7px;" class="mdi mdi-calendar-clock"></i>Tham Gia: 32 Tháng
                        Trước </p>

                </div>
            </div>
        </div>
        <div class="botInfor">
            <ul>
                <li><a style="color: #f36d00; border-bottom: 2px solid #f36d00; padding-bottom: 19px; padding-left: 50px; padding-right: 50px;"
                       href="#">TẤT CẢ SẢN
                        PHẨM</a></li>
                <li><a href="#">HỒ SƠ</a></li>
                <!-- <li></li> -->
            </ul>
        </div>
        <div id="containViewShop">

        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
