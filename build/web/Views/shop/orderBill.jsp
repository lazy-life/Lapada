<%-- 
    Document   : allProduct
    Created on : Jul 8, 2022, 11:55:27 PM
    Author     : ducda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/font/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets/css/styleLazada.css">
        <title>Seller Center</title>
        <link rel="icon" type="image/x-icon" href="assets/imgLazada/logoSellerCenter.png">
        <style>
            .sanpham a p:hover,
            .taikhoan a p:hover,
            .phantich a p:hover,
            .donhang a p:hover {
                background-color: rgba(220, 220, 220, 0.223);
                color: #1a71ff;
            }

            .sanpham a p,
            .taikhoan a p,
            .phantich a p,
            .donhang a p {
                padding: 10px 40px;
            }

            .btnAdd:hover {
                cursor: pointer;
            }

            .BtnAcc:hover{
                cursor: pointer;
            }
        </style>
    </head>
    <body style="background-color: #eef0f4;">
        <jsp:include page="headerSellerCenter.jsp"/>
        <div style="margin-left: 250px;" id="rightManagerPro">
            <div style="display: flex; padding-top: 20px;" class="pathHead">
                <a href="">
                    <p style="font-size: 14px; margin-right: 8px;">Trang chủ</p>
                </a>
                <i style="font-size: 12px; margin-top: 5px; margin-right: 8px;" class="ti-angle-right"></i>
                <p style="font-size: 14px; font-weight: bolder;">Đơn đặt hàng</p>
            </div>
            <h1 style="margin-top: 20px; font-size: 24px;">Đơn đặt hàng</h1>
            <div style="display: flex; margin-top: 30px;" class="midHead">
                <p style="font-size: 16px; font-weight: 500; color: #1a71ff; border-bottom: 3px solid #1a71ff; padding-bottom: 8px;
                   margin-right: 950px;">
                    Tất cả</p>
                <a href="addProduct">

                </a>
            </div>

            <div style="width: fit-content; min-height: 80px; background-color: #fff; margin-top: 30px; border-radius: 20px;"
                 class="filPro">
                <div style="display: flex;" class="top">
                    <div style="width: 460px;" class="inf">
                        <p
                            style="margin-left: 40px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Đơn hàng</p>
                    </div>
                    <div style="width: 202px;" class="price">
                        <p
                            style="margin-left: 20px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Giá</p>
                    </div>
                    <div style="width: 182px;" class="quan">
                        <p
                            style="margin-left: 20px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Số lượng</p>
                    </div>
                    <div style="width: 222px;" class="contn">
                        <p
                            style="margin-left: 20px; font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Trạng thái</p>
                    </div>
                    <div style="width: 130px;" class="optional">

                    </div>
                </div>
                <div id="content">
                <c:forEach items="${listOd}" var="d">
                    <c:forEach items="${listPr}" var="p">
                        <c:if test="${p.getProductID() == d.getProductID()}">
                            <div style="display: flex; border-top: 1px solid #cbced5; padding-top: 5px; padding-bottom: 15px;"
                                 class="mid">
                                <div style="width: 460px;" class="inf">
                                    <div style="display: flex; margin-left: 40px;  font-size: 14px; margin-top: 6px; font-weight: 470;">
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
                                    <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470;">${d.getProductAmount()}</p>
                                </div>
                                <div style="width: 220px; height: 45px; overflow: hidden;" class="contn">
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
                                        <p style="margin-left: 20px;color: #07cdae; font-size: 14px; margin-top: 10px; font-weight: 500; text-align: justify;">Đã hoàn thành</p>
                                    </c:if>
                                </div>
                                <div style="width: 130px;" class="optional">
                                    <c:if test="${d.getOrderStatus() == 0}">
                                        <button value="" onclick="acc(${d.getOrderID()})" class="BtnAcc" style="font-size: 14px; margin-left: 5px;
                                                border-radius: 10px; border: 1px solid #757575;padding: 5px 9px; background-color: #1a71ff;
                                                font-weight: 450; margin-top: 10px;"><p style="color: white">Chấp nhận</p></button>
                                        <button value="" onclick="deny(${d.getOrderID()})" class="BtnAcc" style=" border-radius: 10px; border: 1px solid #757575;padding: 5px 9px; background-color: #1a71ff;
                                                font-size: 14px; margin-left: 5px; font-weight: 450; margin-top: 10px;"><p style="color: white">Từ chối</p></button>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>
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
        </script>  
    </body>
</html>
