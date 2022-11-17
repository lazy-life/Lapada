<%-- 
    Document   : changeInfor
    Created on : Jul 5, 2022, 2:14:49 PM
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
        <title>LAPADA</title>
        <style>
            .orderBtn p:hover, .orderBtn i:hover{
                color: rgb(246 130 61);
            }

            .cmtBtn:hover{
                cursor: pointer;
            }
        </style>
    </head>
    <body style="background-color: #eff0f4;">
        <div style="" id="header">
            <jsp:include page="headerShop.jsp"/>
            <div class="cate">
                <p>Danh mục</p>
                <div class="ti-angle-down"></div>
            </div>
        </div>

        <div id="containChangeInfor">
            <div class="changeInforLeft">
                <div class="nameProfile">
                    <img src="${sessionScope.acc.getUserImg()}" alt="">
                    <p style="margin-top: 25px; margin-left: 15px; font-size: 18px">${sessionScope.acc.getUserID()}</p>
                </div>
                <div class="mainProfile">
                    <div class="nameMainProfile">
                        <i style="font-weight: 500; margin-right: 7px; margin-top: 3px;" class="ti-user"></i>
                        <a href="changeInfor"><p style="font-weight: 500; color: black;">Tài Khoản Của Tôi</p></a>
                    </div>
                    <ul>
                        <li><a style="color: #1a9cb7; font-weight: 500;" href="changeInfor">Hồ Sơ</a></li>
                        <li><a  href="changeAddress">Địa Chỉ</a></li>
                        <li><a href="changePass">Đổi Mật Khẩu</a></li>
                    </ul>
                </div>
                <div class="orderProfile">
                    <a style="color: black; display: flex" class="orderBtn" href="myOrder">
                        <i style="font-weight: 500; margin-right: 7px; margin-top: 0px;" class="mdi mdi-clipboard-outline"></i>
                        <p style="font-weight: 500; color: black;">Đơn Mua</p>
                    </a>
                </div>
            </div>
            <div style="margin-top: 25px; margin-left: 20px" class="changeInforRight">
                <div class="topChangeInfor">
                    <h1 style="font-size: 18px; font-weight: 450;">Hồ Sơ Của Tôi</h1>
                    <p style="font-size: 14px; color: #555555;margin-top: 5px;">Quản lý thông tin hồ sơ để bảo mật tài
                        khoản</p>
                </div>
                <form action="changeInforAcc" method="post" enctype="multipart/form-data">
                    <div class="changeInforProfileUser">
                        <div class="changeLeft">
                            <div class="changeLeftLeft">
                                <p>Tên Đăng Nhập</p>
                                <p>Tên</p>
                                <p>Email</p>
                                <p>Số Điện Thoại</p>
                            </div>
                            <div class="changeLeftRight">
                                <p style="margin-bottom: 50px;">${us.getUserID()}</p>
                                <input name="nameUs" style="margin-bottom: 50px; width: 300px; height: 35px;" type="text"
                                       value="${us.getUserName()}">
                                <div style="display: flex;" class="changeEmail">
                                    <!--                                    <p style="margin-bottom: 50px;">ch************@gmail.com</p>-->
                                    <input style="margin-bottom: 50px;margin-top: -10px;border: none; outline: 1px solid #757575; width: 300px; height: 30px" type="text" name="mail" value="${us.getUserEmail()}">
                                    <a style="margin-left: 10px; color:#05a; font-size: 14px; margin-top: -3px;"
                                       href="#">Gửi mã</a>
                                </div>
                                <div style="display: flex;" class="changePhone">
                                    <input style="margin-bottom: 50px;margin-top: -10px;border: none; outline: 1px solid #757575; width: 300px; height: 30px" name="phone" type="text" value="${us.getUserPhone()}">
                                    <!--                                    <a style="margin-left: 10px; color:#05a; font-size: 14px; margin-top: 3px;"
                                                                           href="#">Thay
                                                                            Đổi</a>-->
                                </div>

                                <p></p>

                                <input class="saveChangeProfile" style="margin-top: 0px;" type="submit" value="Lưu">
                            </div>

                        </div>
                        <div style="border-left: 1px solid #93939391;" class="changeAvt">
                            <img style="margin-top: 40px; border-radius: 50%" src="${us.getUserImg()}" width="120px" height="120px"
                                 alt="">
                            <div class="btnInputChoosen">
                                <input type="file" name="avt" class="custom-file-input">
                            </div>
                            <p style="width: 70%; margin-left: 50px; font-size: 14px; color: #555; margin-top: 10px;">Dụng
                                lượng
                                file tối đa 1 MB
                                Định dạng:.JPEG, .PNG</p>

                        </div>
                </form> 

            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
