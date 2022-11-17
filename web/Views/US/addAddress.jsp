<%-- 
    Document   : addAddress
    Created on : Jul 14, 2022, 7:41:29 PM
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
                    <h1 style="font-size: 18px; font-weight: 450;">Thêm địa chỉ mới</h1>
                    <p style="font-size: 14px; color: #555555;margin-top: 5px;">Địa chỉ nhận hàng</p>
                </div>
                <form action="addAddress" method="post">
                    <div style="width: 1000px; display: block;height: fit-content; background-color: white; "
                         class="changeInforProfileUser">
                        <div style="width: 1000px; height: fit-content; background-color: white; display: flex;">
                            <div style="width: 50%; margin-left: 50px; margin-right: 30px; margin-top: 30px;">
                                <p style="font-size: 14px;margin-bottom: 7px;">Họ tên</p>
                                <input style="width: 410px; height: 40px; margin-bottom: 35px;" type="text"
                                       placeholder="Họ Tên" name="usName">
                                <p style="font-size: 14px;margin-bottom: 7px;">Số điện thoại</p>
                                <input style="width: 410px; height: 40px; margin-bottom: 35px;" type="text"
                                       placeholder="Xin vui lòng nhập số điện thoại của bạn" name="usPhone">
                            </div>
                            <div style="width: 50%; margin-left: 30px; margin-right: 30px;  margin-top: 30px;" >
                                <p style="font-size: 14px;margin-bottom: 7px;">Địa chỉ nhận hàng</p>
                                <input style="width: 410px; height: 40px; margin-bottom: 35px;" type="text"
                                       placeholder="Vui lòng nhập địa chỉ của bạn" name="usAdd">
                                <div id="AttorneyEmpresa">
                                    <p style="font-size: 14px;margin-bottom: 7px;">Tỉnh/ Thành phố</p>
                                    <select name="city" style="width: 410px; height: 40px; margin-bottom: 35px;" required id="country_id">
                                        <option value="" disabled="" selected="">Chọn Tỉnh/Thành Phố</option>
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.getCityID()}">${o.getCityName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <p style="font-size: 14px;margin-bottom: 7px;">Quận/ Huyện</p>
                                <select style="width: 410px; height: 40px; margin-bottom: 25px;" required id="content" name="district" class="form-select" aria-label="Default select example">
                                    <option>Chọn Quận/Huyện</option>
                                </select>
                            </div>


                        </div>
                        <button style="background-color: #f57224;border: none; color: white;
                                font-size: 14px;min-width: 168px;height: 40px;line-height: 40px;margin-left: 780px;
                                margin-top: 30px; margin-bottom: 40px;">Lưu</button>
                </form>
            </div>
        </div>
    </div>
                 <jsp:include page="footer.jsp"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#AttorneyEmpresa").change(function () {
                $.ajax({
                    url: "/Lapada/loadDistrict",
                    type: 'GET',
                    data: {keyname: $('#AttorneyEmpresa option:selected').val()},
                    success: function (data) {
                        var row = document.getElementById("content");
                        row.innerHTML = data;
                    }
                });
            });
        });
    </script>  
</body>

</html>

