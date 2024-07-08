<%@ page import="VO.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/6/5
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/manageOrder.css">
</head>
<body>
<%
    List<Order> OrderList = (List<Order>)request.getAttribute("OrderList");
    int CurPage = (int)request.getAttribute("CurPage");
    int TotalPages = (int)request.getAttribute("TotalPages");
    int left = (CurPage==1)?1:(CurPage-1);
    int right = (CurPage==TotalPages)?CurPage:CurPage+1;
%>
<div class="manageOrder">
    <table>
        <thead>
        <tr>
            <td>订单编号</td>
            <td>下单时间</td>
            <td>订单金额</td>
            <td>下单用户</td>
            <td>是否支付</td>
            <td>详情</td>
            <td>删除</td>
        </tr>
        </thead>
        <tbody>
        <%
            for(Order order :OrderList)
            {
        %>
        <tr>
            <td><%=order.getOrderID()%></td>
            <td><%=order.getOrderTime()%></td>
            <td><%=order.getOrderPrice()%></td>
            <td><%=order.getUser()%></td>
            <td><%=order.getIfPaid()%></td>
            <td><a href="${pageContext.request.contextPath}/adminServlet?mod=manageOrderItem&OrderID=<%=order.getOrderID()%>"><button>详情</button></a></td>
            <td><a href="${pageContext.request.contextPath}/deleteOrderServlet?OrderID=<%=order.getOrderID()%>&CurPage=<%=CurPage%>"><button>删除</button></a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="page-change">
        <form action="${pageContext.request.contextPath}/adminServlet?mod=manageOrder">
            <div class="page-show">
                <a href="${pageContext.request.contextPath}/adminServlet?mod=manageOrder&CurPage=<%=left%>" class="left"><</a>
                <div class="pagenumber"><input type="text" value="<%=CurPage%>" name="CurPage">/<%=TotalPages%></div>
                <input type="text" value="manageOrder" name="mod" style="display: none"/>
                <a href="${pageContext.request.contextPath}/adminServlet?mod=manageOrder&CurPage=<%=right%>" class="right">></a>
            </div>
            <button type="submit" class="page-change-button">确定</button>
        </form>
    </div>
</div>
</body>
</html>
