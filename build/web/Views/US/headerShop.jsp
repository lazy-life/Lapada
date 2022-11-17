<%-- 
    Document   : headerShop
    Created on : Jul 11, 2022, 12:03:29 AM
    Author     : ducda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="topHeader">

    <ul>

        <c:if test="${sessionScope.acc != null}">
            <li><a class="linkTopHeader1" href="mainProductShop" target="_blank">BÁN HÀNG CÙNG LAZADA</a></li>
            <li><a class="linkTopHeader1" href="#">CHĂM SÓC KHÁCH HÀNG</a></li>
            <li><a class="linkTopHeader" href="myOrder">KIỂM TRA ĐƠN HÀNG</a></li>
            <li><a class="linkTopHeader" href="changeInfor">TÀI KHOẢN ${sessionScope.acc.getUserID().toUpperCase()}</a></li>
            <li><a class="linkTopHeader" href="logout">ĐĂNG XUẤT</a></li>
            </c:if>
            <c:if test="${sessionScope.acc == null}">
            <li><a class="linkTopHeader1" href="mainProductShop" target="_blank">BÁN HÀNG CÙNG LAZADA</a></li>
            <li><a class="linkTopHeader1" href="#">CHĂM SÓC KHÁCH HÀNG</a></li>
            <li><a class="linkTopHeader" href="myOrder">KIỂM TRA ĐƠN HÀNG</a></li>
            <li><a class="linkTopHeader" href="login">ĐĂNG NHẬP</a></li>
            <li><a class="linkTopHeader" href="signup">ĐĂNG KÝ</a></li>
            </c:if>
            <c:if test="${sessionScope.acc.getUserStatus() == 3}">
            <li><a class="linkTopHeader1" href="admin" target="_blank">Quản lý</a></li>
            </c:if>
    </ul>

</div>
<div class="botHeader">
    <div class="logo">
        <a href="Home"><img src="assets/imgLazada/logo.png" alt="logo" width="130px" ></a>
    </div>
    <div class="search">
        <form action="search" method="get">
            <input name="searchLapada" type="text" placeholder="Tìm kiếm trên Lapada">
            <i style="position: absolute; height: 45px; width: 45px;" class="ti-search">
                <input style="position: relative; width: 47px;height: 45px;margin-top: -35px; margin-left: -14px;
                       background-color: rgba(255, 255, 255, 0.033);" type="submit" value=""></i>
        </form>
    </div>
    <div class="cart">
        <a href="cart">
            <i class="mdi mdi-cart-outline"></i>
        </a>
    </div>
</div>