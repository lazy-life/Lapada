<%-- 
    Document   : mainShop
    Created on : Jul 7, 2022, 3:04:31 PM
    Author     : ducda
--%>
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
        <link rel="stylesheet" href="assets/css/styleShopLapada.css">
        <link rel="icon" type="image/x-icon" href="assets/imgLazada/logoSellerCenter.png">
        <title>Seller Center</title>
        <style>
            .saveShop{
                margin-left: 500px;
                width: 150px;
                height: 50px;
                border-radius: 5px;
                border: none;
                background-color: #f36d00;
                color: #fff;
                font-size: 15px;
            }
            .saveShop:hover {
                background-color: #d65205;
                cursor: pointer;
            }
        </style>
    </head>
    <body style="background-color: #f5f5f5;">
        <div id="headerMainShop">
            <div class="logoShop">
                <img src="assets/imgLazada/logoSell.png" alt="">
            </div>
        </div>

        <form action="saveShop" method="post" enctype="multipart/form-data">
            <p style="color: #123fb2; margin-top: 100px; padding-top: 20px; font-size: 25px;
               font-weight: 470; text-align: center;">Bán Hàng Cùng Lapada. Đăng ký ngay!
            </p>
            <div style=" margin: 20px 160px 30px 160px;
                 width: 1200px; padding-top: 10px; border-radius: 20px; 
                 background-color: #fff;" id="containMainShop">

                <div class="midAddProduct">
                    <p style="margin-left: 60px">Tên Shop: </p>
                    <input style="border-radius: 10px" type="text" name="nameShop" id="" placeholder="Nhập vào" required>
                </div>
                <div style="margin-top: -20px;" class="imagePro">
                    <p style="margin-left: 60px; margin-right: 40px; font-size: 14px;">Ảnh đại diện:</p>
                    <div class="imgP">
                        <div class="btnInputChoosen">
                            <input type="file" name="imgp1" class="custom-file-input">
                        </div>
                    </div>
                </div>

                <div class="detailPro">
                    <p style="margin-left: 60px; margin-right: 30px; font-size: 14px;">Mô tả Shop</p>
                    <textarea type="textarea" resize="none" rows="2" minrows="9" maxrows="26" autosize="true"
                              maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="enterDetail"
                              style="resize: none; min-height: 180px; height: 180px; width: 750px; border-radius: 10px;  border: 1px solid rgb(201, 201, 201);" name="details" required></textarea>
                </div>

                <!--//city-->
                <div style="display: flex; margin-top: 50px" id="AttorneyEmpresa">
                    <p style="margin-right: 50px; margin-left: 95px; font-size: 14px;">Tỉnh/Thành Phố</p>
                    <select name="city" style=" width: 750px; height: 40px; margin-top: -10px; border-radius: 10px;  border: 1px solid rgb(201, 201, 201);" required id="country_id">
                        <option value="" disabled="" selected="">Chọn Tỉnh/Thành Phố</option>
                        <c:forEach items="${listC}" var="o">
                            <option value="${o.getCityID()}">${o.getCityName()}</option>
                        </c:forEach>
                    </select>
                </div>

                <!--//dis-->
                <div style="display: flex; margin-top: 60px">
                    <p style="margin-right: 70px; margin-left: 95px; font-size: 14px; padding-bottom: 50px">Quận/Huyện</p>
                    <select style="width: 750px; height: 40px; margin-top: -10px; border-radius: 10px;  border: 1px solid rgb(201, 201, 201);" required id="content" name="district" class="form-select" aria-label="Default select example">
                        <option>Chọn Quận/Huyện</option>
                    </select>
                </div>

                <div style="display: flex; margin-top: 30px" class="addDetail">
                    <p style="margin-right: 65px; margin-left: 95px; font-size: 14px; padding-bottom: 50px">Địa chi cụ thể</p>
                    <input type="text" name="addDetail" required style="width: 750px; height: 40px; border-radius: 10px; border: 1px solid rgb(201, 201, 201); margin-top: -10px"
                           placeholder="Nhập vào">
                </div>
                <div style="display: flex; margin-top: 30px" class="addDetail">
                    <p style="margin-right: 65px; margin-left: 95px; font-size: 14px; padding-bottom: 50px">Số điện thoại</p>
                    <input type="text" name="sdtShop" required style="width: 750px; height: 40px; border-radius: 10px; border: 1px solid rgb(201, 201, 201); margin-top: -10px"
                           placeholder="Nhập vào">
                </div>
                <button class="saveShop" style="margin-top: 10px; margin-bottom: 30px; margin-left: 500px; color: #fff; background-color: #1a71ff; border: none;
                        border-radius: 10px; width: 200px;
                     height: 40px; font-size: 16px;" type="submit">Tạo Shop</button>
            </div>
        </form>

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
