<%-- 
    Document   : Cart
    Created on : Jul 5, 2022, 2:14:40 PM
    Author     : ducda
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
        <title>LAPADA</title>
        <style>

            .btnDelete:hover{
                color: #cac9ca !important;
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
                margin-top: 10px;
                margin-left: -615px  !important;
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
            .smtOrder:hover {
                cursor: pointer;
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

        <div id="containCart">
            <div class="left">
                <div id="btnCheckB">
                    <div class="selectAll">
                        <div class="enter">
                            <input style="margin-top: 6px;" type="checkbox" name="" id="">
                            <p style="margin-top: -24px;">CHỌN TẤT CẢ(11 SẢN PHẨM)</p>
                            <!--<span id="hello"></span>-->
                        </div>
                        <div class="del">
                            <a style="margin-top: -5px;" href=""><i style="font-size: 25px; color: #757575;"
                                                                    class="mdi mdi-delete-forever"></i></a>
                        </div>
                    </div>
                    
                    <div id="IdCart">
                        <c:forEach items="${listCart}" var="c">
                            <c:forEach items="${listOp}" var="o">
                                <c:if test="${c.getOptionID() == o.getOptionID()}">
                                    <c:forEach items="${listPro}" var="p">
                                        <c:if test="${c.getProductID() == p.getProductID()}">
                                            <c:forEach items="${listSh}" var="s">
                                                <c:if test="${p.getShopID() == s.getShopID()}">

                                                    <div style="background-color: #fff; margin-top: 10px; padding-bottom: 20px;">
                                                        <div style="display: flex; height: 36px; border-bottom: 1px solid #EFF0F5;" class="nameShopCart">
                                                            <a style="display: flex; margin-top: 7px; margin-left: 30px; color: black;" href="">
                                                                <i style="margin-right: 7px; color: #757575; font-size: 18px;" class="mdi mdi-store"></i>
                                                                <p style="font-size: 14px; margin-top: 2px;">${s.getShopName()}</p>
                                                                <i style="margin-left: 7px; color: #757575; font-size: 12px; margin-top: 7px;"
                                                                   class="ti-angle-right"></i>
                                                            </a>
                                                        </div>
                                                        <div style="display: flex; margin-top: 15px; margin-left: 3px;" class="detailProCart">

                                                            <a style="display: flex; color: black; margin-left: 30px" href="">
                                                                <img style="margin-right: 20px; " src="${p.getProductImg1()}" width="80px" height="80px"
                                                                     alt="">
                                                                <div style="width: 328px;">
                                                                    <p style="font-size: 14px;">${p.getProductName()}</p>
                                                                </div>
                                                                <div style="width: 147px;" class="priceCart">
                                                                    <p style="font-size: 18px; color: #f57224; margin-bottom: 10px; margin-top: 10px;">${o.getOptionPrice()} ₫
                                                                    </p>
                                                                    <a style="color: #757575; margin-left: 20px;" href="">
                                                                    </a>
                                                                </div>
                                                            </a>

                                                            <div  class="quantityPro">
                                                                <span>
                                                                    <div style="width: 0px; height: 0px" class="checkBtn">
                                                                        <c:if test="${c.getCartID()== maxCart}">
                                                                            <input type="checkbox" name="options[]" checked="" value="${c.getCartID()}" onclick="viewPrice()" />
                                                                        </c:if>
                                                                        <c:if test="${c.getCartID()!= maxCart}">
                                                                            <input type="checkbox" name="options[]" value="${c.getCartID()}" onchange="viewPrice()" />
                                                                        </c:if>
                                                                    </div>
                                                                    <button class="btnDelete" style="background-color: #f5712400; margin-left: -160px; margin-right: 120px; margin-top: 10px" onclick="deleteC(${c.getCartID()})">
                                                                        <i style="margin-left: 25px"  class="ti-trash"></i>
                                                                    </button>
                                                                    <!--</a>-->
                                                                    <button style="margin: 0;" type="button" onclick="addLess('myNumber${o.getOptionID()}', '${c.getCartID()}');sub('1', 'myNumber${o.getOptionID()}')">-</button>
                                                                    <input style="padding: 3px 3px; margin-top:-3px ;" type="number" id="myNumber${o.getOptionID()}" value="${c.getProductAmount()}"
                                                                           min="1" max="10" step="1" autocomplete="off" width="42px" height="30px">
                                                                    <button type="button" onclick="addMore('myNumber${o.getOptionID()}', '${c.getCartID()}');add('${o.getOptionQuan()}', 'myNumber${o.getOptionID()}')">+</button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </div>


                </div>
            </div>

            <div  class="right">
                <div class="location">
                    <p>Địa điểm</p>
                    <div class="locaDetail">
                        <i class="mdi mdi-map-marker"></i>
                        <p>Thach Hoa, Thach That, Ha Noi</p>
                    </div>
                </div>
                <div id="totalPr">
                    <div id="totalOrder">
                        <div class="inforOrder">
                            <p>Thông tin đơn hàng</p>
                            <div class="tempCal">
                                <p>Tạm tính (0 sản phẩm)</p>
                                <p class="price">0 VND</p>
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

                        <div class="total">
                            <p>Tổng cộng</p>
                            <div class="totalPrice">
                                <p>0 VND</p>
                            </div>
                        </div>
                        <div class="addInfor">
                            <p>Đã bao gồm VAT (nếu có)</p>
                        </div>

                        <div class="cf">
                            <!--<button style="height: 50px; width: 200px; border: none" onclick="setProductOrder()">-->
                            <input type="button" onclick="setProductOrder()" class="smtOrder" value="XÁC NHẬN GIỎ HÀNG(0)">
                            <!--</button>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script  type="text/javascript">
                                var para = "";
                                function calculate() {

                                    var arr = $.map($('input:checkbox:checked'), function (e, i) {
                                        return +e.value;
                                    });
                                    para = '' + arr.join(',');
                                    $('#hello').text(para);
                                }
                                calculate();
                                $('#btnCheckB').delegate('input:checkbox', 'click', calculate);


                                function viewPrice() {
                                    var idCarts = para;
                                    var type = 0;
                                    $.ajax({
                                        url: "/Lapada/orderViewPrice",
                                        type: "get", //send it through get method
                                        data: {
                                            idCarts: idCarts,
                                            type: type
                                        },
                                        success: function (data) {
                                            var row = document.getElementById("totalPr");
                                            row.innerHTML = data;
                                        },
                                        error: function (xhr) {
                                            //Do Something to handle error
                                        }
                                    });
                                }

                                function setProductOrder() {
                                    var idCarts = para;
                                    $.ajax({
                                        url: "/Lapada/Order",
                                        type: "get", //send it through get method
                                        data: {
                                            idCarts: idCarts,
                                        },
                                        success: function (data) {
                                            var successUrl = "buyOrderProduct"; // might be a good idea to return this URL in the successful AJAX call
                                            window.location.href = successUrl;
                                            //                                                                    request.getRequestDispatcher("./Views/US/order.jsp").forward(request, response);
                                            //                                                                    window.location.replace(AJS.params.baseURL+"/Views/US/order.jsp");
                                            //                                                                    window.location = data.url;
                                            //                                                                    var row = document.getElementById("totalOrder");
                                            //                                                                    row.innerHTML = data;
                                            //                                                                  in khi check box click
                                        },
                                        error: function (xhr) {
                                            //Do Something to handle error
                                        }
                                    });
                                }


                                function addMore(elementID, idCart) {
                                    var amount = document.getElementById(elementID).value;
                                    var idC = idCart;
                                    var type = 1;
                                    $.ajax({
                                        url: "/Lapada/changeQuantityCart",
                                        type: "get", //send it through get method
                                        data: {
                                            amount: amount,
                                            idCart: idC,
                                            type: type
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
                                function addLess(elementID, idCart) {
                                    var amount = document.getElementById(elementID).value;
                                    var idC = idCart;
                                    var type = 0;
                                    $.ajax({
                                        url: "/Lapada/changeQuantityCart",
                                        type: "get", //send it through get method
                                        data: {
                                            amount: amount,
                                            idCart: idC,
                                            type: type

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
                                function deleteC(idCart) {
                                    var idC = idCart;
                                    var type = 2;
                                    $.ajax({
                                        url: "/Lapada/changeQuantityCart",
                                        type: "get", //send it through get method
                                        data: {
                                            idCart: idC,
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
                                function add(element, elementID) {
                                    var el = document.getElementById(elementID).value;
                                    var element1 = parseInt(el);
                                    var element2 = parseInt(element);
                                    if (element1 < element2) {
                                        document.getElementById(elementID).value = ++element1;
                                    }
                                }
                                function sub(element, elementID) {
                                    var el = document.getElementById(elementID).value;
                                    var element1 = parseInt(el);
                                    var element2 = parseInt(element);
                                    if (element1 > element2) {
                                        document.getElementById(elementID).value = --element1;
                                    }
                                }

        </script>

    </body>
</html>
