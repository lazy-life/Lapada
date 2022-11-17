<%-- 
    Document   : addProduct
    Created on : Jul 6, 2022, 10:42:16 PM
    Author     : ducda
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.*"%>
<%@page import="DAL.DAO"%>
<%@page import="java.util.ArrayList" %>
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

            .BtnSendPro:hover {
                cursor: pointer;
            }
            .hideAndShow{
                display: none;
            }
            .showOrHide{
                display: none;
            }
        </style>
    </head>
    <body style="background-color: #eef0f4;">
        <jsp:include page="headerSellerCenter.jsp"/>
        <div style="margin-left: 250px;" id="rightManagerPro">
            <div style="display: flex; padding-top: 20px;" class="pathHead">
                <a href="allProduct">
                    <p style="font-size: 14px; margin-right: 8px;">Trang chủ</p>
                </a>
                <i style="font-size: 12px; margin-top: 5px; margin-right: 8px;" class="ti-angle-right"></i>
                <a href="allProduct">
                    <p style="font-size: 14px; margin-right: 8px;">Quản lý sản phẩm</p>
                </a>
                <i style="font-size: 12px; margin-top: 5px; margin-right: 8px;" class="ti-angle-right"></i>
                <p style="font-size: 14px; font-weight: bolder;">Thêm sản phẩm</p>
            </div>
            <h1 style="margin-top: 20px; font-size: 24px;">Thêm sản phẩm</h1>
            <form action="addProduct" method="post" enctype="multipart/form-data">
                <div style="background-color: #fff; margin-top: 30px; border-radius: 20px; width: 1200px;"
                     id="containRightAdd">
                    <div class="headerAdd">
                        <p style="font-size: 30px;margin-bottom: 5px; font-weight: 600;">Thông tin cơ bản</p>
                        <p style="font-size: 14px;">Vui lòng điền đầy đủ các trường</p>
                    </div>
                    <div style="margin-bottom: 30px" class="midAddProduct">
                        <p>Tên sản phẩm: </p>
                        <input type="text" name="nameProduct" id="ProductName" placeholder="Nhập vào" required>
                    </div>
                    <div style="display: flex; margin-left: 40px; border: none; outline: none;" class="ProductCategory">
                        <p style="margin-right: 110px; font-size: 14px;">Danh mục</p>
                        <select style="border: 1px solid #cbced5; outline: none; width: 760px; height: 40px" name="category" id="">
                            <option value="" disabled="" selected="">Chọn danh mục ngành hàng</option>
                            <c:forEach items="${listC}" var="o">
                                <option value="${o.getCateggoryID()}">${o.getCategoryName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="margin-top: 50px" class="imagePro">
                        <p style="margin-right: 30px; font-size: 14px;">Hình ảnh sản phẩm</p>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input id="img1" name="imgp1" type="file" class="custom-file-input" required>
                            </div>
                            <p>Ảnh bìa *</p>
                        </div>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input id="img2" name="imgp2" type="file" class="custom-file-input">
                            </div>
                            <p>Hình ảnh 1</p>
                        </div>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input id="img3" name="imgp3" type="file" class="custom-file-input">
                            </div>
                            <p>Hình ảnh 2</p>
                        </div>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input id="img4" name="imgp4" type="file" class="custom-file-input">
                            </div>
                            <p>Hình ảnh 3</p>
                        </div>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input id="img5" name="imgp5" type="file" class="custom-file-input">
                            </div>
                            <p>Hình ảnh 4</p>
                        </div>
                    </div>
                    <div class="detailPro">
                        <p style="margin-right: 30px; font-size: 14px;">Mô tả sản phẩm</p>
                        <textarea id="detailProduct" name="detailp" type="textarea" resize="none" rows="2" minrows="9" maxrows="26" autosize="true"
                                  maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="enterDetail"
                                  style="resize: none; min-height: 210px; height: 210px;" required></textarea>
                    </div>
                </div>

                <div style="background-color: #fff; margin-top: 30px; margin-bottom: 20px; border-radius: 20px; width: 1200px; margin-left: 0px;"
                     id="containMidProduct">
                    <div class="headerAdd">
                        <p style="font-size: 30px;margin-bottom: 5px; font-weight: 600;">Thông tin chi tiết</p>
                        <p style="font-size: 14px;">Vui lòng điền đầy đủ các trường</p>
                    </div>
                    <div class="contendMidetail">
                        <div class="midLeftPro">
                            <div class="attPro">
                                <p>Thương hiệu</p>
                                <input type="text" name="brandp" id="brandProduct" placeholder="Thương hiệu" required>
                            </div>
                            <div class="attPro">
                                <p>Nguồn gốc</p>
                                <input type="text" name="countryp" id="countryProduct" placeholder="Nguồn gốc" required>
                            </div>
                        </div>
                        <div class="rightLeftPro">
                            <div class="attPro">
                                <p>Trọng lượng</p>
                                <input type="text" name="weightp" id="weightProduct" placeholder="Trọng lượng (gram)" required>
                            </div>
                            <div class="attPro">
                                <p>Chất liệu</p>
                                <input type="text" name="materialp" id="materialProduct" placeholder="Chất liệu" required>
                            </div>
                        </div>
                    </div>
                </div>


                <div style="background-color: #fff; margin-top: 30px; border-radius: 20px; width: 1200px; margin-left: 0px;
                     margin-bottom: 25px;" id="containBotProduct">
                    <div class="headerAdd">
                        <p style="font-size: 30px;margin-bottom: 5px; font-weight: 600;">Thông tin bán hàng</p>
                        <p style="font-size: 14px;">Vui lòng điền đầy đủ các trường</p>
                    </div>
                    <div class="tableOption">
                        <div style="width: 100%; height: 45px; border: 1px solid black; display: flex">
                            <p style="width: 34.9%; text-align: center; margin-top: 8px; font-size: 16px; font-weight: 500">Loại Sản Phẩm</p>
                            <p style="width: 30.2%; border-left: 1px solid black; border-right: 1px solid black;text-align: center;
                               padding-top: 8px; font-size: 16px; font-weight: 500">Giá</p>
                            <p style="width: 34.6%;text-align: center; margin-top: 8px; font-size: 16px; font-weight: 500">Số Lượng(Kho)</p>
                        </div>

                        <div id="content"></div>

                        <!--                        <div style="width: 100%; height: 50px; display: flex">
                                                    <input type="text" id="xaxa1" style="width: 35%; height: 100%; text-align: center; margin-top: 0; font-size: 14px;
                                                           font-weight: 500" placeholder="Ví Dụ: màu sắc, kích thước,...">
                                                    <input type="text" id="xaxa2" style="width:30%; height: 100%;text-align: center;
                                                           padding-top: 0; font-size: 14px; font-weight: 500" placeholder="Giá theo VND">
                                                    <input type="text" name="xaxa3" style="width: 35%; height: 100%;text-align: center; margin-top: 0; font-size: 14px; font-weight: 500" placeholder="Số lượng">
                                                </div>-->
                        <input type="text" id="xaxa" style="width: 35%; height: 100%; text-align: center; margin-top: 0; font-size: 14px;
                               font-weight: 500" placeholder="Ví Dụ: màu sắc, kích thước,..." >
                        <input type="number" id="xeoxeo" style="width:30%; height: 100%;text-align: center;
                               padding-top: 0; font-size: 14px; font-weight: 500" placeholder="Giá theo VND" >
                        <input type="number" id="xexe" style="width:30%; height: 100%;text-align: center;
                               padding-top: 0; font-size: 14px; font-weight: 500" placeholder="Giá theo VND" >


                        <input class="BtnSendPro" style="margin-top: 30px; margin-left: 480px;  color: #fff;width: 150px;
                               height: 40px; background-color: #1a71ff;
                               border: none; border-radius: 8px;font-size: 16px;margin-bottom: -10px" type="button" onclick="addMore()"  value="Thêm">
                        <!--//luu vao arraylist-->

                    </div>
                    <!--<span id="content"></span>-->
                </div>
                <div style="background-color: #fff; height: 80px; margin-top: 0; border-radius: 20px; width: 1200px;
                     margin-left: 0px;">
                    <input class="BtnSendPro" style=" margin-left: 0;
                           color: #fff; background-color: #1a71ff; border: none; border-radius: 8px; width: 200px;margin-left: 530px;margin-top: 20px;
                           height: 40px; font-size: 16px;" type="submit"  value="Tải Lên">
                </div>
            </form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>


                                   function addMore() {
                                       var h = document.getElementById("xaxa").value;
                                       var h1 = document.getElementById("xeoxeo").value;
                                       var h2 = document.getElementById("xexe").value;
                                       $.ajax({
                                           url: "/Lapada/three",
                                           type: "get", //send it through get method
                                           data: {
                                               name: h,
                                               quan: h2,
                                               price: h1
                                           },
                                           success: function (data) {
                                               document.getElementById("content").innerHTML += data;
                                               document.getElementById("xaxa").value = "";
                                               document.getElementById("xeoxeo").value = "";
                                               document.getElementById("xexe").value = "";
                                           },
                                           error: function (xhr) {
                                               //Do Something to handle error
                                           }
                                       });
                                   }
                                   
        </script>  
    </body>
</html>
