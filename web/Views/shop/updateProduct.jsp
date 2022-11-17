<%-- 
    Document   : updateProduct
    Created on : Jul 8, 2022, 11:51:25 PM
    Author     : ducda
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="assets/css/styleShopLapada.css">
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

            .BtnSendPro:hover {
                cursor: pointer;
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
                <p style="font-size: 14px; font-weight: bolder;">Chỉnh sửa Sản Phẩm</p>
            </div>
            <h1 style="margin-top: 20px; font-size: 24px;">Chỉnh sửa Sản Phẩm</h1>
            <form action="update" method="post" enctype="multipart/form-data">
                <input style="display: none" type="text" name="prID" value="${pr.getProductID()}">
                <div style="background-color: #fff; margin-top: 30px; border-radius: 20px; width: 1200px;"
                     id="containRightAdd">
                    <div class="headerAdd">
                        <p style="font-size: 30px;margin-bottom: 5px; font-weight: 600;">Thông tin cơ bản</p>
                        <p style="font-size: 14px;">Vui lòng điền đầy đủ các trường</p>
                    </div>

                    <!--ten san pham-->
                    <div class="midAddProduct">
                        <p>Tên sản phẩm: </p>
                        <input value="${pr.getProductName()}" type="text" name="nameProduct" id="" placeholder="Nhập vào" required>
                    </div>
                    <div style="display: flex; margin-left: 110px; border: none; outline: none;" class="category">
                        <p style="margin-right: 110px; font-size: 14px;">Danh mục</p>
                        <select style="border: 1px solid #cbced5; outline: none;" name="category" id="">
                            <!--<option value="" disabled="" selected="">Chọn danh mục ngành hàng</option>-->

                            <c:forEach items="${listC}" var="o">                                    
                                <option value="${o.getCateggoryID()}"
                                        <c:if test="${o.getCateggoryID() == pr.getCategoryID()}">
                                            selected
                                        </c:if>>${o.getCategoryName()}</option>
                                </c:forEach>
                        </select>
                    </div>
                    <div style="margin-top:70px" class="imagePro">
                        <p style="margin-right: 30px; font-size: 14px;">Hình ảnh sản phẩm</p>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input value="${pr.getProductImg1()}"  name="imgp1" type="file" class="custom-file-input">
                            </div>
                            <p>Ảnh bìa *</p>
                        </div>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input value="${pr.getProductImg2()}" name="imgp2" type="file" class="custom-file-input">
                            </div>
                            <p>Hình ảnh 1</p>
                        </div>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input value="${pr.getProductImg3()}" name="imgp3" type="file" class="custom-file-input">
                            </div>
                            <p>Hình ảnh 2</p>
                        </div>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input value="${pr.getProductImg4()}" name="imgp4" type="file" class="custom-file-input">
                            </div>
                            <p>Hình ảnh 3</p>
                        </div>
                        <div class="imgP">
                            <div class="btnInputChoosen">
                                <input value="${pr.getProductImg5()}" name="imgp5" type="file" class="custom-file-input">
                            </div>
                            <p>Hình ảnh 4</p>
                        </div>
                    </div>
                    <div class="detailPro">
                        <p style="margin-right: 30px; font-size: 14px;">Mô tả sản phẩm</p>
                        <textarea name="detailp" type="textarea" resize="none" rows="2" minrows="9" maxrows="26" autosize="true"
                                  maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="enterDetail"
                                  style="resize: none; min-height: 210px; height: 210px;">${pr.getProductDetail()}</textarea>
                    </div>
                </div>

                <div style="background-color: #fff; margin-top: 30px; border-radius: 20px; width: 1200px; margin-left: 0px;"
                     id="containMidProduct">
                    <div class="headerAdd">
                        <p style="font-size: 30px;margin-bottom: 5px; font-weight: 600;">Thông tin chi tiết</p>
                        <p style="font-size: 14px;">Vui lòng điền đầy đủ các trường</p>
                    </div>
                    <div class="contendMidetail">
                        <div class="midLeftPro">
                            <div class="attPro">
                                <p>Thương hiệu</p>
                                <input value="${pr.getProductBrand()}" type="text" name="" id="" placeholder="Thương hiệu" required>
                            </div>
                            <div class="attPro">
                                <p>Nguồn gốc</p>
                                <input value="${pr.getProductCountry()}" type="text" name="" id="" placeholder="Nguồn gốc" required>
                            </div>
                        </div>
                        <div class="rightLeftPro">
                            <div class="attPro">
                                <p>Trọng lượng</p>
                                <input value="${pr.getProductWeight()}" type="text" name="" id="" placeholder="Trọng lượng (gram)" required>
                            </div>
                            <div class="attPro">
                                <p>Chất liệu</p>
                                <input value="${pr.getProductMaterial()}" type="text" name="" id="" placeholder="Chất liệu" required>
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
                        <c:forEach items="${listO}" var="o">
                            <c:if test="${o.getProductID() == pr.getProductID()}">
                                <input type="text" id="xaxa" style="width: 35%; height: 100%; text-align: center; margin-top: 0; font-size: 14px;
                                       font-weight: 500" placeholder="Ví Dụ: màu sắc, kích thước,..." value="${o.getOptionname()}">
                                <input type="number" id="xeoxeo" style="width:30%; height: 100%;text-align: center;
                                       padding-top: 0; font-size: 14px; font-weight: 500" placeholder="Giá theo VND" value="${o.getOptionPrice()}" >
                                <input type="number" id="xexe" style="width:30%; height: 100%;text-align: center;
                                       padding-top: 0; font-size: 14px; font-weight: 500" placeholder="Số lượng" value="${o.getOptionQuan()}">
                            </c:if>
                        </c:forEach>

                        <input class="BtnSendPro" style="margin-top: 30px; margin-left: 480px;  color: #fff;width: 150px;
                               height: 40px; background-color: #1a71ff;
                               border: none; border-radius: 8px;font-size: 16px;margin-bottom: -10px" type="button" onclick="addMore()"  value="Thêm">
                        <!--//luu vao arraylist-->

                    </div>
                    <span id="content"></span>
                </div>


                <div style="background-color: #fff; height: 80px; margin-top: 0; border-radius: 20px; width: 1200px;
                     margin-left: 0px;">
                    <input class="BtnSendPro" style="margin-top: 20px; margin-left: 950px; color: #fff; background-color: #1a71ff; border: none; border-radius: 8px; width: 200px;
                           height: 40px; font-size: 16px;" type="submit" value="Lưu thay đổi">
                </div>
            </form>

        </div>
    </div>
</body>
</html>
