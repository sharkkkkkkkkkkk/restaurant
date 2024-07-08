<%@ page import="java.util.List" %>
<%@ page import="VO.Dish" %>
<%@ page import="VO.CarouselChart" %><%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/5/27
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/index.css">
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<%
    String level = (String)session.getAttribute("UserLevel");
    if(level!=null && level.equals("highest")) {
        response.sendRedirect("adminServlet");
        return;
    }
%>
<div class="shell">
    <ul class="images">
        <%
            List<CarouselChart> ChartList = (List<CarouselChart>)request.getAttribute("ChartList");
            for(CarouselChart Chart: ChartList) {
        %>
        <li class="img"><img src="${pageContext.request.contextPath}/page/iconpicture/advertise/<%=Chart.getSrc()%>" alt=""></li>
        <%
            }
        %>
    </ul>
    <ul class="min">
        <li class="m"></li>
        <li class="m"></li>
        <li class="m"></li>
        <li class="m"></li>
    </ul>
    <div class="button">
        <div class="button-left">&lt;</div>
        <div class="button-right">&gt;</div>
    </div>
</div>
<div class="index-middle-box">
    <a href="${pageContext.request.contextPath}/page/insideView.jsp" class="view-box">
        <img src="${pageContext.request.contextPath}/page/iconpicture/viewinside/Designer.jpeg" alt="">
        <div>餐 厅 环 境</div>
    </a>
    <a href="${pageContext.request.contextPath}/page/cookers.jsp" class="cook-box">
        <img src="${pageContext.request.contextPath}/page/iconpicture/cook/Designer.jpeg" alt="">
        <div>厨 师 团 队</div>
    </a>
</div>
<%
    List<Dish> DishList = (List<Dish>)request.getAttribute("DishList");

%>
<div class="index-popular-dish">
    <div class="title">
        <span style="transform: rotate3d(-3, -3, 1, 40deg);top: 50px;left: 45px;">热</span>
        <span style="transform: rotate3d(-4, -4, 1, 20deg);top: 62px;left: 50px;">门</span>
        <span style="transform: rotate3d(4, -4, -1, 20deg);top: 62px;left: 60px;">菜</span>
        <span style="transform: rotate3d(3, -3, -1, 40deg);top: 50px;left: 65px;">品</span>
    </div>
    <div class="dish-box">
        <%
            for(Dish dish:DishList)
            {
        %>
        <div class="dish-item">
            <div class="dish-img">
                <img src="${pageContext.request.contextPath}/page/iconpicture/dish/<%=dish.getDishImgUrl()%>" alt="">
            </div>
            <div class="dish-title"><%=dish.getDishName()%></div>
            <div class="dish-text"><%=dish.getDishDescription()%></div>
        </div>
        <%
            }
        %>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/js/index.js"></script>
</html>