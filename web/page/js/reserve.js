var navitems = document.querySelectorAll(".reserve-mainframe .reserve-leftnav ul li")
var bigbox = document.querySelectorAll(".bigbox")//对应菜品分类
var date = navitems[0].innerHTML//当前选中导航栏对应日期
var seatItmes = document.querySelectorAll(".reserve-item")
var detail = document.querySelector(".blur")
var close = document.querySelector(".close")
//初始化导航栏
for(let i = 0 ;i<navitems.length;i++){
    bigbox[i].style.display="none";
}
bigbox[0].style.display="grid";
navitems[0].className="selected";

//导航栏功能实现
for(let i = 0 ;i<navitems.length;i++){
    navitems[i].addEventListener("click",()=>{
        clear();
        bigbox[i].style.display="grid";
        navitems[i].className="selected";
        date = navitems[i].innerHTML
    })
}
function clear(){
    for(let i = 0 ;i<bigbox.length;i++){
        bigbox[i].style.display="none";
        navitems[i].className=""
    }
}


//提交预约
seatItmes.forEach(function(element){
    element.addEventListener("click",(e)=>{
        
        if(e.target.children[4].innerHTML=="可预定"){
            //修改预约详情
            let table = detail.children[0].children[2].children[0]
            table.children[0].children[0].children[1].children[0].value=date;//预约时间
            table.children[0].children[1].children[1].children[0].value=e.target.children[1].innerHTML//预约座位
            table.children[0].children[1].children[1].children[1].value=e.target.children[2].innerHTML//座位ID
            table.children[0].children[2].children[1].children[0].value=e.target.children[3].children[1].innerHTML//座位信息
        
        
            //显示
            detail.style.zIndex=99
        }
    })
},true)

//关闭详情
close.addEventListener("click",()=>{
    detail.style.zIndex=0
})



