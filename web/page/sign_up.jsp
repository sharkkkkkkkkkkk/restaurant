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
    <title>新用户注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/sign_up.css">
</head>
<body id="body" >

<div  id="centerbox">
    <form action="${pageContext.request.contextPath}/Sign_upServlet" style="width: 90%;" onsubmit="return check()">
        <h2 class="hr">新 用 户 注 册</h2>
        <hr class="hr" width="90%" style="margin: 0px 0px 30px 0px;border:white 1px solid;">
        <table >
            <tr>
                <td class="lefttext">邮箱：</td>
                <td><input type="email" name="Email" id="email" class="text"></td>
                <td></td>
            </tr>
            <tr>
                <td class="lefttext">用户名：</td>
                <td><input type="text" name="UserID" id="username" class="text"  onchange="checkusername()"></td>
                <td id="usernamemsg" class="righttext"></td>
            </tr>
            <tr>
                <td class="lefttext">密码：</td>
                <td><input type="password" name="Password" id="password" class="text"  onchange="checkpassword()"><div id="circle"></div>
                </td>
                <td id="passwordmsg" class="righttext"></td>
            </tr>
            <tr>
                <td class="lefttext">重复密码：</td>
                <td ><input type="password" name="" id="password1" class="text" onchange="checkpassword1()">
                    <img src="../page/iconpicture/隐藏.png" alt="" class="eyeimg" id="changeeye" onclick="change()">
                </td>
                <td id="password1msg" class="righttext"></td>
            </tr>

            <tr>
                <td class="lefttext">联系电话：</td>
                <td ><textarea name="Phone" id="phone" cols="40" rows="1" style="resize: none;" class="text"></textarea></td>
                <td></td>
            </tr>
            <tr >
                <td colspan="3" align="center"><input type="submit" name="" id="botton" value="同意并提交" class="botton"></td>
            </tr>
        </table>
        <a href="${pageContext.request.contextPath}/page/sign_in.jsp" class="bottoma">已有账号？去登录</a>
    </form>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/js/sign_up.js"></script>
</html>
