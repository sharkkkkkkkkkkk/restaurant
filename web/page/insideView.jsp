<%--
  Created by IntelliJ IDEA.
  User: Acer1
  Date: 2024/6/16
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>餐厅环境</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
            background-image: linear-gradient(to top, #773700 0%, #ff8800 100%);
            overflow: hidden;
        }

        /* 定义外层容器样式 */
        .shell {
            position: relative;
            /* 相对定位 */
            width: 60vw;
            /* 宽度占视口宽度的60% */
            height: 40vw;
            /* 高度占视口高度的40% */
            max-width: 380px;
            /* 最大宽度为380像素 */
            max-height: 250px;
            /* 最大高度为250像素 */
            margin: 0;
            /* 外边距为0 */
            color: white;
            /* 字体颜色为白色 */
            perspective: 1000px;
            /* 透视效果，观察者与z=0平面的距离 */
            transform-origin: center;
            /* 变形原点为中心 */
        }

        /* 定义内容容器样式 */
        .content {
            display: flex;
            /* 设置为弹性盒子布局 */
            justify-content: center;
            /* 主轴居中对齐 */
            align-items: center;
            /* 交叉轴居中对齐 */
            position: absolute;
            /* 绝对定位 */
            width: 100%;
            /* 宽度100% */
            height: 100%;
            /* 高度100% */
            transform-origin: center;
            /* 变形原点为中心 */
            transform-style: preserve-3d;
            /* 保持3D变换 */
            transform: translateZ(-30vw) rotateY(0);
            /* 变换：沿z轴平移-30vw，绕y轴旋转0度 */
            animation: carousel 15s infinite cubic-bezier(0.77, 0, 0.175, 1) forwards;
            /* 动画：名称为carousel，持续时间9秒，无限循环，缓动函数为cubic-bezier(0.77, 0, 0.175, 1)，动画结束后保持最后状态 */
        }

        /* 定义项目样式 */
        .item {
            position: absolute;
            /* 绝对定位 */
            width: 60vw;
            /* 宽度占视口宽度的60% */
            height: 60vw;
            /* 高度占视口高度的40% */
            max-width: 600px;
            /* 最大宽度为380像素 */
            max-height: 600px;
            /* 最大高度为250像素 */
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
            /* 设置阴影 */
            border-radius: 6px;
            /* 边框圆角半径为6像素 */
            background-size:cover;
            /* 背景图片等比例缩放并覆盖整个容器 */
            -webkit-box-reflect: below 25px -webkit-linear-gradient(transparent 50%, rgba(255, 255, 255, 0.3));
            /* 创建倒影效果 */
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction:column ;
            padding: 30px;
            & p:nth-child(1){
                font-size: 40px;
                font-family: Arial, sans-serif;
                font-weight: bold;
            }
            & p:nth-child(2){
                font-size: 20px;
                font-family: Arial, sans-serif;
                font-weight: bold;
            }
        }

        /* 第一个项目样式 */
        .item:nth-child(1) {
            background-image: url(./iconpicture/viewinside/Designer.jpeg);
            /* 背景图片为01.jpg */
            transform: rotateY(0) translateZ(35vw);
            /* 变换：绕y轴旋转0度，沿z轴平移35vw */

        }

        /* 第二个项目样式 */
        .item:nth-child(2) {
            background-image: url(./iconpicture/viewinside/Designer1.jpeg);
            /* 背景图片为02.jpg */
            transform: rotateY(72deg) translateZ(35vw);
            /* 变换：绕y轴旋转120度，沿z轴平移35vw */
        }

        /* 第三个项目样式 */
        .item:nth-child(3) {
            background-image: url(./iconpicture/viewinside/Designer2.jpeg);
            /* 背景图片为03.jpg */
            transform: rotateY(144deg) translateZ(35vw);
            /* 变换：绕y轴旋转240度，沿z轴平移35vw */
        }

        .item:nth-child(4) {
            background-image: url(./iconpicture/viewinside/Designer3.jpeg);
            /* 背景图片为03.jpg */
            transform: rotateY(216deg) translateZ(35vw);
            /* 变换：绕y轴旋转240度，沿z轴平移35vw */
        }
        .item:nth-child(5) {
            background-image: url(./iconpicture/viewinside/Designer4.jpeg);
            /* 背景图片为03.jpg */
            transform: rotateY(288deg) translateZ(35vw);
            /* 变换：绕y轴旋转240度，沿z轴平移35vw */
        }
        .home{
            position: absolute;
            left: 50px;
            top: 50px;
            background-color: rgba(255, 255, 255, 0.6);
            padding: 15px;
            border-radius: 50%;
            & img{
                width: 3vw;
            }
            &:hover{
                background-color: rgba(255, 255, 255, 0.8);
            }
        }

        /* 定义动画 */
        @keyframes carousel {

            0%,10%{
                transform: translateZ(-35vw) rotateY(0);
                /* 变换：沿z轴平移-35vw，绕y轴旋转0度 */
            }


            20%,30% {
                transform: translateZ(-35vw) rotateY(-72deg);
                /* 变换：沿z轴平移-35vw，绕y轴旋转-120度 */
            }


            40%,50% {
                transform: translateZ(-35vw) rotateY(-144deg);
                /* 变换：沿z轴平移-35vw，绕y轴旋转-240度 */
            }


            60%,70% {
                transform: translateZ(-35vw) rotateY(-216deg);
                /* 变换：沿z轴平移-35vw，绕y轴旋转-360度 */
            }

            80%,90% {
                transform: translateZ(-35vw) rotateY(-288deg);
                /* 变换：沿z轴平移-35vw，绕y轴旋转-360度 */
            }

            100% {
                transform: translateZ(-35vw) rotateY(-360deg);
                /* 变换：沿z轴平移-35vw，绕y轴旋转-360度 */
            }
        }

    </style>
</head>

<body>
<a href="${pageContext.request.contextPath}/indexServlet" class="home"><img src="${pageContext.request.contextPath}/page/icon&picture/home.png" alt=""></a>
<div class="shell">
    <div class="content">
        <div class="item"><p>当您踏入这家高级餐厅</p><p>仿佛穿越到了梦幻的异国风情之地。</p></div>
        <div class="item"><p>华美的欧式桌椅、小巧精致吧台</p><p>处处散发着贵族气息。</p></div>
        <div class="item"><p>天花板上挂着华丽的水晶吊灯</p><p>每个角度都折射出如梦似幻的斑斓彩光。</p></div>
        <div class="item"><p>这家餐厅</p><p>充满着浪漫唯美的装修风格</p></div>
        <div class="item"><p>充满欧洲风味的精致美食，处处洋溢着地中海风情</p><p>是情侣约会的不二之选</p></div>
    </div>
</div>
</body>

</html>