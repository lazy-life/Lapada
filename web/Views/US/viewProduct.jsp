<%-- 
    Document   : viewProduct
    Created on : Jul 5, 2022, 2:15:43 PM
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
        <title>LAZADA</title>
        <style>
            .buyBtn .btn1:hover, .buyBtn .btn2:hover{
                cursor: pointer;
            }
            .category1::-webkit-scrollbar {
                width: 0 !important;
            }

            .optionPro:hover{
                border: 1px solid #f6823d;
                cursor: pointer;
            }
            .optionPro{
                border: 1px solid black;
            }
            input[type='checkbox'] {
                display: block;
                width: 15px;
                height: 15px;
                /*margin-right: 10px;*/
                /*margin-top: 30px;*/
                border: 1px solid #EFF0F5;
                accent-color: rgb(246 130 61);
            }

            input[type='checkbox']:hover {
                outline: 1px solid rgb(246 130 61);
                cursor: pointer;
            }

            input[type='checkbox'] {
                width: 140px !important;
                height: 30px !important;
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

            input[type='checkbox']:checked:after {
                content: '✔';
                width: 100px;
                height: 30px;
                color: rgb(246 130 61);
            }
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

        <div id="containPr">
            <div class="homeLinkPr">
                <a id="content" href="">Sản Phẩm</a>
                <i class="ti-angle-right"></i>
                <p>${pr.getProductName()}</p>
            </div>
            <div class="rightProductOrder">
                <div class="detailProduct">
                    <!-- //1180 -->
                    <img src="${pr.getProductImg1()}" alt="" width="330px" height="330px">
                    <div class="detaiPro">
                        <div class="nameProduct">
                            <p>${pr.getProductName()}</p>
                        </div>
                        <div style="border: none;" class="brandPro">
                            <p>Thương hiệu: </p>
                            <a href="#">${pr.getProductBrand()}</a>
                        </div>
                        <div  class="detailPrice">
                            <div style="border-bottom: 1px solid #e3e3e3"  class="pricePro">
                                <p id="priceOpLoad" class="priceVND">
                                    ${prOP} ₫
                                </p>
                            </div>
                        </div>
                        <!--<p id="hello"></p>-->
                        <div id="btnCheckB" style="display: flex" class="patternPro">
                            <p>MẪU MÃ</p>
                            <div style="min-height: 20px; max-height: 200px;width: 450px;  margin-left: 10px; margin-top: -10px">
                                <div style="overflow: scroll; overflow-x: hidden; width: 100%; height: 100%;padding-top: 10px;display: flex; flex-wrap: wrap;" class="category1">
                                    <c:forEach items="${ListO}" var="o">
                                        <%--<c:forEach begin="1" end="20">--%>
                                        <div>
                                            <div style="position: relative; margin-bottom: 10px; margin-left: 7px;" class="checkBtn">
                                                <p class="optionPro" style="position: absolute;top: 5px;width: 140px; height: 30px; border: none; text-align: center; overflow: hidden; margin-top: 0px;">${o.getOptionname()}</p>
                                                <input style="background-color: #ffffff00;position: relative; "  type="checkbox" name="options[]" onclick="loadPrice(${o.getOptionID()});onlyOne(this);" value="${o.getOptionID()}" />
                                            </div>
                                        </div>

                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <!--<form action="addOrBuy" method="get">-->
                        <div class="quantityPro">
                            <p>Số lượng</p>
                            <span>
                                <button type="button" onclick="sub(1)">-</button>
                                <input name="quantity" type="number" id="myNumber" value="1" min="1" max="5" step="1" autocomplete="off"
                                       width="100%" height="100%">
                                <button type="button" onclick="add(${prQuan})">+</button>
                            </span>
                        </div>

                        <c:if test="${sessionScope.acc == null}">
                            <div class="buyBtn">
                                <a href="login"><button onclick="buy(${pr.getProductID()})" style="width: 260px; border: none; background-color: #ffffff00"><input class="btn1" type="submit" value="Mua Ngay">
                                    </button></a>
                                <a href="login"><button class="addCart" onclick="addCart(${pr.getProductID()})" style="width: 260px; border: none;
                                                        background-color: #ffffff00"><input class="btn2" type="submit" value="Thêm vào giỏ hàng"></button></a>
                            </div>    
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <div class="buyBtn">
                                <button onclick="buy(${pr.getProductID()})" style="width: 260px; border: none; background-color: #ffffff00">
                                    <input class="btn1" type="submit" value="Mua Ngay"></button>
                                <button class="addCart" onclick="addCart(${pr.getProductID()})" style="width: 260px; border: none; background-color: #ffffff00"><input class="btn2" type="submit" value="Thêm vào giỏ hàng"></button>
                            </div>
                        </c:if>

                        <!--</form>-->

                    </div>

                    <div class="addressShip">
                        <div class="fullShip">
                            <div class="optionShip">
                                <p>Tuỳ chọn gian hàng</p>
                            </div>
                            <div class="localShip">
                                <c:if test="${sessionScope.acc == null}">
                                    <i style="font-size: 24px; margin-top: 7px; margin-right: 5px;" class="ti-location-pin"></i>
                                    <p>Hồ Chí Minh, Quận 1, Phường Phạm Ngũ Lão</p>
                                    <a href="login">THAY ĐỔI</a>
                                </c:if>
                                <c:if test="${sessionScope.acc != null}">
                                    <i style="font-size: 24px; margin-top: 7px; margin-right: 5px;" class="ti-location-pin"></i>
                                    <p id="locationOne">${detailL}</p>
                                    <a onclick="w3_open()">THAY ĐỔI</a>
                                </c:if>

                            </div>

                            <div class="standard">
                                <i style="font-size: 24px; margin-top: 5px; margin-right: 10px; color: black;"
                                   class="mdi mdi-truck"></i>
                                <p class="GH">GH tiêu chuẩn</p>
                                <p class="free">Miễn phí</p>
                            </div>
                            <div class="payMoney">
                                <i style="font-size: 24px; margin-top: 7px; margin-right: 5px;"
                                   style="font-size: 24px; margin-top: 7px; margin-right: 5px;" class="ti-money"></i>
                                <p>Thanh toán khi nhận hàng. (Không được đồng kiểm)</p>
                            </div>
                        </div>
                        <div class="fullShip">
                            <div class="optionShip">
                                <p>Đổi trả và Bảo hành</p>
                            </div>
                            <div style="border: none;" class="localShip">
                                <i style="font-size: 20px; margin-top: 8px; margin-right: 7px;" class="ti-reload"></i>
                                <p style="width: 250px; margin-top: 8px;">7 ngày trả hàng cho Nhà bán hàng</p>
                            </div>
                            <div style="border: none;" class="localShip">
                                <i style="font-size: 24px; margin-top: 5px; margin-right: 5px;"
                                   class="mdi mdi-shield-outline"></i>
                                <p style="margin-top: 12px;">Bằng Tem bảo hành 6 tháng</p>
                            </div>
                        </div>
                        <div style="width: 100%; height: 10px; background-color: #fff;" class="breakShop">
                        </div>
                        <div style="margin-top: 10px;" class="fullShip">
                            <div class="optionShip">
                                <p>Được bán bởi</p>
                            </div>
                            <div style=" margin-top: 1px;" class="localShip">
                                <p style="font-size: 16px; width: 250px; margin-top: 8px;">Lemart
                                </p>
                            </div>
                            <div class="tableReview">
                                <div style="border-right:1px solid #b7b7b7 ;" class="votePositive">
                                    <p>Tổng số sản phẩm</p>
                                    <h1>200</h1>
                                </div>
                                <div class="orderTrue">
                                    <p>Giao đúng hạn</p>
                                    <h1>100%</h1>
                                </div>
                                <div style="border-left:1px solid #b7b7b7 ;" class="rateResponse">
                                    <p>Voucher</p>
                                    <h1>20%</h1>
                                </div>
                            </div>
                            <div class="welcomeShop">
                                <a href="viewShop">ĐẾN GIAN HÀNG</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="middelProduct">
                <div class="presentPro">
                    <h1>MÔ TẢ SẢN PHẨM</h1>
                    <div style="width: 950px" class="textDetailProduct">
                        <p class="inforProductDetail">${pr.getProductDetail()}</p>
                    </div>

                    <div style="width: 100%; height: 20px; background-color: #f5f5f5;" class="breakVote">

                    </div>

                    <div style="height: fit-content" class="botProduct">
                        <h1>ĐÁNH GIÁ SẢN PHẨM</h1>
                        <div class="allAttr">
                            <div class="voteStar">
                                <div style="display: flex; margin-top: 10px; margin-left: 10px">
                                    <img src="assets/imgLazada/img_default.png" style="border-radius: 50%" width="50px" height="50px" alt="alt"/>
                                    <p style="margin-top: 10px; margin-left: 20px; font-size: 18px">san pham ok</p>
                                </div>
                            </div>
                            <div class="imaggeVote">
                            </div>
                        </div>
                        
                        
                        
                        <div class="allAttr">
                            <div class="voteStar">
                                <div style="display: flex; margin-top: 10px; margin-left: 10px">
                                    <img src="assets/imgLazada/img_default.png" style="border-radius: 50%" width="50px" height="50px" alt="alt"/>
                                    <p style="margin-top: 10px; margin-left: 20px; font-size: 18px">${pr.getProductComment()}</p>
                                </div>
                            </div>
                            <div class="imaggeVote">
                            </div>
                        </div>
                        
                        
                        
                    </div>

                </div>

                <div class="rightMiddel">

                </div>

            </div>
            <div style="margin-bottom: 30px" class="suggest">
                <p style="margin-bottom: 10px; margin-left: 145px">Dành riêng cho bạn</p>
                <div id="content" style="display: flex; flex-wrap: wrap; width: 1200px; margin: 0 165px 50px 142px" class="product">
                    <c:forEach items="${listP}" var="p">
                        <c:forEach items="${listOp}" var="o">
                            <c:if test="${o.getProductID() == p.getProductID()}">
                                <a href="viewProduct?id=${p.getProductID()}" class="proH" style="margin-top: 10px; margin-right: 5px">
                                    <div style="width: 189px; height: 325px; padding: 0 5px 0 3px; margin: 5px 10px 0 0;" class="productCount">
                                        <div style="width: 190px; height: 325px; background-color: white;" class="product-lst">
                                            <img src='${p.getProductImg1()}' width="189px" height="189px" alt="alt"/>
                                            <p style="width: 173px; height: 36px;font-size: 14px ;line-height: 18px; color: black; overflow: hidden; margin: 10px 5px 5px 5px">${p.getProductName()}</p>
                                            <div style="display: flex">
                                                <p style="margin: 5px 5px 0 7px; color: #f57224; font-size: 18px">${o.getOptionPrice()}</p>
                                            </div>
                                            <p style="margin: 3px 5px 0 130px; opacity: 0.7; font-size: 12px; color: black">Còn 
                                                ${o.getOptionQuan()}</p>
                                        </div>
                                    </div>
                                </a>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </div>
            </div>



            <jsp:include page="footer.jsp"/>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script type="text/javascript">
                                        function loadMore() {
                                            var amount = document.getElementsByClassName("productCount").length;
                                            $.ajax({
                                                url: "/Lapada/loadMore",
                                                type: "get", //send it through get method
                                                data: {
                                                    exits: amount
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML += data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }
                                        var para = "";
                                        function calculate() {

                                            var arr = $.map($('input:checkbox:checked'), function (e, i) {
                                                return +e.value;
                                            });
                                            para = '' + arr.join('');
                                            $('#hello').text(para);
                                        }
                                        calculate();
                                        $('#btnCheckB').delegate('input:checkbox', 'click', calculate);


                                        function loadPrice(id) {
                                            var idOp = id;
                                            $.ajax({
                                                url: "/Lapada/loadPrice",
                                                type: "get", //send it through get method
                                                data: {
                                                    idOp: idOp
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("priceOpLoad");
                                                    row.innerHTML = data;

                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }


                                        function add(element) {
                                            var el = document.getElementById("myNumber").value;
                                            if (el < element) {
                                                document.getElementById("myNumber").value = ++el;
                                            } else {
                                                document.getElementById("myNumber").value = element;
                                            }
                                        }
                                        function sub(element) {
                                            var el = document.getElementById("myNumber").value;
                                            if (el > element) {
                                                document.getElementById("myNumber").value = --el;
                                            }
                                        }

                                        function onlyOne(checkbox) {
                                            var checkboxes = document.getElementsByName('options[]')
                                            checkboxes.forEach((item) => {
                                                if (item !== checkbox)
                                                    item.checked = false
                                            })
                                        }

                                        function addCart(prId) {
                                            var amount = document.getElementById("myNumber").value;
                                            var id = prId;
                                            var idOp = para;
                                            $.ajax({
                                                url: "/Lapada/addCart",
                                                type: "get", //send it through get method
                                                data: {
                                                    amount: amount,
                                                    idPr: id,
                                                    idOp: idOp
                                                },
                                                success: function (data) {
//                                                    var row = document.getElementById("content");
//                                                    row.innerHTML += data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }
                                        function buy(prId) {
                                            var amount = document.getElementById("myNumber").value;
                                            var id = prId;
                                            var idOp = para;
                                            $.ajax({
                                                url: "/Lapada/addCart",
                                                type: "get", //send it through get method
                                                data: {
                                                    amount: amount,
                                                    idPr: id,
                                                    idOp: idOp
                                                },
                                                success: function (data) {
                                                    var successUrl = "shopnow"; // might be a good idea to return this URL in the successful AJAX call
                                                    window.location.href = successUrl;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }
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
                                        var check = document.querySelector('input[name="addCh"]:checked').value;
                                        document.getElementById("locationOne").innerHTML = check;
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
                                            var type = 2;
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
            </script>
    </body>
</html>
