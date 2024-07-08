<%@ page import="java.util.List" %>
<%@ page import="VO.OrderItem" %><%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/6/5
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/manageOrderItem.css">
</head>
<body>
<%
    List<OrderItem> orderItems = (List<OrderItem>)request.getAttribute("OrderItemList");
    String OrderID = (String) request.getAttribute("OrderID");
%>
<div class="manageOrderItem">
    <br>
    <h1>订单编号：<%=OrderID%></h1>
    <table>
        <thead>
        <tr>
            <td>菜品编号</td>
            <td>菜品名字</td>
            <td>数量</td>
            <td>删除</td>
        </tr>
        </thead>
        <tbody>
        <%
            for(OrderItem orderItem : orderItems){
        %>
        <tr>
            <td><%=orderItem.getDishID()%></td>
            <td><%=orderItem.getDishName()%></td>
            <td><%=orderItem.getNum()%></td>
            <td><a href="${pageContext.request.contextPath}/deleteOrderItemServlet?OrderID=<%=OrderID%>&DishID=<%=orderItem.getDishID()%>"><button>删除</button></a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>