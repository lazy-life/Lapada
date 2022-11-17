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
        <jsp:include page="headerSellerCenter.jsp"/>
        <div style="margin-left: 250px;" id="rightManagerPro">
            <div style="display: flex; padding-top: 20px;" class="pathHead">
                <a href="">
                    <p style="font-size: 14px; margin-right: 8px;">Trang chủ</p>
                </a>
                <i style="font-size: 12px; margin-top: 5px; margin-right: 8px;" class="ti-angle-right"></i>
                <p style="font-size: 14px; font-weight: bolder;">Quản lý sản phẩm</p>
            </div>
            <h1 style="margin-top: 20px; font-size: 24px;">Quản lý sản phẩm</h1>
            <div style="display: flex; margin-top: 30px;" class="midHead">
                <p style="font-size: 16px; font-weight: 500; color: #1a71ff; border-bottom: 3px solid #1a71ff; padding-bottom: 8px;
                   margin-right: 950px;">
                    Tất cả</p>
                <a href="addProduct">
                    <button class="btnAdd"
                            style="color: #fff; background-color: #1a71ff; border: none; border-radius: 8px; width: 200px; height: 40px;">
                        <p style="font-size: 16px;"><i style="font-size: 18px; margin-right: 5px;" class="mdi mdi-plus"></i>Thêm
                            sản phẩm</p>
                    </button>
                </a>
            </div>
            <div style="width: fit-content; background-color: #fff; margin-top: 30px; border-radius: 20px;" class="filPro">
                <div style="margin-left: 20px; padding-top: 20px;" class="filPro">
                    <p>Lọc sản phẩm:</p>
                </div>
                <div style=" display: flex; padding: 20px 20px;" class="headBar">
                    <div style="display: flex; border: 1px solid #cbced5; border-radius: 5px; height: 35px; margin-right: 20px;"
                         class="filter">
                        <p style="font-size: 14px; border-right: 1px solid #cbced5; padding: 5px 20px 3px 10px;">Tên sản
                            phẩm
                        </p>
                        <input oninput="searchByName(this)" style="outline: none; border: none; padding-left: 10px; width: 290px;" type="text"
                               placeholder="Vui lòng nhập" name="searAjax">
                    </div>
                    <div style="display: flex; border: 1px solid #cbced5; border-radius: 10px; height: 35px; margin-right: 20px;"
                         class="filter">
                        <p style="font-size: 14px; border-right: 1px solid #cbced5; padding: 5px 20px 3px 10px;">Ngành hàng
                        </p>
                        <select style="outline: none; border: none; width: 250px;" name="" id="">
                            <option selected value="" disabled>Chọn ngành hàng</option>
                            <c:forEach items="${listC}" var="o">                                    
                                <option value="${o.getCateggoryID()}"
                                        <c:if test="${o.getCateggoryID() == pr.getCategoryID()}">
                                            selected
                                        </c:if>>${o.getCategoryName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="display: flex; border: 1px solid #cbced5; border-radius: 10px; height: 35px; margin-right: 20px;"
                         class="filter">
                        <p style="font-size: 14px; border-right: 1px solid #cbced5; padding: 5px 20px 3px 10px;">Sắp xếp</p>
                        <select style=" outline: none; border: none; width: 250px;" name="" id="">
                            <option selected value="" disabled>Sắp xếp</option>
                            <option value="">Giá tăng dần</option>
                            <option value="">Giá giảm dần</option>
                            <option value="">A-Z</option>
                            <option value="">Z-A</option>
                        </select>
                    </div>
                </div>
            </div>
            <div style="width: fit-content; min-height: 80px; background-color: #fff; margin-top: 30px; border-radius: 20px;"
                 class="filPro">
                <div style="display: flex;" class="top">
                    <div style="width: 460px;" class="inf">
                        <p
                            style="margin-left: 40px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Thông tin sản
                            phẩm</p>
                    </div>
                    <div style="width: 202px;" class="price">
                        <p
                            style="margin-left: 20px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Giá</p>
                    </div>
                    <div style="width: 182px;" class="quan">
                        <p
                            style="margin-left: 20px;  font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Kho</p>
                    </div>
                    <div style="width: 222px;" class="contn">
                        <p
                            style="margin-left: 20px; font-size: 14px; margin-top: 20px; margin-bottom: 20px; font-weight: 500;">
                            Nội dung</p>
                    </div>
                    <div style="width: 130px;" class="optional">

                    </div>
                </div>
                <div id="content">
                    <c:forEach items="${data}" var="p">
                        <c:forEach items="${listOp}" var="o">
                            <c:if test="${o.getProductID() == p.getProductID()}">
                                <div style="display: flex; border-top: 1px solid #cbced5; padding-top: 5px; padding-bottom: 15px;"
                                     class="mid">
                                    <div style="width: 460px;" class="inf">
                                        <div style="display: flex; margin-left: 40px;  font-size: 14px; margin-top: 6px; font-weight: 470;">
                                            <img style="border-radius: 10px;" src="${p.getProductImg1()}" alt="" width="48px"
                                                 height="48px">
                                            <p style="margin-left: 10px; margin-top: 0px; font-weight: bold; font-size: 14px; width: 400px; height: 40px;
                                               overflow: hidden;">${p.getProductName()}</p>
                                        </div>
                                    </div>
                                    <div style="width: 202px;" class="price">
                                        <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470;">
                                            <span style="margin-right: 2px; font-size: 12px;">₫</span>${o.getOptionPrice()}
                                        </p>
                                    </div>
                                    <div style="width: 182px;" class="quan">
                                        <p style="margin-left: 20px;  font-size: 14px; margin-top: 10px; font-weight: 470;">${o.getOptionQuan()}</p>
                                    </div>
                                    <div style="width: 220px; height: 45px; overflow: hidden;" class="contn">
                                        <p
                                            style="margin-left: 20px; font-size: 13px; margin-top: 6px; font-weight: 470; text-align: justify;">${p.getProductDetail()}</p>
                                    </div>
                                    <div style="width: 130px;" class="optional">
                                        <a style="font-size: 14px; margin-left: 40px; font-weight: 450; margin-top: 10px; color: #1a71ff;"
                                           href='UpdateNewProduct?id=${p.getProductID()}'>Chỉnh sửa</a>
                                        <a onclick="deleteProduct(${p.getProductID()})" style="font-size: 14px; margin-left: 40px; font-weight: 450; margin-top: 10px; color: #1a71ff;"
                                           href=''>Xoá</a>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </div>

                <!--phan trang-->
                <c:set  var="page" value="${requestScope.page}"/>
                <div class="pageination">
                    <div style="justify-content: center; width: 100%; display:flex">
                        <c:forEach begin="1" end="${sessionScope.num}" var="i">
                            <a style="color: white; padding: 5px 7px; margin: 0 5px; font-size: 19px; border-radius: 7px;background-color: #1a71ff;" href="allProduct?page=${i}">${i}</a>
                        </c:forEach>
                    </div>
                </div>


            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>


                                        function deleteProduct(element) {
                                            var h = element;
                                            var type = 1;
                                            $.ajax({
                                                url: "/Lapada/updateProduct",
                                                type: "get", //send it through get method
                                                data: {
                                                    name: h,
                                                    type: type
                                                },
                                                success: function (data) {
                                                    window.location.reload();
//                                               reload
//                                               document.getElementById("content").innerHTML += data;
//                                               document.getElementById("xaxa").value = "";
//                                               document.getElementById("xeoxeo").value = "";
//                                               document.getElementById("xexe").value = "";
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }

                                        function  searchByName(param) {
                                            var txtS = param.value;
                                            $.ajax({
                                                url: "/Lapada/searchControll",
                                                type: "get", //send it through get method
                                                data: {
                                                    txt: txtS
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

        </script> 
    </body>
</html>
