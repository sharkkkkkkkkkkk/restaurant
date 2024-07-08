<%@ page import="java.util.List" %>
<%@ page import="VO.Dish" %><%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/6/2
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/managedishes.css">
</head>
<%
    int TotalPages = (int)request.getAttribute("TotalPages");
    int CurPage = (int)request.getAttribute("CurPage");
    int left = (CurPage==1)?1:(CurPage-1);
    int right = (CurPage==TotalPages)?CurPage:CurPage+1;
%>
<body>
<div class="dishes-topnav">
    <div class="select">全部菜品</div>
    <div>当季新品</div>
    <div>主厨推荐</div>
    <div>热门招牌</div>
    <div>素食主义</div>
    <div>酒水饮料</div>
</div>
<div class="dishes-content">
    <div class="type">
        <div class="add-dish">
            <div class="title">添加菜品</div>
            <form action="${pageContext.request.contextPath}/adddishServlet" method="post" class="add-body" enctype="multipart/form-data">
                <div class="imgzone" id="drop-area">
                    将菜品图片拖到此处
                    <img id="preview" src="#"  id="preview" style="width: 180px;display: none;">
                    <input type="file" name="file" id="" accept="image/jpeg" style="display: none;" >
                </div>
                <div class="imformation">
                    <table>
                        <tr>
                            <td>菜品名字</td>
                            <td><input type="text" class="name" name="name"></td>
                        </tr>
                        <tr>
                            <td>菜品价格</td>
                            <td><input type="text" class="price" name="price"></td>
                        </tr>
                        <tr>
                            <td>菜品描述</td>
                            <td><textarea name="description" class="description" cols="40" rows="8"></textarea></td>
                        </tr>
                    </table>
                </div>
                <button type="submit" class="add-button">添加</button>
            </form>
        </div>
        <table class="bottom-table">
            <thead>
            <td>菜品ID</td>
            <td>菜品名字</td>
            <td>菜品描述</td>
            <td>图片名称</td>
            <td>菜品价格</td>
            <td>当季新品</td>
            <td>主厨推荐</td>
            <td>热门招牌</td>
            <td>素食主义</td>
            <td>酒水饮料</td>
            </thead>
            <tbody>
            <%
                List<Dish> AllDishes = (List<Dish>)request.getAttribute("Alldishes");
                for (Dish d : AllDishes) {
            %>
            <tr>
                <td><%=d.getDishID()%></td>
                <td><%=d.getDishName()%></td>
                <td class="list-description"><%=d.getDishDescription()%></td>
                <td class="ImgUrl"><%=d.getDishImgUrl()%></td>
                <td><%=d.getPrice()%></td>
                <td><a href="${pageContext.request.contextPath}/addCategoryServlet?type=1&ID=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>上架</button></a></td>
                <td><a href="${pageContext.request.contextPath}/addCategoryServlet?type=2&ID=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>上架</button></a></td>
                <td><a href="${pageContext.request.contextPath}/addCategoryServlet?type=3&ID=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>上架</button></a></td>
                <td><a href="${pageContext.request.contextPath}/addCategoryServlet?type=4&ID=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>上架</button></a></td>
                <td><a href="${pageContext.request.contextPath}/addCategoryServlet?type=5&ID=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>上架</button></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <div class="page-change">
            <form action="${pageContext.request.contextPath}/adminServlet">
                <div class="page-show">
                    <a href="${pageContext.request.contextPath}/adminServlet?mod=managedishes&CurPage=<%=left%>" class="left"><</a>
                    <div class="pagenumber"><input type="text" value="<%=CurPage%>" name="CurPage">/<%=TotalPages%></div>
                    <a href="${pageContext.request.contextPath}/adminServlet?mod=managedishes&CurPage=<%=right%>" class="right">></a>
                </div>
                <button type="submit" class="page-change-button">确定</button>
            </form>
        </div>
    </div>

    <div class="type" style="display: none;">
        <table  class="bottom-table">
            <thead>
            <td>菜品ID</td>
            <td>菜品名字</td>
            <td>菜品描述</td>
            <td>图片名称</td>
            <td>菜品价格</td>
            <td>删除该菜品</td>
            </thead>
            <tbody>
            <%
                List<Dish> NewProductsOfTheSeason = (List<Dish>)request.getAttribute("NewProductsOfTheSeason");
                for (Dish d : NewProductsOfTheSeason) {
            %>
            <tr>
                <td><%=d.getDishID()%></td>
                <td><%=d.getDishName()%></td>
                <td class="list-description"><%=d.getDishDescription()%></td>
                <td class="ImgUrl"><%=d.getDishImgUrl()%></td>
                <td><%=d.getPrice()%></td>
                <td><a href="${pageContext.request.contextPath}/deleteFromCategoryServlet?type=NewProductsOfTheSeason&ID&=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>删除</button></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="type" style="display: none;">
        <table class="bottom-table">
            <thead>
            <td>菜品ID</td>
            <td>菜品名字</td>
            <td>菜品描述</td>
            <td>图片名称</td>
            <td>菜品价格</td>
            <td>删除该菜品</td>
            </thead>
            <tbody>
            <%
                List<Dish> ChefRecommendation = (List<Dish>)request.getAttribute("ChefRecommendation");
                for (Dish d : ChefRecommendation) {
            %>
            <tr>
                <td><%=d.getDishID()%></td>
                <td><%=d.getDishName()%></td>
                <td class="list-description"><%=d.getDishDescription()%></td>
                <td class="ImgUrl"><%=d.getDishImgUrl()%></td>
                <td><%=d.getPrice()%></td>
                <td><a href="${pageContext.request.contextPath}/deleteFromCategoryServlet?type=ChefRecommendation&&ID=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>删除</button></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="type" style="display: none;">
        <table  class="bottom-table">
            <thead>
            <td>菜品ID</td>
            <td>菜品名字</td>
            <td>菜品描述</td>
            <td>图片名称</td>
            <td>菜品价格</td>
            <td>删除该菜品</td>
            </thead>
            <tbody>
            <%
                List<Dish> PopularSigns = (List<Dish>)request.getAttribute("PopularSigns");
                for (Dish d : PopularSigns) {
            %>
            <tr>
                <td><%=d.getDishID()%></td>
                <td><%=d.getDishName()%></td>
                <td class="list-description"><%=d.getDishDescription()%></td>
                <td class="ImgUrl"><%=d.getDishImgUrl()%></td>
                <td><%=d.getPrice()%></td>
                <td><a href="${pageContext.request.contextPath}/deleteFromCategoryServlet?type=PopularSigns&&ID=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>删除</button></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="type" style="display: none;">
        <table  class="bottom-table">
            <thead>
            <td>菜品ID</td>
            <td>菜品名字</td>
            <td>菜品描述</td>
            <td>图片名称</td>
            <td>菜品价格</td>
            <td>删除该菜品</td>
            </thead>
            <tbody>
            <%
                List<Dish> Vegetarianism = (List<Dish>)request.getAttribute("Vegetarianism");
                for (Dish d : Vegetarianism) {
            %>
            <tr>
                <td><%=d.getDishID()%></td>
                <td><%=d.getDishName()%></td>
                <td class="list-description"><%=d.getDishDescription()%></td>
                <td class="ImgUrl"><%=d.getDishImgUrl()%></td>
                <td><%=d.getPrice()%></td>
                <td><a href="${pageContext.request.contextPath}/deleteFromCategoryServlet?type=Vegetarianism&&ID=<%=d.getDishID()%>&CurPage=<%=CurPage%>"><button>删除</button></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="type" style="display: none;">
        <table  class="bottom-table">
            <thead>
            <td>菜品ID</td>
            <td>菜品名字</td>
            <td>菜品描述</td>
            <td>图片名称</td>
            <td>菜品价格</td>
            <td>删除该菜品</td>
            </thead>
            <tbody>
            <%
                List<Dish> AluminiumicBeverages = (List<Dish>)request.getAttribute("AluminiumicBeverages");
                for (Dish d : AluminiumicBeverages) {
            %>
            <tr>
                <td><%=d.getDishID()%></td>
                <td><%=d.getDishName()%></td>
                <td class="list-description"><%=d.getDishDescription()%></td>
                <td class="ImgUrl"><%=d.getDishImgUrl()%></td>
                <td><%=d.getPrice()%></td>
                <td><a href="${pageContext.request.contextPath}/deleteFromCategoryServlet?type=AluminiumicBeverages&&ID=<%=d.getDishID()%>"><button>删除</button></a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/managedishes.js"></script>
</html>