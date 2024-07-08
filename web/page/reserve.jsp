<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="VO.OrderSeat" %>
<%@ page import="VO.Seat" %><%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/5/30
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>预定</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/reserve.css">
</head>
<body>
<div class="blur">
    <div class="seat-detail">
        <img src="${pageContext.request.contextPath}/page/iconpicture/关闭.png" alt="" class="close">
        <div class="title">预  定</div>
        <form action="${pageContext.request.contextPath}/SubmitOrderSeatServlet" method="post">
            <table>
                <tr>
                    <td>预 约 时 间</td>
                    <td><input type="text" value="" class="date" name="date" readonly style="border: none;"></td>
                </tr>
                <tr>
                    <td>预 约 座 位</td>
                    <td><input type="text" value="" class="roomname" name="roomname" readonly style="border: none;">
                        <input type="text" value="" name="roomid" style="display: none;">
                        <input type="text" value="user" name="user" style="display: none;">
                    </td>
                </tr>
                <tr>
                    <td>座 位 信 息</td>
                    <td><input type="text" value="" class="roomdetail" name="roomdetail" readonly style="border: none;"></td>
                </tr>
                <tr>
                    <td>预 约 姓 名</td>
                    <td><input type="text" value="" class="name" name="name" placeholder="请输入姓名"></td>
                </tr>
                <tr>
                    <td>预 约 电 话</td>
                    <td><input type="text" value="" class="phone" name="phone" placeholder="请输入电话"></td>
                </tr>
            </table>
            <input type="submit" name="" id="" value="确定" class="submitbutton">
        </form>
    </div>
</div>

<div class="reserve-mainframe">
    <div class="reserve-leftnav">
        <ul>
            <a href="${pageContext.request.contextPath}/indexServlet"><img src="${pageContext.request.contextPath}/page/iconpicture/餐厅.png" alt="" ></a>
            <%
                List<String> Datelist = (List<String>)request.getAttribute("Datelist");
               for(String date : Datelist){

            %>
            <li><%=date%></li>
            <%
               }
            %>
        </ul>
    </div>

    <div class="reserve-dishes">
        <%
            List[] ReservationList = (List[])request.getAttribute("ReservationList");
            List<Seat> Seatlist = (List<Seat>)request.getAttribute("SeatList");
            for(List<OrderSeat> AllOrderByDate : ReservationList){
        %>
        <div class="bigbox">
            <div class="reserve-box">
                <%
                    int i = 0;
                    for(OrderSeat order : AllOrderByDate){
                %>
                <div class="reserve-item">
                    <img src="${pageContext.request.contextPath}/page/iconpicture/已购.png" alt="" class="reserve-img">
                    <div class="text-1"><%=Seatlist.get(i).getSeatName()%></div>
                    <div class="room-id"><%=Seatlist.get(i).getSeatID()%></div>
                    <div class="text-2"><img src="${pageContext.request.contextPath}/page/iconpicture/座位.png" alt="" class="seat-img"><div><%=Seatlist.get(i).getSeatDescription()%></div></div>

                        <%
                            if(order.isIfReserved().equals("true")){
                        %>
                        <div class="text-3" style="color: darkred">已被预订</div>
                        <%
                            }
                            else{
                        %>
                        <div class="text-3">可预定</div>
                        <%
                            }
                        %>

                </div>
                <%
                        i++;
                    }

                %>
            </div>
        </div>

        <%
            }
        %>

    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/js/reserve.js"></script>
</html>
