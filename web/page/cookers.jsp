<%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/6/16
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>厨师团队</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            overflow: hidden;
        }

        .shell {
            height: 100vh;
            display: flex;
        }

        .box {
            flex: 1;
            min-width: 0;
            box-shadow: -20px 0 20px 5px rgba(255, 255, 255, 0.7);
            transition: flex 1s;
            background-size: cover;
            background-position: center;
            display: grid;
            position: relative;
            border: 10px solid #fff;
        }

        .box:hover {
            flex: 2;
        }

        .box:hover .text {
            animation: appear 0.8s forwards 0.3s;
        }

        .img1 {
            background-image: url(./iconpicture/cook/海鲜大厨贝拉.png);

        }

        .img2 {
            background-image: url(./iconpicture/cook/糕点师艾米丽.png);
        }

        .img3 {
            background-image: url(./iconpicture/cook/主厨阿尔贝托.png);
        }

        .img4 {
            background-image: url(./iconpicture/cook/烤肉专家卡尔.png);
        }

        .img5 {
            background-image: url(./iconpicture/cook/意大利面专家马可.png);
        }
        .text {
            position: absolute;
            bottom: 30px;
            left:20px;
            padding: 45px 50px;
            opacity: 0;
            color: rgb(255, 255, 255);
            height: 400px;
            width: 500px;
            border-radius: 10px;
            background-color: rgba(0, 0, 0, 0.5);
        }

        header {
            height: 73px;
            font-size: 50px;
            font-family: 华文中宋;
            line-height: 50px;
            font-weight: bold;
            border-bottom: 2px solid white;
        }

        .title {
            display: inline-block;
            height: 65px;
            text-decoration: underline;
            text-underline-offset: 10px;
            text-decoration-thickness: 4px;
        }

        .num {
            margin-left: -18px;
        }

        .text p {
            margin: 30px 0;
            font-size: 20px;
        }
        .home{
            position: absolute;
            left: 50px;
            top: 50px;
            background-color: rgba(255, 255, 255, 0.6);
            padding: 15px;
            border-radius: 50%;
            z-index: 99;
            & img{
                width: 3vw;
            }
            &:hover{
                background-color: rgba(255, 255, 255, 0.8);
            }
        }

        @keyframes appear {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
    </style>
</head>

<body>
<a href="${pageContext.request.contextPath}/indexServlet" class="home"><img src="${pageContext.request.contextPath}/page/icon&picture/home.png" alt=""></a>
<div class="shell">
    <div class="box img1">
        <div class="text">
            <header>
                <span class="title">海鲜大厨：</span>
                <span class="num">贝拉</span>
            </header>
            <p>
                擅长领域：海鲜料理，尤其是地中海和东南亚风味。
            </p>
            <p>
                曾获奖项：国际海鲜烹饪大赛金奖，最佳海鲜创新奖。
            </p>
            <p>个人经历：从小在海边长大，对海鲜有独到的见解和烹饪技巧。</p>
        </div>
    </div>
    <div class="box img2">
        <div class="text">
            <header>
                <span class="title">糕点师：</span>
                <span class="num">艾米丽</span>
            </header>
            <p>
                擅长领域：法式甜点，特别是马卡龙和慕斯。
            </p>
            <p>
                曾获奖项：法国最佳甜点师，国际甜品创新大赛银奖。
            </p>
            <p>个人经历：在巴黎蓝带厨艺学院学习，后在五星级酒店担任糕点主厨。</p>
        </div>
    </div>
    <div class="box img3">
        <div class="text">
            <header>
                <span class="title">主厨：</span>
                <span class="num">阿尔贝托</span>
            </header>
            <p>
                擅长领域：地中海料理，特别是海鲜和橄榄油的使用。
            </p>
            <p>
                曾获奖项：意大利烹饪大赛金奖，西班牙国际美食节最佳创意奖。
            </p>
            <p>个人经历：曾在米其林三星餐厅担任副厨。</p>

        </div>
    </div>
    <div class="box img4">
        <div class="text">
            <header>
                <span class="title">烤肉专家：</span>
                <span class="num">卡尔</span>
            </header>
            <p>
                擅长领域：各种烤肉，尤其是德州风格的烧烤。
            </p>
            <p>
                曾获奖项：美国烧烤大师赛第一名，国际烤肉大赛银奖。
            </p>
            <p>个人经历：曾在德州经营自己的烧烤店，后被邀请至高级餐厅担任烤肉主厨。</p>
        </div>
    </div>
    <div class="box img5">
        <div class="text">
            <header>
                <span class="title">面食专家：</span>
                <span class="num">马可</span>
            </header>
            <p>
                擅长领域：各种意大利面，尤其是自制面条和酱料。
            </p>
            <p>
                曾获奖项：意大利面烹饪大赛金奖，国际意大利面创新大赛银奖。
            </p>
            <p>个人经历：在意大利学习传统意大利面制作，后在世界各地推广意大利面文化。</p>
        </div>
    </div>
</div>
</body>

</html>