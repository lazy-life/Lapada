<%-- 
    Document   : changeAddress
    Created on : Jul 14, 2022, 2:31:47 AM
    Author     : ducda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
                        <li><a style="color: #1a9cb7; font-weight: 500;" href="changeAddress">Địa Chỉ</a></li>
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
            <div style=" background-color: rgba(255, 255, 255, 0);margin-top: 25px; margin-left: 20px;"
                 class="changeInforRight">
                <div style="background-color: white; padding: 10px 20px; width: 990px; margin-left: 0" class="topChangeInfor">
                    <h1 style="font-size: 18px; font-weight: 450;">Sổ địa chỉ</h1>
                    <p style="font-size: 14px; color: #555555;margin-top: 5px;">Quản lý địa chỉ</p>
                </div>
                <!--<form action="#" method="post">-->
                <div style="margin-bottom: 50px" class="changeInforProfileUser">
                    <div style="width: 1000px; height: fit-content; background-color: white;">
                        <ul style="display: flex; text-decoration: none; background-color: #fafafa; padding: 10px 20px 10px 30px;
                            border-bottom: 1px solid #75757524;">
                            <li style="list-style-type: none; font-size: 14px; width: 170px;">Họ tên</li>
                            <li style="list-style-type: none; font-size: 14px; width: 300px;">Địa chỉ cụ thể</li>
                            <li style="list-style-type: none; font-size: 14px; width: 200px;">Địa chỉ</li>
                            <li style="list-style-type: none; font-size: 14px; width: 150px;  margin-left: 30px;">Số
                                điện thoại</li>
                        </ul>
                        <c:forEach items="${lstAdd}" var="o">
                            <c:if test="${sessionScope.acc.getUserID().equals(o.getUserID())}">
                                <ul style="display: flex; text-decoration: none; padding: 10px 20px 10px 30px;
                                    height: 60px; margin-top: 10px;border-bottom: 1px solid #7575752c; padding-bottom: 10px;">
                                    <li style="list-style-type: none; font-size: 13px; width: 170px;">${o.getCusName()}</li>
                                    <li style="list-style-type: none; font-size: 13px; width: 250px;">${o.getAddressDetail()}</li>
                                        <c:forEach items="${lstC}" var="c">
                                            <c:if test="${o.getCityID().equals(c.getCityID())}">
                                                <c:forEach items="${lstD}" var="d">
                                                    <c:if test="${o.getDistrictID().equals(d.getDistrictID())}">
                                                    <div style="width: 250px;">
                                                        <div style="width: fit-content; display: flex">
                                                        <li style="list-style-type: none; font-size: 13px;">${d.getDistrictName()}-${c.getCityName()}</li>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                    <li style="list-style-type: none; font-size: 13px; width: 150px; margin-left: 30px;">${o.getAddressPhone()}</li>
                                    <li style="list-style-type: none; font-size: 13px; width: 70px;">
                                        <a href="">
                                            <p style="margin-bottom: 7px; margin-top: -5px">Chỉnh sửa</p>
                                        </a>
                                        <a href="">
                                            <p>Xoá</p>
                                        </a>
                                    </li>
                                </ul>
                            </c:if>
                        </c:forEach>
                        <a href="addAddress">
                            <button style="background-color: #1a9cb7;border: none; color: white;
                                    font-size: 14px;min-width: 168px;height: 40px;line-height: 40px;margin-left: 780px;
                                    margin-top: 30px; margin-bottom: 30px;">+ ADD NEW ADDRESS</button>
                        </a>
                    </div>

                    <!--</form>-->

                </div>
            </div>



        </div>
 <jsp:include page="footer.jsp"/>
    </body>
</html>

