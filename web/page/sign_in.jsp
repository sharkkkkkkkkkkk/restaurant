<%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/6/1
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/sign_in.css">
</head>

<body id="body" >
<div  id="centerbox">
    <form action="${pageContext.request.contextPath}/Sign_InServlet" style="width: 90%;" onsubmit="return check()" method="POST">
        <h2 class="hr">登 录</h2>
        <br>
        <hr class="hr" width="90%" style="margin: 0px 0px 30px 0px;border:white 1px solid;">
        <table >
            <tr>
                <td class="lefttext">用户名：</td>
                <td><input type="text" name="username" id="username" class="text"  onchange="checkusername()"></td>
                <td id="usernamemsg" class="righttext"></td>
            </tr>
            <tr>
                <td class="lefttext">密码：</td>
                <td><input type="password" name="password" id="password" class="text"  onchange="checkpassword()"><img src="../page/iconpicture/隐藏.png" alt="" class="eyeimg" id="changeeye" onclick="change()"><div id="circle"></div>
                </td>
                <td id="passwordmsg" class="righttext"></td>
            </tr>
            <tr >
                <td colspan="3" align="center"><input type="submit" name="" id="botton" value="登 录" class="botton"></td>

            </tr>
        </table>
        <a href="${pageContext.request.contextPath}/page/sign_up.jsp" class="bottoma">没有账号？去注册</a>
    </form>
</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/js/sign_in.js"></script>
</html>