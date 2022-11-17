<%-- 
    Document   : sendMail
    Created on : Jul 5, 2022, 5:28:32 PM
    Author     : ducda
--%>

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
    </head>
    <body>

    <div  style="height: 110px" id="header">
        <jsp:include page="headerShop.jsp"/>
        <div class="cate">
            <p>Danh mục</p>
            <div class="ti-angle-down"></div>
        </div>
    </div>


    <div style="margin-top: 300px;">
        <div style="text-align: center; margin-top: 100px;">
            <h1 style="font-weight: 500;">VUI LÒNG KIỂM TRA EMAIL CỦA BẠN</h1>
            <i style="margin-top: 50px; font-size: 250px; color: rgb(22, 170, 219);" class="mdi mdi-email-open-outline"></i>
        </div>
    </div>

    </div>
 <jsp:include page="footer.jsp"/>
</body>
</html>
