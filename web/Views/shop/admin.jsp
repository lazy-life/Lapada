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
        </style>
    </head>
    <body style="background-color: #eef0f4;">
        <jsp:include page="adminHeader.jsp"/>
        <div style="margin-left: 250px;" id="rightManagerPro">
            <div style="display: flex; padding-top: 20px;" class="pathHead">
                <a href="">
                    <p style="font-size: 14px; margin-right: 8px;">Trang chủ</p>
                </a>
                <i style="font-size: 12px; margin-top: 5px; margin-right: 8px;" class="ti-angle-right"></i>
                <p style="font-size: 14px; font-weight: bolder;">Quản lý tài khoản</p>
            </div>
            <h1 style="margin-top: 20px; font-size: 24px;">Quản lý tài khoản</h1>
            <div style="display: flex; margin-top: 30px;" class="midHead">
                <p style="font-size: 16px; font-weight: 500; color: #1a71ff; border-bottom: 3px solid #1a71ff; padding-bottom: 8px;
                   margin-right: 950px;">
                    Tất cả</p>
                <a href="addProduct">

                </a>
            </div>
            <div style="width: fit-content; background-color: #fff; margin-top: 30px; border-radius: 20px;" class="filPro">

            </div>
            <div style="width: fit-content; min-height: 80px; background-color: #fff; margin-top: 30px; border-radius: 20px;"
                 class="filPro">
                <div style="display: flex;" class="top">
                    <div style="width: 460px;" class="inf">
                        <p
                            style="margin-left: 40px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Tên tài khoản</p>
                    </div>
                    <div style="width: 202px;" class="price">
                        <p
                            style="margin-left: 20px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Trạng thái</p>
                    </div>
                    <div style="width: 182px;" class="quan">
                        <p
                            style="margin-left: 20px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Shop</p>
                    </div>
                    <div style="width: 222px;" class="contn">
                        <p
                            style="margin-left: 20px; font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Tên</p>
                    </div>
                    <div style="width: 130px;" class="optional">

                    </div>
                </div>
                <div id="content">
                    <c:forEach items="${lstU}" var="u">
                        <div style="display: flex; border-top: 1px solid #cbced5; padding-top: 5px; padding-bottom: 15px;"
                             class="mid">
                            <div style="width: 460px;" class="inf">
                                <div style="display: flex; margin-left: 40px;  font-size: 14px; margin-top: 6px; font-weight: 470;">
                                   
                                        <img style="border-radius: 10px;" src="${u.getUserImg()}" alt="" width="48px"
                                             height="48px">
                                    <p style="margin-left: 10px; margin-top: 0px; font-weight: bold; font-size: 14px; width: 400px; height: 40px;
                                       overflow: hidden;">${u.getUserID()}</p>
                                </div>
                            </div>
                            <div style="width: 202px;" class="price">
                                <c:if test="${u.getUserStatus() == 0}">
                                    <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470; color: red">not activated
                                    </p></c:if>
                                <c:if test="${u.getUserStatus() == 1}">
                                    <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470; color: green">activated
                                    </p></c:if>
                                <c:if test="${u.getUserStatus() == 3}">
                                    <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470; color: blue">admin
                                    </p></c:if>
                                </div>
                                <div id="sortByKey" style="width: 182px;" class="quan">
                                    <select style="border: 1px solid #cbced5; outline: none;" name="category" id="">
                                        <option value="1-${u.getUserID()}">actived</option>
                                        <option value="0-${u.getUserID()}">disable</option>
                                        <option value="3-${u.getUserID()}">admin</option>
                                </select>
                                <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470;">${o.getOptionQuan()}</p>
                            </div>
                            <div style="width: 220px; height: 45px; overflow: hidden;" class="contn">
                                <p
                                    style="margin-left: 20px; font-size: 13px; margin-top: 6px; font-weight: 470; text-align: justify;">${u.getUserName()}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!--phan trang-->
                <c:set  var="page" value="${requestScope.page}"/>
<!--                <div class="pageination">
                    <div style="justify-content: center; width: 100%; display:flex">
                        <c:forEach begin="1" end="${sessionScope.num}" var="i">
                            <a style="color: white; padding: 5px 7px; margin: 0 5px; font-size: 19px; border-radius: 7px;background-color: #1a71ff;" href="allProduct?page=${i}">${i}</a>
                        </c:forEach>
                    </div>
                </div>-->


            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

                                    $(document).ready(function () {
                                        $("#sortByKey").change(function () {
                                            $.ajax({
                                                url: "/Lapada/adminManager",
                                                type: 'GET',
                                                data: {keyname: $('#sortByKey option:selected').val()},
                                                success: function (data) {
                                                    window.location.reload();
                                                }
                                            });
                                        });
                                    });

                                    

    </script>  
    </body>
</html>
