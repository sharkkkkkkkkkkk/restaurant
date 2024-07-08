<%@ page import="VO.CarouselChart" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/6/18
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/CarouselChart.css">
</head>
<body>
<div class="add-zone">
    <form action="${pageContext.request.contextPath}/addCarouselChartServlet" method="post" class="add-body" enctype="multipart/form-data">
        <div class="imgzone" id="drop-area">
            将图片拖到此处
            <img id="preview" src="#"  id="preview" style="width: 360px;display: none;">
            <input type="file" name="file" id="" accept="image/jpeg" style="display: none;" >
        </div>
        <button type="submit" class="add-button">添加</button>
    </form>
</div>
<%
    List<CarouselChart> ChartList = (List<CarouselChart>)request.getAttribute("ChartList");

%>
<div class="CarousChartList">
    <table>
        <thead>
        <td>图片</td>
        <td>名称</td>
        <td>删除</td>
        </thead>
        <%for (CarouselChart chart : ChartList){
        %>
        <tr>
            <td><img src="${pageContext.request.contextPath}/page/iconpicture/advertise/<%=chart.getSrc()%>" alt=""></td>
            <td><%=chart.getSrc()%></td>
            <td><a href="${pageContext.request.contextPath}/deleteChartServlet?Chart=<%=chart.getSrc()%>"><button>删除</button></a></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
<script src="${pageContext.request.contextPath}/admin/js/CarouselChart.js"></script>
</html>