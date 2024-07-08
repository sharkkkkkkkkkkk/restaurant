<%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/5/27
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/bottom.css">
</head>
<body>

<div class="bottom-box">
    <div class="bottom-left">
        <img src="${pageContext.request.contextPath}/page/iconpicture/餐厅.png" alt="">
    </div>
    <div class="bottom-middle">
        <div>地址：  天河区中山大道西293号</div>
        <div>电话：  1234567890</div>
        <a href="" style="text-decoration: none; color: white">关  于 我 们</a>
    </div>
    <div class="bottom-rightbox"><img src="${pageContext.request.contextPath}/page/iconpicture/二维码.jpg" alt="">
        <div class="img-text">扫码添加微信
            <hr>
            <div style="font-size: 30px;">某 某<br>餐 厅</div>
        </div>
    </div>
</div>
</body>

</html>