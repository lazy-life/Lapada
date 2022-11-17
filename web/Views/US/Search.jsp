<%-- 
    Document   : Search
    Created on : Jul 5, 2022, 2:14:21 PM
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
        <title>LAPADA</title>
        <style>
            .proH:hover{
                box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
            }
            .brandS input[type='checkbox'] {
                display: block;
                width: 16px;
                height: 16px;
                margin-right: 7px;
                border: 1px solid #EFF0F5;
                accent-color: rgb(246 130 61);
            }

            input[type='checkbox']:hover {
                outline: 1px solid rgb(246 130 61);
                cursor: pointer;
            }

            input[type='checkbox'] {
                width: 14px !important;
                height: 14px !important;
                margin: 5px;
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
                color: rgb(246 130 61);
            }
        </style>
    </head>
    <body style="background-color: #fff;">

        <div style="height: 110px" id="header">
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
                    <form action="search">
                        <input name="searchLapada" type="text" value="${key}" placeholder="Tìm kiếm trên Lapada">
                        <i style="position: absolute; height: 45px; width: 45px;" class="ti-search"><input style="position: relative; width: 47px;height: 45px;
                                                                                                           margin-top: -35px; margin-left: -14px; background-color: rgba(255, 255, 255, 0.033);" type="submit" value=""></i>
                    </form>
                </div>
                <div class="cart">
                    <a href="cart">
                        <i class="mdi mdi-cart-outline"></i>
                    </a>
                </div>
            </div>
        </div>
        <div style="margin-top: 115px" class="cate">
            <p>Danh mục</p>
            <div class="ti-angle-down"></div>
        </div>
    </div>

    <div style="" id="contain">
        <div class="homeLink" style="margin-top: 10px; border-bottom: 1px solid #EFF0F5; margin-left: 150px; padding-top: 10px; margin-right: 150px">
            <a style="margin-left: -3px;" href="Home">Trang chủ</a>
            <i class="ti-angle-right"></i>
            <p>Kết quả tìm kiếm</p>
        </div>
        <div style="margin-left: 370px; display: flex; margin-top: 20px; border-bottom: 1px solid #EFF0F5; padding-bottom: 20px;
             margin-right: 170px;" class="topfilter">
            <div class="leftTop" style="width: 50%;">
                <p style="font-size: 18px; font-weight: 400; margin-bottom: 10px;">${key}</p>
                <p style="font-size: 14px;">${total} mặt hàng được tìm thấy theo "${key}"</p>
            </div>
            <div id="sortByKey" class="rightTop" style="display: flex; width: 50%;">
                <p style="margin-left: 170px; font-size: 14px; margin-top: 40px; margin-right: 10px;">Sắp xếp theo: </p>
                <select style="width: 200px; height: 40px; margin-top: 25px; outline: none;" name="" id=""  onchange="javascript:handleSelect(this)">
                    <option value="df">Phù hợp nhất</option>
                    <option value="tc">Giá từ thấp tới cao</option>
                    <option value="ct">Giá từ cao xuống thấp</option>
                </select>
            </div>
        </div>


        <div style="display: flex">
            <div style="width: 20%; height: 1000px; margin-left: 50px;" class="filterPoduct">
                <div style="width: 200px; margin-left: 100px;" class="lstOption">
                    <div style="padding-bottom: 15px; border-bottom: 1px solid #EFF0F5; margin-top: 15px; margin-right: 15px;"
                         class="brandS">
                        <p style="font-size: 14px; font-weight: 500;">Thương hiệu</p>
                        <c:forEach items="${lstBrand}" var="o">
                            <div style="display: flex; margin-top: 15px;">
                                <input type="checkbox" name="check" onclick="onlyOne(this)" value="${o}" />
                                <span style="overflow: hidden; font-size: 13px; margin-top: 3px;">${o}</span>
                            </div>
                        </c:forEach>

                    </div>
                    <div style="padding-bottom: 15px; border-bottom: 1px solid #EFF0F5; margin-top: 15px; margin-right: 20px;"
                         class="brandS">
                        <p style="font-size: 14px; font-weight: 500;">Vật Liệu</p>
                        <c:forEach items="${lstMaterial}" var="o">
                            <div style="display: flex; margin-top: 15px;">
                                <input type="checkbox" name="check1" onclick="onlyOne1(this)" value="${o}" />
                                <span style="overflow: hidden; font-size: 13px; margin-top: 3px;">${o}</span>
                            </div>
                        </c:forEach>
                    </div>
                    <div style="padding-bottom: 15px; border-bottom: 1px solid #EFF0F5; margin-top: 15px; margin-right: 20px;"
                         class="brandS">
                        <p style="font-size: 14px; font-weight: 500;">Khoảng giá</p>
                        <div style="display: flex; margin-top: 15px">
                            <input style="width: 100px" type="number" placeholder="Từ" id="priceone">
                            <p>-</p>
                            <input style="width: 100px; height: 30px" type="number" placeholder="Đến" id="pricesecond">
                        </div>
                        <button style="width: 207px; margin-top: 15px; height: 35px; color: #fff; background-color: rgb(238, 77, 45); border: none;
                                outline: none">Áp Dụng</button>
                    </div>
                </div>

            </div>
            <div id="content"  style="margin-top: 20px; width: 70%" class="listProduct">

                <div style="display: flex; flex-wrap: wrap; width: 100%; margin: 0 170px 50px 20px" class="product">
                    <c:forEach items="${data}" var="p">
                        <c:forEach items="${listOp}" var="o">
                            <c:if test="${p.getProductID() == o.getProductID()}">
                                <a href="viewProduct?id=${p.getProductID()}" class="proH" style="margin-right: 10px; margin-bottom: 10px">
                                    <div style="width: 25%; height: 325px; padding: 0 10px; margin: 15px 10px 0 0;" class="productCount">
                                        <div style="width: 210px; height: 325px; background-color: white;" class="product-lst">
                                            <img src='${p.getProductImg1()}' width="220px" height="220px" alt="alt"/>
                                            <p style="width: 173px; height: 36px;font-size: 14px ;line-height: 18px; color: black; overflow: hidden; margin: 10px 5px 5px 5px">${p.getProductName()}</p>
                                            <div style="display: flex">
                                                <p style="margin: 5px 5px 0 7px; color: #f57224; font-size: 18px">${o.getOptionPrice()}</p>
                                            </div>
                                            <p style="margin: 3px 5px 0 160px; opacity: 0.7; font-size: 12px; color: black">Còn 
                                                ${o.getOptionQuan()}</p>
                                        </div>
                                    </div>
                                </a>
                            </c:if>
                        </c:forEach>
                    </c:forEach>

                </div>
                <!--phan trang-->
                <c:set  var="page" value="${requestScope.page}"/>
                <div class="pageination">
                    <div style="justify-content: center; width: 100%; display:flex">
                        <c:forEach begin="1" end="${sessionScope.num}" var="i">
                            <a style="color: white; padding: 5px 7px; margin: 0 5px; font-size: 19px; border-radius: 7px;background-color: #f57224;" href="search?page=${i}&searchLapada=${key}">${i}</a>
                        </c:forEach>


                    </div>
                </div>
            </div>

        </div>


    </div>
    <jsp:include page="footer.jsp"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

