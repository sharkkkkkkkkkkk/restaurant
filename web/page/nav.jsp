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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/nav.css">
</head>
<body>
<div class="nav-box">
    <a href="" class="nav-left"><img src="${pageContext.request.contextPath}/page/iconpicture/餐厅.png" alt="" class="nav-logo">某 某 餐 厅</a>
    <div class="category">
        <a href="${pageContext.request.contextPath}/OrderingMealsServlet" class="category-item">外送点餐</a>
        <a href="${pageContext.request.contextPath}/reserveServlet"  class="category-item">预定</a>
        <a href="https://gaode.com/place/B00140UF1D"  class="category-item">地点</a>
        <a href=""  class="category-item">关于我们</a>
    </div>
    <div class="right">
        <div class="search">
            <div class="search-icondiv"><img src="${pageContext.request.contextPath}/page/iconpicture/search.png" alt="" class=""></div>
            <div class="search-textdiv"><input type="text" placeholder="输入菜品名称搜索"></div>
        </div>
        <%
            String state = (String) session.getAttribute("signin");
            if(state!=null && state.equals("true")) {
                String username = (String) session.getAttribute("UserName");
        %>
        <div class="user">
            <div class="user-icondiv"><img src="${pageContext.request.contextPath}/page/iconpicture/user.png" alt=""></div>
            <div class="user-namediv"><%=username%></div>
        </div>
        <%
            }
            else
            {
        %>
                <a href="${pageContext.request.contextPath}/page/sign_up.jsp" class="unsignin">
                    未 登 录
                </a>
        <%
            }
        %>
    </div>
</div>
</body>
</html>