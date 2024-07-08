
<%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/6/2
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
</head>
<body>
<div class="left-nav">
    <div class="text">某某餐厅后台管理系统</div>
    <ul>
        <%
            String mod = (String)request.getAttribute("mod");
            if(mod==null || mod.equals("managedishes"))
            {
        %>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=managedishes" style="text-decoration: none"><li class="select">管理菜品</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageOrder" style="text-decoration: none"><li>管理订单</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageSeatOrder" style="text-decoration: none"><li>管理预约</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageChart" style="text-decoration: none"><li>管理轮播图</li></a>
        <%
            }
            else if(mod.equals("manageOrder") || mod.equals("manageOrderItem")){
        %>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=managedishes" style="text-decoration: none"><li>管理菜品</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageOrder" style="text-decoration: none"><li class="select">管理订单</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageSeatOrder" style="text-decoration: none"><li>管理预约</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageChart" style="text-decoration: none"><li>管理轮播图</li></a>
        <%
            }
            else if(mod.equals("manageSeatOrder")){
        %>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=managedishes" style="text-decoration: none"><li>管理菜品</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageOrder" style="text-decoration: none"><li>管理订单</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageSeatOrder" style="text-decoration: none"><li class="select">管理预约</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageChart" style="text-decoration: none"><li>管理轮播图</li></a>
        <%
            }else if(mod.equals("manageChart")){
        %>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=managedishes" style="text-decoration: none"><li>管理菜品</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageOrder" style="text-decoration: none"><li>管理订单</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageSeatOrder" style="text-decoration: none"><li>管理预约</li></a>
        <a href="${pageContext.request.contextPath}/adminServlet?mod=manageChart" style="text-decoration: none"><li class="select">管理轮播图</li></a>
        <%
            }
        %>
    </ul>
</div>
<div class="right-box">
        <%
            if(mod==null || mod.equals("managedishes")){
        %>
            <jsp:include page="managedishes.jsp"/>
        <%
            }
            else if(mod.equals("manageOrder")){
        %>
            <jsp:include page="manageOrder.jsp"/>
        <%
            }
            else if(mod.equals("manageOrderItem")){
        %>
            <jsp:include page="manageOrderItem.jsp"/>
        <%
            }
            else if(mod.equals("manageSeatOrder")){
        %>
            <jsp:include page="manageSeatOrder.jsp"/>
        <%
            }
            else if(mod.equals("manageChart")){
        %>
            <jsp:include page="manageCarouselChart.jsp"/>
        <%
            }
        %>
</div>
</body>
<script type="text/javascript"></script>
</html>