//                                    function handleSelect(elm)
//                                    {
//
//                                        window.location = elm.value;
//                                    }


                                $(document).ready(function () {
                                    $("#sortByKey").change(function () {
                                        $.ajax({
//                                                url: "/Lapada/sortProduct",
                                            url: "/Lapada/tc",
                                            type: 'GET',
                                            data: {keyname: $('#sortByKey option:selected').val()},
                                            success: function (data) {
                                                var row = document.getElementById("content");
                                                row.innerHTML = data;
                                            }
                                        });
                                    });
                                });

                                function sendPage(el) {
                                    var i = el;
                                    $.ajax({
                                        url: "/Lapada/tc",
                                        type: "get", //send it through get method
                                        data: {
                                            page: i
                                        },
                                        success: function (data) {
                                            var row = document.getElementById("content");
                                            row.innerHTML = data;
                                        },
                                        error: function (xhr) {
                                            //Do Something to handle error
                                        }
                                    });
                                }

                                function onlyOne(checkbox) {
                                    var checkboxes = document.getElementsByName('check')
                                    checkboxes.forEach((item) => {
                                        if (item !== checkbox)
                                            item.checked = false
                                    })
                                }
                                function onlyOne1(checkbox) {
                                    var checkboxes = document.getElementsByName('check1')
                                    checkboxes.forEach((item) => {
                                        if (item !== checkbox)
                                            item.checked = false
                                    })
                                }
                                function onlyOne2(checkbox) {
                                    var checkboxes = document.getElementsByName('check2')
                                    checkboxes.forEach((item) => {
                                        if (item !== checkbox)
                                            item.checked = false
                                    })
                                }

    </script>  

</body>
</html>
