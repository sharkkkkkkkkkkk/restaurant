<%@ page import="VO.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.OrderSeat" %><%--
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
    List<OrderSeat> OrderSeatList = (List<OrderSeat>)request.getAttribute("OrderSeatList");
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
            <td>座位编号</td>
            <td>下单用户</td>
            <td>日期</td>
            <td>预定电话</td>
            <td>预定人姓名</td>
            <td>是否已被预定</td>
            <td></td>
        </tr>
        </thead>
        <tbody>
<%
        for (OrderSeat orderseat:OrderSeatList){
%>
        <tr>
            <td><%=orderseat.getOrderID()%></td>
            <td><%=orderseat.getSeatID()%></td>
            <td><%=orderseat.getUser()%></td>
            <td><%=orderseat.getDate()%></td>
            <td><%=orderseat.getReservePhone()%></td>
            <td><%=orderseat.getReserveName()%></td>
            <td><%=orderseat.getIfReserved()%></td>
            <%
                if(orderseat.getIfReserved().equals("true")){
            %>
            <td><a href="${pageContext.request.contextPath}/deleteSeatOrderServlet?SeatOrderID=<%=orderseat.getOrderID()%>&CurPage=<%=CurPage%>"><button>取消预定</button></a></td>
            <%
                }
                else{
            %>
            <td></td>
            <%
                }
            %>
        </tr>
<%
        }
%>
        </tbody>
    </table>

    <div class="page-change">
        <form action="${pageContext.request.contextPath}/adminServlet?mod=manageSeatOrder">
            <div class="page-show">
                <a href="${pageContext.request.contextPath}/adminServlet?mod=manageSeatOrder&CurPage=<%=left%>" class="left"><</a>
                <div class="pagenumber"><input type="text" value="<%=CurPage%>" name="CurPage">/<%=TotalPages%></div>
                <input type="text" value="manageSeatOrder" name="mod" style="display: none"/>
                <a href="${pageContext.request.contextPath}/adminServlet?mod=manageSeatOrder&CurPage=<%=right%>" class="right">></a>
            </div>
            <button type="submit" class="page-change-button">确定</button>
        </form>
    </div>
</div>

</body>
</html>
