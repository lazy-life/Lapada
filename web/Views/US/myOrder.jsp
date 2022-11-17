<%-- 
    Document   : myOrder
    Created on : Jul 13, 2022, 3:10:34 AM
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

            .hi{
                display: none;
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
                        <li><a href="changeAddress">Địa Chỉ</a></li>
                        <li><a href="changePass">Đổi Mật Khẩu</a></li>
                    </ul>
                </div>
                <div class="orderProfile">
                    <a style="color: black; display: flex" class="orderBtn" href="myOrder">
                        <i style="font-weight: 500; margin-right: 7px; margin-top: 0px;" class="mdi mdi-clipboard-outline"></i>
                        <p style="font-weight: 500; color: #1a9cb7;">Đơn Mua</p>
                    </a>
                </div>
            </div>
            <div style="height: 110px" class="changeInforRight">
                <div style="border-bottom: 4px solid #f36d00; width: fit-content; padding-bottom: 7px; margin-bottom: 30px"
                     class="topChangeInfor">
                    <h1 style="font-size: 18px; font-weight: 450;">Đơn hàng của tôi</h1>
                    <p style="font-size: 14px; color: #555555;margin-top: 40px;">Tất cả đơn hàng</p>
                </div>
                <!-- <form action="#" method="post"> -->
                <div style="width: 100%;" class="">
                    <c:forEach items="${listOd}" var="d">
                        <c:forEach items="${listPr}" var="p">
                            <c:if test="${p.getProductID() == d.getProductID()}">
                                <div style="display: flex; padding-top: 10px; padding-bottom: 15px; margin-top: 10px;
                                     background-color: #fff"
                                     class="mid">
                                    <div style="width: 460px;" class="inf">
                                        <div
                                            style="display: flex; margin-left: 40px;  font-size: 14px; margin-top: 6px; font-weight: 470;">
                                            <img style="border-radius: 10px;" src="${p.getProductImg1()}" alt="" width="48px"
                                                 height="48px">
                                            <p style="margin-left: 10px; margin-top: 0px; font-weight: bold; font-size: 14px; width: 400px; height: 40px;
                                               overflow: hidden;">${p.getProductName()}</p>
                                        </div>
                                    </div>
                                    <div style="width: 202px;" class="price">
                                        <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470;">
                                            <span style="margin-right: 2px; font-size: 12px;">₫</span>${d.getOrderTotalPrice()}
                                        </p>
                                    </div>
                                    <div style="width: 182px;" class="quan">
                                        <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470;">
                                            ${d.getProductAmount()}</p>
                                    </div>
                                    <div style="width: 180px; height: 45px; overflow: hidden;" class="contn">

                                        <c:if test="${d.getOrderStatus() == 0}">
                                            <p style="margin-left: 20px;color: green; font-size: 14px; margin-top: 10px; font-weight: 500; text-align: justify;">Chờ xác nhận</p>
                                        </c:if>
                                        <c:if test="${d.getOrderStatus() == 1}">
                                            <p style="margin-left: 20px;color: #1791f2; font-size: 14px; margin-top: 10px; font-weight: 500; text-align: justify;">Chờ lấy hàng</p>
                                        </c:if>
                                        <c:if test="${d.getOrderStatus() == 2}">
                                            <p style="margin-left: 20px;color: #07cdae; font-size: 14px; margin-top: 10px; font-weight: 500; text-align: justify;">Đang giao</p>
                                        </c:if>
                                        <c:if test="${d.getOrderStatus() == 3}">
                                            <p style="margin-left: 20px;color: limegreen; font-size: 14px; margin-top: 10px; font-weight: 500; text-align: justify;">Đã giao hàng</p>
                                        </c:if>
                                        <c:if test="${d.getOrderStatus() == 4}">
                                            <p style="margin-left: 20px;color: red; font-size: 14px; margin-top: 10px; font-weight: 500; text-align: justify;">Đã huỷ</p>
                                        </c:if>
                                        <c:if test="${d.getOrderStatus() == 5}">
                                            <p style="margin-left: 20px;color: #07cdae; font-size: 14px; margin-top: 10px; font-weight: 500; text-align: justify;">Đã đánh giá</p>
                                        </c:if>
                                    </div>
                                    <c:if test="${d.getOrderStatus() == 4}">
                                        <div style="width: 100px; margin-top: 10px; margin-right: 20px;" class="btnCancel">
                                            <button style="background-color: red; border: 1px solid #757575; border-radius: 10px;">
                                                <p style="color: white;">Đã huỷ</p>
                                            </button>
                                        </div>
                                    </c:if>
                                    <c:if test="${d.getOrderStatus() == 3}">
                                        <div style="width: 100px; margin-top: 10px; margin-right: 20px;" class="btnCancel">
                                            <button class="cmtBtn" onclick="cmt(${p.getProductID()})" style="background-color: limegreen; border: 1px solid #757575; border-radius: 10px;">
                                                <p style="color: white;">Đánh giá</p>
                                            </button>
                                        </div>


                                    </c:if>
                                    <c:if test="${d.getOrderStatus() == 2}">
                                        <div style="width: 100px; margin-top: 10px; margin-right: 20px;" class="btnCancel">
                                            <button style="background-color: #07cdae; border: 1px solid #757575; border-radius: 10px;">
                                                <p style="color: white;">✔</p>
                                            </button>
                                        </div>
                                    </c:if>
                                    <c:if test="${d.getOrderStatus() == 1}">
                                        <div style="width: 100px; margin-top: 10px; margin-right: 20px;" class="btnCancel">
                                            <button style="background-color: #1791f2; border: 1px solid #757575; border-radius: 10px;">
                                                <p style="color: white;">✔</p>
                                            </button>
                                        </div>
                                    </c:if>
                                    <c:if test="${d.getOrderStatus() == 0}">
                                        <div style="width: 120px; margin-top: 10px;" class="btnCancel">
                                            <button type="button" class="cmtBtn" onclick="deny(${d.getOrderID()})" style="background-color: red; border: 1px solid #757575; border-radius: 10px;">
                                                <p style="color: white;">Huỷ</p>
                                            </button>
                                        </div> 
                                    </c:if>
                                </div>

                                <c:if test="${d.getOrderStatus() == 3}">
                                    <div class="" id="myid${d.getOrderID()}" style="width: 1000px;">
                                        <form action="billOrderControll" method="post">
                                            <input name="id" value="${p.getProductID()}" hidden>
                                            <input name="idO" value="${d.getOrderID()}" hidden>
                                            <input style="width: 600px; height: 40px; margin-left: 300px; margin-bottom: 15px;
                                                   border: 1px solid #757575; border-radius: 10px; outline: none" name="cmtGreen" type="text">
                                            <button type="submit" class="cmtBtn" id="myId${p.getProductID()}" style="padding: 8px 5px; border-radius: 10px; outline: none;
                                                    border: 2px solid #757575; background-color: #1791f2;color: white">Đánh giá</button>
                                        </form>
                                    </div>
                                </c:if>

                            </c:if>
                        </c:forEach>
                    </c:forEach>

                    <!--lam 1 o input nhap comt danh gia-->

                    <!-- </form> -->
                </div> 
                <jsp:include page="footer.jsp"/>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                            function deny(elementID) {
                                                var id = elementID;
                                                var type = 1;
                                                $.ajax({
                                                    url: "/Lapada/billOrderControll",
                                                    type: "get", //send it through get method
                                                    data: {
                                                        orderID: id,
                                                        type: type
                                                    },
                                                    success: function (data) {
                                                        location.reload();
                                                    },
                                                    error: function (xhr) {
                                                        //Do Something to handle error
                                                    }
                                                });
                                            }
                                            function saveCmt(ele) {
                                                var id = ele;
                                                var cmt = Document.getElementById("cmtGreen").value;
                                                var type = 2;
                                                $.ajax({
                                                    url: "/Lapada/billOrderControll",
                                                    type: "get", //send it through get method
                                                    data: {
                                                        orderID: id,
                                                        cmt: cmt,
                                                        type: type
                                                    },
                                                    success: function (data) {
                                                        location.reload();
                                                    },
                                                    error: function (xhr) {
                                                        //Do Something to handle error
                                                    }
                                                });
                                            }

                                            function show() {
                                                document.getElementsByClassName("hi").style.display = "block";
                                            }

                                            function acc(elementID) {
                                                var id = elementID;
                                                var type = 0;
                                                $.ajax({
                                                    url: "/Lapada/billOrderControll",
                                                    type: "get", //send it through get method
                                                    data: {
                                                        orderID: id,
                                                        type: type
                                                    },
                                                    success: function (data) {
                                                        location.reload();
                                                    },
                                                    error: function (xhr) {
                                                        //Do Something to handle error
                                                    }
                                                });
                                            }
                                            onMouseOver = "this.style.bac='#0F0'"
                                            onMouseOut = "this.style.color='#00F'"
        </script>  
    </body>
</html>