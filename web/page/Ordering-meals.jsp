<%@ page import="VO.Dish" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/5/29
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>点餐</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/css/Ordering-meals.css">
</head>
<body>
<div class="order-mainframe">
    <div class="order-leftnav">
        <ul>
            <a href="${pageContext.request.contextPath}/indexServlet"><img src="${pageContext.request.contextPath}/page/iconpicture/餐厅.png" alt="" ></a>
            <li>当季新品</li>
            <li>主厨推荐</li>
            <li>热门招牌</li>
            <li>素食主义</li>
            <li>酒水饮料</li>
        </ul>
        <div class="hadbuy">
            <div class="menudetail">
                <form action="${pageContext.request.contextPath}/SubmitOrderServlet" method="post">
                    <div class="limit"></div>
                    <div style="color: white;">总价：<input type="text" readonly  name="sumprice" class="sumprice" value="0"  style="text-align: center;"/>元</div>
                    <input type="text" value="0" style="display: none" name="dishnum">
                    <input type="submit" value="确定" class="submitbutton"/>
                </form>
            </div>
            <div class="minbox">
                <img src="${pageContext.request.contextPath}/page/iconpicture/已购.png" alt="" class="iconimg">
                <span>已 添 加</span>
            </div>
        </div>
    </div>
    <div class="order-dishes">

        <div class="index-popular-dish">
            <div class="dish-box">
                <%
                    List<Dish> NewProductsOfTheSeason = (List<Dish>)request.getAttribute("NewProductsOfTheSeason");
                    for(Dish d: NewProductsOfTheSeason ){
                %>
                    <div class="dish-item">
                        <div class="dish-img">
                            <img src="${pageContext.request.contextPath}/page/iconpicture/dish/<%=d.getDishImgUrl()%>" alt="">
                        </div>
                        <div class="dish-title"><%=d.getDishName()%></div>
                        <div class="dish-id"><%=d.getDishID()%></div>
                        <div class="dish-text"><%=d.getDishDescription()%></div>
                        <div class="price">￥:<div><%=d.getPrice()%></div></div>
                        <div class="dishbutton">添加</div>
                    </div>
                <%
                    }
                %>
            </div>
        </div>


        <div class="index-popular-dish">
            <div class="dish-box">
                <%
                    List<Dish> ChefRecommendation = (List<Dish>)request.getAttribute("ChefRecommendation");
                    for(Dish d: ChefRecommendation ){
                %>
                <div class="dish-item">
                    <div class="dish-img">
                        <img src="${pageContext.request.contextPath}/page/iconpicture/dish/<%=d.getDishImgUrl()%>" alt="">
                    </div>
                    <div class="dish-title"><%=d.getDishName()%></div>
                    <div class="dish-id"><%=d.getDishID()%></div>
                    <div class="dish-text"><%=d.getDishDescription()%></div>
                    <div class="price">$:<div><%=d.getPrice()%></div></div>
                    <div class="dishbutton">添加</div>
                </div>
                <%
                    }
                %>
            </div>
        </div>


        <div class="index-popular-dish">
            <div class="dish-box">
                <%
                    List<Dish> PopularSigns = (List<Dish>)request.getAttribute("PopularSigns");
                    for(Dish d: PopularSigns ){
                %>
                <div class="dish-item">
                    <div class="dish-img">
                        <img src="${pageContext.request.contextPath}/page/iconpicture/dish/<%=d.getDishImgUrl()%>" alt="">
                    </div>
                    <div class="dish-title"><%=d.getDishName()%></div>
                    <div class="dish-id"><%=d.getDishID()%></div>
                    <div class="dish-text"><%=d.getDishDescription()%></div>
                    <div class="price">$:<div><%=d.getPrice()%></div></div>
                    <div class="dishbutton">添加</div>
                </div>
                <%
                    }
                %>
            </div>
        </div>


        <div class="index-popular-dish">
            <div class="dish-box">
                <%
                    List<Dish> Vegetarianism = (List<Dish>)request.getAttribute("Vegetarianism");
                    for(Dish d: Vegetarianism ){
                %>
                <div class="dish-item">
                    <div class="dish-img">
                        <img src="${pageContext.request.contextPath}/page/iconpicture/dish/<%=d.getDishImgUrl()%>" alt="">
                    </div>
                    <div class="dish-title"><%=d.getDishName()%></div>
                    <div class="dish-id"><%=d.getDishID()%></div>
                    <div class="dish-text"><%=d.getDishDescription()%></div>
                    <div class="price">$:<div><%=d.getPrice()%></div></div>
                    <div class="dishbutton">添加</div>

                </div>
                <%
                    }
                %>
            </div>
        </div>


        <div class="index-popular-dish">
            <div class="dish-box">
                <%
                    List<Dish> AluminiumicBeverages = (List<Dish>)request.getAttribute("AluminiumicBeverages");
                    for(Dish d: AluminiumicBeverages ){
                %>
                <div class="dish-item">
                    <div class="dish-img">
                        <img src="${pageContext.request.contextPath}/page/iconpicture/dish/<%=d.getDishImgUrl()%>" alt="">
                    </div>
                    <div class="dish-title"><%=d.getDishName()%></div>
                    <div class="dish-id"><%=d.getDishID()%></div>
                    <div class="dish-text"><%=d.getDishDescription()%></div>
                    <div class="price">$:<div><%=d.getPrice()%></div></div>
                    <div class="dishbutton">添加</div>
                </div>
                <%
                    }
                %>
            </div>
        </div>

    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/js/ordering.js"></script>
</html>
