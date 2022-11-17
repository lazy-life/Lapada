<%-- 
    Document   : order
    Created on : Jul 5, 2022, 2:15:29 PM
    Author     : ducda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>LAZADA</title>
        <style>
            .smtOrder:hover {
                cursor: pointer;
            }
            .hoverBtnQuan:hover {
                border: 1px solid #EFF0F5;
            }

            .checkBtn input[type='checkbox'] {
                display: block;
                width: 15px;
                height: 15px;
                margin-right: 10px;
                margin-top: 30px;
                border: 1px solid #EFF0F5;
                accent-color: rgb(246 130 61);
            }

            .checkBtn input[type='checkbox']:hover {
                outline: 1px solid rgb(246 130 61);
                cursor: pointer;
            }

            .checkBtn input[type='checkbox'] {
                width: 15px !important;
                height: 15px !important;
                margin: 5px;
                margin-top: 30px;
                margin-right: 10px;
                -webkit-appearance: none;
                -moz-appearance: none;
                -o-appearance: none;
                appearance: none;
                outline: 1px solid rgb(24 144 255);
                border-radius: 3px;
                box-shadow: none;
                font-size: 0.8em;
                text-align: center;
                line-height: 1em;
                background: rgb(255, 255, 255);
            }

            .checkBtn input[type='checkbox']:checked:after {
                content: '✔';
                color: rgb(246 130 61);

            }

            .del a:hover{
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <div style="height: 100px;" id="header">
            <div class="topHeader">
                <ul>
                    <li><a class="linkTopHeader1" href="mainProductShop" target="_blank">BÁN HÀNG CÙNG LAZADA</a></li>
                    <li><a class="linkTopHeader1" href="#">CHĂM SÓC KHÁCH HÀNG</a></li>
                    <li><a class="linkTopHeader" href="#">KIỂM TRA ĐƠN HÀNG</a></li>
                        <c:if test="${sessionScope.acc != null}">
                        <li><a class="linkTopHeader" href="changeInfor">TÀI KHOẢN ${sessionScope.acc.getUserID().toUpperCase()}</a></li>
                        <li><a class="linkTopHeader" href="logout">ĐĂNG XUẤT</a></li>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                        <li><a class="linkTopHeader" href="login">ĐĂNG NHẬP</a></li>
                        <li><a class="linkTopHeader" href="signup">ĐĂNG KÝ</a></li>
                        </c:if>
                </ul>
            </div>
            <div class="botHeader">
                <div class="logo">
                    <a href="Home"><img src="assets/imgLazada/logo.png" alt="logo" width="130px" ></a>
                </div>
                <div class="search">
                    <!-- <input type="text" placeholder="Tìm kiếm trên Lazada">
                    <i class="ti-search"></i> -->
                </div>
                <div class="cart">
                    <!-- <i class="mdi mdi-cart-outline"></i> -->
                </div>
            </div>
            <div class="cate">
                <!-- <p>Danh mục</p>
                <div class="ti-angle-down"></div> -->
            </div>
        </div>
        <div class="w3-sidebar w3-bar-block w3-border-right" style="position: fixed;top: 0;
             display: none; right: 0;background: #fff;width: 500px;height: 100vh;z-index: 999;overflow: auto;"
             id="mySidebar">
            <div style="display: block;">
                <div style="display: flex">
                    <p style="margin-bottom: 20px; margin-left: 40px; margin-top: 20px; font-size: larger;">Địa chỉ nhận hàng
                    </p>
                    <a onclick="pupUpOpen();w3_close()" style="margin-bottom: 20px; margin-left: 90px; margin-top: 25px; font-size: medium; color: #1a9cb7">Thêm địa chỉ mới</a>

                </div>
                <c:forEach items="${lstAdd}" var="o">
                    <div
                        style="display: flex; border: 1px solid #dadada; width: 423px; margin: auto; margin-top: 15px; border-radius: 10px;">
                        <input style="margin-left: 15px; margin-right: 15px; margin-top: 30px;
                               width: 18px; height: 18px;" type="radio" name="addCh" id="" value="${o.getAddressID()}">
                        <div style="margin-top: 20px;">
                            <div style="font-size: 16px; display: flex;">
                                <p style="margin-right: 20px; margin-bottom: 10px;">${o.getCusName()}</p>
                                <p>20482948</p>
                            </div>
                            <div style="margin-bottom: 20px;">
                                <p style="font-size: 14px; width: 350px;">${o.getAddressDetail()}</p>
                                <c:forEach items="${lstCity}" var="ci">
                                    <c:if test="${o.getCityID().equals(ci.getCityID())}">
                                        <c:forEach items="${lstDis}" var="d">
                                            <c:if test="${o.getDistrictID().equals(d.getDistrictID())}">
                                                <p style="font-size: 12px;">Mã vùng: ${c.getCityName()} - ${d.getDistrictName()}</p>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <button style="color: #757575;background-color: #eff0f5;border-color: transparent;text-decoration: none;
                        font-size: 14px;min-width: 168px;height: 40px;line-height: 40px;margin-left: 50px; margin-top: 50px; margin-bottom: 50px"
                        onclick="w3_close()" class="w3-bar-item w3-large">HUỶ</button>
                <button style="color: #fff;background-color: #1a9cb7;border-color: transparent;text-decoration: none;
                        font-size: 14px;min-width: 168px;height: 40px;line-height: 40px;margin-left: 50px; margin-top: 50px;"
                        onclick="loadNewLocation();w3_close()" class="w3-bar-item w3-large">LƯU</button>
            </div>
        </div>
        <!--//center-->
        <div class="w3-sidebar w3-bar-block w3-border-right" style="position: fixed;top: 100px;
             display: none; right: 170px;background: #fff;width: 1100px;height: 80vh;z-index: 999;overflow: auto;
             box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;"
             id="pupup">
            <div style=" background-color: rgba(255, 255, 255, 0);margin-top: 25px; margin-left: 20px;"
                 class="changeInforRight">
                <div style="background-color: white; padding: 10px 20px; width: 990px; margin-left: 0" class="topChangeInfor">
                    <h1 style="font-size: 18px; font-weight: 450;">Thêm địa chỉ mới</h1>
                    <p style="font-size: 14px; color: #555555;margin-top: 5px;">Địa chỉ nhận hàng</p>
                </div>
                <!--<form action="addAddress" method="post">-->
                <div style="width: 1000px; display: block;height: fit-content; background-color: white; "
                     class="changeInforProfileUser">
                    <div style="width: 1000px; height: fit-content; background-color: white; display: flex;">
                        <div style="width: 50%; margin-left: 50px; margin-right: 30px; margin-top: 30px;">
                            <p style="font-size: 14px;margin-bottom: 7px;">Họ tên</p>
                            <input style="width: 410px; height: 40px; margin-bottom: 35px;" type="text"
                                   placeholder="Họ Tên" id="usName">
                            <p style="font-size: 14px;margin-bottom: 7px;">Số điện thoại</p>
                            <input style="width: 410px; height: 40px; margin-bottom: 35px;" type="text"
                                   placeholder="Xin vui lòng nhập số điện thoại của bạn" id="usPhone">
                        </div>
                        <div style="width: 50%; margin-left: 30px; margin-right: 30px;  margin-top: 30px;" >
                            <p style="font-size: 14px;margin-bottom: 7px;">Địa chỉ nhận hàng</p>
                            <input style="width: 410px; height: 40px; margin-bottom: 35px;" type="text"
                                   placeholder="Vui lòng nhập địa chỉ của bạn" id="usAdd">
                            <div id="locationAddress">
                                <p style="font-size: 14px;margin-bottom: 7px;">Tỉnh/ Thành phố</p>
                                <select id="usCity" style="width: 410px; height: 40px; margin-bottom: 35px;" required id="country_id">
                                    <option value="" disabled="" selected="">Chọn Tỉnh/Thành Phố</option>
                                    <c:forEach items="${lstCity}" var="o">
                                        <option value="${o.getCityID()}">${o.getCityName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <p style="font-size: 14px;margin-bottom: 7px;">Quận/ Huyện</p>
                            <select style="width: 410px; height: 40px; margin-bottom: 25px;" required id="usDistrict" class="form-select" aria-label="Default select example">
                                <option disabled="" selected="">Chọn Quận/Huyện</option>
                            </select>
                        </div>


                    </div>
                    <!--                        <button style="background-color: #f57224;border: none; color: white;
                                                    font-size: 14px;min-width: 168px;height: 40px;line-height: 40px;margin-left: 780px;
                                                    margin-top: 30px; margin-bottom: 40px;">Lưu</button>-->
                    <div style="display: flex">
                        <button style="background-color: #dadada;border: none; color: white;
                                font-size: 14px;min-width: 168px;height: 40px;line-height: 40px;margin-left: 515px;
                                margin-top: 30px; margin-bottom: 40px;"
                                onclick="pupUpClose()" class="w3-bar-item w3-large">HUỶ</button>
                        <button style="background-color: #f57224;border: none; color: white;
                                font-size: 14px;min-width: 168px;height: 40px;line-height: 40px;margin-left: 100px;
                                margin-top: 30px; margin-bottom: 40px;"
                                onclick="pupUpClose();saveLocation()" class="w3-bar-item w3-large">LƯU</button>
                    </div>
                    <!--</form>-->
                </div>
            </div>
        </div>

        <div style="margin-top: 130px;" id="containCart">
            <div class="left">
                <div style="background-color: #fafafa;" class="selectAll">
                    <div class="enter">
                        <!-- <div style="margin-top: 6px;"></div> -->
                        <p style="margin-top: 4px; color: black; margin-left: 10px;">Địa chỉ giao hàng</p>
                    </div>
                    <div class="del">
                        <a onclick="w3_open()" style="margin-top: 5px;">
                            <p>Chỉnh sửa</p></i>
                        </a>
                    </div>
                </div>
                <div style="background-color: #fff; padding-bottom: 20px;" class="localAdd" id="locationOne">
                    <div style="display: flex;margin-left: 10px; margin-bottom: 15px; padding-top: 15px;" class="namePhone">
                        <p style="font-size: 15px; margin-right: 20px;">${location.getCusName()}</p>
                        <p style="font-size: 15px;">${location.getAddressPhone()}</p>
                    </div>
                    <div style="display: flex; margin-left: 10px;" class="add">
                        <p style="font-weight: 500; color: white; background-color: rgb(255 83 48);
                           font-size: 14px; border-radius: 20px; height: fit-content;
                           padding: 1px 10px 2px 20px; width: 90px;">
                            Địa
                            chỉ</p>
                        <p style="font-size: 14px; width: 670px;
                           margin-left: 10px; font-weight: 400; overflow: hidden;">${detailL}</p>
                    </div>
                </div>

                <c:forEach items="${lstCart}" var="c">
                    <c:forEach items="${lstOp}" var="o">
                        <c:if test="${c.getOptionID() == o.getOptionID()}">
                            <c:forEach items="${lstPro}" var="p">
                                <c:if test="${c.getProductID() == p.getProductID()}">
                                    <div style="background-color: #fafafa; margin-top: 15px; padding-bottom: 20px;">
                                        <div style="display: flex; height: 36px; border-bottom: 1px solid #EFF0F5;" class="nameShopCart">
                                            <a style="display: flex; margin-top: 7px; margin-left: 30px; color: black;" href="">
                                                <i style="margin-right: 7px; color: #ff7a0e; font-size: 18px;" class="ti-gift"></i>
                                                <p style="font-size: 14px; margin-top: 2px; font-weight: 500;">Gói hàng của bạn</p>
                                                <i style="margin-left: 7px; color: rgba(214, 214, 214, 0.793); font-size: 12px; margin-top: 7px;"
                                                   class=""></i>
                                            </a>
                                        </div>
                                        <div style="display: flex; margin-top: 15px; margin-left: 3px;" class="detailProCart">
                                            <div class="checkBtn">

                                            </div>
                                            <a style="display: flex; color: black;" href="">
                                                <img style="margin-left: 20px;margin-right: 20px;" src="${p.getProductImg1()}"
                                                     width="80px" height="80px" alt="">
                                                <div style="width: 328px;">
                                                    <p style="font-size: 14px;">${p.getProductName()}</p>
                                                </div>
                                                <div style="width: 147px;" class="priceCart">
                                                    <p
                                                        style="font-size: 18px; color: rgb(245, 113, 36); margin-bottom: 10px; margin-top: 30px;">
                                                        ${o.getOptionPrice()}
                                                    </p>
                                                    <a style="color: #757575; margin-left: 20px;" href="">
                                                        <i class=""></i>
                                                    </a>
                                                </div>
                                            </a>

                                            <div class="quantityPro">
                                                <span style="display: flex;">
                                                    <!-- <button style="margin: 0;" type="button" onclick="sub(1)">-</button> -->
                                                    <p>Số lượng:</p>
                                                    <p style="margin-left: -15px;">${c.getProductAmount()}</p>
                                                    <!-- <button type="button" onclick="add(5)">+</button> -->
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </c:forEach>

            </div>

            <div class="right">
                <!-- <div class="location"> -->
                <!-- <p>Địa điểm</p> -->
                <div class="locaDetail">
                    <!-- <i class="mdi mdi-map-marker"></i>
                        <p>Thach Hoa, Thach That, Ha Noi</p> -->
                </div>
                <!-- </div> -->

                <div class="inforOrder">
                    <p>Thông tin đơn hàng</p>
                    <div class="tempCal">
                        <p>Tạm tính (${number} sản phẩm)</p>
                        <p class="price">${totalPrice} VND</p>
                    </div>
                    <div class="ship">
                        <p>Phí vận chuyển</p>
                        <p class="price">0 VND</p>
                    </div>
                </div>

                <div class="vocher">
                    <input class="enterOrder" type="text" placeholder="Mã giảm giá">
                    <input class="smt" type="button" value="ÁP DỤNG">
                </div>

                <div style="margin-top: 30px" class="total">
                    <p>Tổng cộng</p>
                    <div style="margin-bottom: 5px;" class="totalPrice">
                        <p style="font-size: 18px">${totalPrice} VND</p>
                    </div>
                </div>
                <div class="addInfor">
                    <p>Đã bao gồm VAT (nếu có)</p>
                </div>

                <div class="cf">
                    <input type="button" onclick="setProductOrder()" class="smtOrder" value="XÁC NHẬN GIỎ HÀNG(${number})">
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                        $(document).ready(function () {
                            $("#locationAddress").change(function () {
                                $.ajax({
                                    url: "/Lapada/loadDistrict",
                                    type: 'GET',
                                    data: {keyname: $('#locationAddress option:selected').val()},
                                    success: function (data) {
                                        var row = document.getElementById("usDistrict");
                                        row.innerHTML = data;
                                    }
                                });
                            });
                        });
//                        var check = document.querySelector('input[name="addCh"]:checked').value;
//                        document.getElementById("locationOne").innerHTML = check;
                        function setProductOrder() {
                            var check = document.querySelector('input[name="addCh"]:checked').value;
                            var type = 1;
                            $.ajax({
                                url: "/Lapada/addOrder",
                                type: "get", //send it through get method
                                data: {
                                    location: check,
                                    type: type
                                },
                                success: function (data) {
                                    var successUrl = "myOrder"; // might be a good idea to return this URL in the successful AJAX call
                                    window.location.href = successUrl;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }
                        function loadNewLocation() {
                            var check = document.querySelector('input[name="addCh"]:checked').value;
                            var type = 0;
                            $.ajax({
                                url: "/Lapada/addOrder",
                                type: "get", //send it through get method
                                data: {
                                    location: check,
                                    type: type
                                },
                                success: function (data) {
                                    var row = document.getElementById("locationOne");
                                    row.innerHTML = data;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }
                        function w3_open() {
                            document.getElementById("mySidebar").style.display = "block";
                        }

                        function w3_close() {
                            document.getElementById("mySidebar").style.display = "none";
                        }
                        function pupUpOpen() {
                            document.getElementById("pupup").style.display = "block";
                        }

                        function pupUpClose() {
                            document.getElementById("pupup").style.display = "none";
                        }
                        function saveLocation() {
                            var name = document.getElementById("usName").value;
                            var phone = document.getElementById("usPhone").value;
                            var add = document.getElementById("usAdd").value;
                            var city = document.getElementById("usCity").value;
                            var dis = document.getElementById("usDistrict").value;
                            var type = 3;
                            $.ajax({
                                url: "/Lapada/updateProduct",
                                type: "get", //send it through get method
                                data: {
                                    name: name,
                                    phone: phone,
                                    add: add,
                                    city: city,
                                    dis: dis,
                                    type: type
                                },
                                success: function (data) {
                                    window.location.reload();
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }
                        function w3_open() {
                            document.getElementById("mySidebar").style.display = "block";
                        }

                        function w3_close() {
                            document.getElementById("mySidebar").style.display = "none";
                        }

        </script>
    </body>
</html>
