<%@ page import="java.util.List" %>
<%@ page import="VO.OrderItem" %>
<%@ page import="VO.Order" %><%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/5/31
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/check.css">
</head>
<body>
<div class="blur">
    <div class="centerbox">
        <%
            Order order = (Order)request.getAttribute("order");
            String orderID = order.getOrderID().substring(order.getOrderID().length()-12);
        %>
        <div class="order">订单：<div class="orderid"><%=orderID%></div> </div>
        <img src="${pageContext.request.contextPath}/page/iconpicture/pay.jpg" alt="">
        扫码支付
        <form action="${pageContext.request.contextPath}/PaidOrderServlet">
            <input type="text" name="orderid" value="<%=order.getOrderID()%>" style="display: none;">
            <input type="submit" class="submitbutton" value="我已支付">
        </form>
        <img src="${pageContext.request.contextPath}/page/iconpicture/关闭.png" alt="" class="close">
    </div>
</div>
<div class="dishes">
    订  单
    <div class="dishesbox">
        <%
            List<OrderItem> dishes = (List<OrderItem>)request.getAttribute("dishes");
            for(OrderItem dish : dishes){
        %>
        <div class="dishItem">
            <div><%=dish.getDishName()%></div>
            <div>数量：<%=dish.getNum()%></div>
        </div>
        <%
            }
        %>
    </div>
    <div class="sum">合计：<%=order.getOrderPrice()%></div>
    <button class="paybutton">支付</button>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/js/check.js"></script>
</html>
