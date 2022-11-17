<%-- 
    Document   : changePass
    Created on : Jul 5, 2022, 2:14:55 PM
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
                        <li><a href="changeInfor">Hồ Sơ</a></li>
                        <li><a  href="changeAddress">Địa Chỉ</a></li>
                        <li><a style="color: #1a9cb7; font-weight: 500;" href="changePass">Đổi Mật Khẩu</a></li>
                    </ul>
                </div>
                <div class="orderProfile">
                    <a style="color: black; display: flex" class="orderBtn" href="myOrder">
                        <i style="font-weight: 500; margin-right: 7px; margin-top: 0px;" class="mdi mdi-clipboard-outline"></i>
                        <p style="font-weight: 500; color: black;">Đơn Mua</p>
                    </a>
                </div>
            </div>
            <div style="margin-top: 25px; margin-left: 20px;" class="changeInforRight">
                <div class="topChangeInfor">
                    <h1 style="font-size: 18px; font-weight: 450;">Đổi mật khẩu</h1>
                    <p style="font-size: 14px; color: #555555;margin-top: 5px;">Để bảo mật tài khoản, vui lòng không chia sẻ
                        mật khẩu cho người khác</p>
                </div>
                <form action="changePass" method="post">
                    <p style="margin-left: 290px; color: red; margin-bottom: -5px; margin-top: 10px; font-size: 14px" class="text-danger">${mess}</p>
                    <p style="margin-left: 290px; color: green; margin-bottom: -5px; margin-top: 10px; font-size: 14px" class="text-danger">${mess1}</p>
                    <div class="changeInforProfileUser">
                        <div style="width: 100%;" class="changeLeft">
                            <div style="width: 200px; text-align: right;" class="changeLeftLeft">
                                <p>Mật khẩu hiện tại</p>
                                <p>Mật khẩu mới</p>
                                <p>Nhập lại mật khẩu mới</p>
                            </div>
                            <div style="margin-left: 30px; padding-bottom: 50px;" class="changeLeftRight">
                                <input style="margin-bottom: 50px; width: 400px; height: 40px;" type="password" name="oldPass">
                                <a style="font-size: 14px; margin-left: 20px;" href="">Quên mật khẩu?</a>
                                <div style="display: flex;" class="changeEmail" >
                                    <input style="margin-bottom: 50px; width: 400px; height: 40px; margin-top: -15px;"
                                           type="password" name="newPass">
                                </div>
                                <div style="display: flex;" class="changePhone">
                                    <input style="margin-bottom: 20px; width: 400px; height: 40px;margin-top: -15px;"
                                           type="password" name="rePass">
                                </div>

                                <input class="saveChangeProfile" style="margin-top: 15px;" type="submit" value="Thay đổi">
                            </div>

                        </div>

                </form>

            </div>
        </div>



    </div>
                     <jsp:include page="footer.jsp"/>
</body>
</html>
