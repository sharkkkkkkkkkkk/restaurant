
<%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/4/15
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/transfer.css">
</head>
<body>
<div class="main">
    <%
            String mod = (String)session.getAttribute("mod");
            String IfSuccess = (String) session.getAttribute("IfSuccess");

            if(IfSuccess.equals("true")){//成功
                if(mod.equals("signup")){
                    out.print("<div class=\"toptext\">注册成功！</div>");
                }
                else if(mod.equals("signin")){
                    out.print("<div class=\"toptext\">登录成功！</div>");
                }
            }
            else{//错误
                String ErrorType = (String)session.getAttribute("errortype");
                if(ErrorType.equals("UserIDExist")){
                    out.print("<div class=\"toptext\">用户名已被注册");
                }
                else if(ErrorType.equals("Unknown")){
                    out.print("<div class=\"toptext\">未知错误</div>");
                }
                else if(ErrorType.equals("WrongPassword")){
                    out.print("<div class=\"toptext\">密码错误</div>");
                }
                else if(ErrorType.equals("NotUserExist")){
                    out.print("<div class=\"toptext\">用户不存在</div>");
                }
            }
    %>
        <div class="bottomtext">
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/js/transfer.js"></script>
</html>
