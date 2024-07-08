var navitems = document.querySelectorAll(".order-mainframe .order-leftnav ul li")//导航栏元素
var dishBoxs = document.querySelectorAll(".index-popular-dish")//对应菜品分类
var buttons = document.querySelectorAll(".dishbutton")//点餐按钮
var minbox = document.querySelector(".minbox")//已添加查看按钮
var menudetail = document.querySelector(".menudetail")//购物车详情
var addbuttons =null
var reducebuttons =null
var dishnum=0
minboxextend = 0;

//初始化导航栏
for(let i = 0 ;i<navitems.length;i++){
    dishBoxs[i].style.display="none";
}
dishBoxs[0].style.display="grid";
navitems[0].className="selected";

//导航栏功能实现
for(let i = 0 ;i<navitems.length;i++){
    navitems[i].addEventListener("click",()=>{
        clear();
        dishBoxs[i].style.display="grid";
        navitems[i].className="selected";
    })
}
function clear(){
    for(let i = 0 ;i<dishBoxs.length;i++){
        dishBoxs[i].style.display="none";
        navitems[i].className=""
    }
}



//点餐功能
for(let i = 0 ;i<buttons.length;i++){//点餐
    buttons[i].addEventListener("click",(e)=>{
        let hadbuydishes = document.querySelector(".limit").childNodes
        let dishname = e.target.parentElement.children[1].innerHTML
        let dishprice = e.target.parentElement.children[4].children[0].innerHTML
        let dishid = e.target.parentElement.children[2].innerHTML
        let repeat =false
        let repeatItem;
        for(let i=0;i<hadbuydishes.length;i++){
            if(hadbuydishes[i].children[0].children[1].value==dishid)
            {
                repeat = true
                hadbuydishes[i].children[0].children[2].value++
                break
            }
        }
        if(!repeat){
            let dish = "<div class=\"detailitem\">"
                + dishname +
                "<div class=\"detailitem-bottom\">"+
                "<img src=\"/restaurant_Web_exploded/page/icon&picture/减.png\" alt=\"\" class=\"reduce\">"+
                "<input type=\"text\" name=\"dishid["+dishnum+"]\" value=\""+dishid+"\" style=\"display: none;\">"+
                "数量: <input type=\"text\" name=\"thisdishnum["+dishnum+"]\"id=\"\"  value=\"1\" class=\"num\">"+
                "<img src=\"/restaurant_Web_exploded/page/icon&picture/加.png\" alt=\"\" class=\"add\">"+
                "</div>"+
                "<div style=\"display: none;\">"+dishprice+"</div>"+
                "</div>"
            menudetail.children[0].children[0].insertAdjacentHTML('beforeend',dish)
            dishnum++
            menudetail.children[0].children[2].value = dishnum
            addbuttons = document.querySelectorAll(".add")//更新按钮节点
            reducebuttons = document.querySelectorAll(".reduce")//更新按钮节点
            addbuttons[addbuttons.length-1].addEventListener("click",(e)=>{//添加按钮功能
                e.target.parentElement.children[2].value++
                calculatePrice()
            })
            reducebuttons[reducebuttons.length-1].addEventListener("click",(e)=>{//添加按钮功能
                if(e.target.parentElement.children[2].value>1)
                    e.target.parentElement.children[2].value--
                else
                    e.target.parentElement.parentElement.remove()
                calculatePrice()
            })
        }
        calculatePrice()
    })
}
function calculatePrice(){
    let hadbuydishes = document.querySelector(".limit").childNodes
    let sum=0
    for(let i =0;i<hadbuydishes.length;i++){
        sum+=(Number)(hadbuydishes[i].children[1].innerHTML)*(Number)(hadbuydishes[i].children[0].children[2].value)
    }
    menudetail.children[0].children[1].children[0].value=sum

}





//购物车展开
minbox.addEventListener("click",()=>{
    if(minboxextend===0){
        menudetail.style.width="200px"
        menudetail.style.height="450px"
        minboxextend=1
    }
    else{
        menudetail.style.width="160px"
        menudetail.style.height="90px"
        minboxextend=0
    }
})

