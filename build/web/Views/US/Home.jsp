<%-- 
    Document   : Home
    Created on : Jul 5, 2022, 2:11:36 PM
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
        <title>LAPADA Vietnam - Mua Hàng Trực Tuyến Giá Tốt</title>
        <link rel="icon" type="image/x-icon" href="assets/imgLazada/logoIcon.png">
        <style>
            .cataImg:hover{
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            }
            .proH:hover{
                box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            }
            .mySlides {
                display: none;
            }
            .prev, .next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                margin-top: -22px;
                padding: 16px;
                color: white;
                font-weight: bold;
                font-size: 18px;
                transition: 0.6s ease;
                border-radius: 0 3px 3px 0;
                user-select: none;
            }

            /* Position the "next button" to the right */
            .next {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
                background-color: rgba(0,0,0,0.8);
            }
            .fade {
                animation-name: fade;
                animation-duration: 1.5s;
            }

            @keyframes fade {
                from {
                    opacity: .4
                }
                to {
                    opacity: 1
                }
            }


            .category::-webkit-scrollbar {
                width: 0 !important;
            }
            .category ul li:hover {
                background-color: rgba(214, 214, 214, 0.793) !important;
                font-weight: 500;

            }
            .ulLiAP{
                color: #757575;

            }
            .ulLiAP p{
                font-size: 13px;

            }
            .ulLiAP:hover{
                color: #ff7a0e;
            }

            .example::-webkit-scrollbar {
                display: none;
            }

            /* Hide scrollbar for IE, Edge and Firefox */
            .example {
                -ms-overflow-style: none;  /* IE and Edge */
                scrollbar-width: none;  /* Firefox */
            }

        </style>
    </head>
    <body>

        <div style="height: 110px" id="header">
            <jsp:include page="headerShop.jsp"/>
        </div>
        <div id="container">
            <!-- The dots/circles -->

            <div class="sliderImg">
                <div style="width: 100%; background-color: red; position: relative;" class="slideshow-container">
                    <!--<img src="assets/imgLazada/anhsl1.jpg" width="100%" height="344px" alt="alt"/>-->
                    <div style="width: 100%; height: 344px" class="mySlides fade">
                        <img src="assets/imgLazada/anhsl1.jpg" width="100%" height="344px">
                    </div>
                    <div style="width: 100%; height: 344px" class="mySlides fade">
                        <img src="assets/imgLazada/anhsl2.jpg" width="100%" height="344px">
                    </div>
                    <div style="width: 100%; height: 344px" class="mySlides fade">
                        <img src="assets/imgLazada/anhsl3.jpg" width="100%" height="344px">
                    </div>
                    <div style="width: 100%; height: 344px" class="mySlides fade">
                        <img src="assets/imgLazada/anhsl4.jpg" width="100%" height="344px">
                    </div>
                    <div style="width: 100%; height: 344px" class="mySlides fade">
                        <img src="assets/imgLazada/anhsl5.jpg" width="100%" height="344px">
                    </div>
                    <div style="width: 100%; height: 344px" class="mySlides fade">
                        <img src="assets/imgLazada/anhsl6.jpg" width="100%" height="344px">
                    </div>
                    <div style="width: 100%; height: 344px" class="mySlides fade">
                        <img src="assets/imgLazada/anhsl7.jpg" width="100%" height="344px">
                    </div>
                    <div style="width: 100%; height: 344px" class="mySlides fade">
                        <img src="assets/imgLazada/anhsl8.jpg" width="100%" height="344px">
                    </div>

                    <!-- Next and previous buttons -->
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>
                <br>

                <div style="height: 345px; overflow: scroll; overflow-x: hidden;" class="category">
                    <c:forEach items="${listC}" var="o">
                        <ul>
                            <li><a class="ulLiAP" href="searchCate?idC=${o.getCateggoryID()}"><p>${o.getCategoryName()}</p></a></li>
                        </ul>

                    </c:forEach>
                </div>
            </div>

            <div class="lstCate">
                <p>Danh mục ngành hàng</p>
                <div style="height: 297px;
                     width: 1188px;
                     margin: 15px 0 0 180px;
                     background-color: #fff; display: flex; overflow: scroll; overflow-x: hidden; flex-wrap: wrap;" class="example">
                    <c:forEach items="${listCate}" var="c"> 
                        <a class="cataImg"  style="width: calc(100%/10); height: 149px; border: 1px solid rgb(152 152 152 / 10%); text-align: center;
                           color: black" href="searchCate?idC=${c.getCateggoryID()}">
                            <div >
                                <img style="border-radius: 50px; margin-top: 10px;" src="${c.getCategoryImg()}" width="84px" height="89px" alt="alt"/>
                                <p style="margin: 0; font-size: 14px; margin-bottom: 10px; margin-left: 2px; margin-right: 2px">${c.getCategoryName()}</p>
                            </div>
                        </a>
                    </c:forEach>
                </div>

            </div>

            <div style="margin-bottom: 10px" class="suggest">
                <p style="margin-bottom: 10px">Dành riêng cho bạn</p>
                <div id="content" style="display: flex; flex-wrap: wrap; width: 1200px; margin: 0 165px 50px 175px" class="product">
                    <c:forEach items="${listP}" var="p">
                        <c:forEach items="${listOp}" var="o">
                            <c:if test="${o.getProductID() == p.getProductID()}">
                                <a href="viewProduct?id=${p.getProductID()}" class="proH" style="margin-top: 10px; margin-right: 5px">
                                    <div style="width: 185px; height: 325px; padding: 0 5px 0 3px; margin: 5px 10px 0 0;" class="productCount">
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
                <button onclick="loadMore()" style="
                        margin: 0 auto;
                        display: block;
                        width: 387px;
                        height: 40px;
                        line-height: 40px;
                        text-align: center;
                        font-size: 14px;
                        color: #1a9cb8;
                        border: 1px solid #1a9cb8;
                        text-transform: uppercase;
                        cursor: pointer;">Load more</button>
            </div>
            <div class="imgShow">
                <img src="assets/imgLazada/ft1.png" alt="img1">
                <img src="assets/imgLazada/ft2.png" alt="img2">
                <img src="assets/imgLazada/ft3.png" alt="img3">
            </div>
            <div class="end">

            </div>
        </div>

        <jsp:include page="footer.jsp"/>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
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
                    let slideIndex = 0;
                    showSlides();

                    function showSlides() {
                        let i;
                        let slides = document.getElementsByClassName("mySlides");
                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                        }
                        slideIndex++;
                        if (slideIndex > slides.length) {
                            slideIndex = 1
                        }
                        slides[slideIndex - 1].style.display = "block";
                        setTimeout(showSlides, 5000); // Change image every 2 seconds
                    }
        </script>  
    </body>
</html>
