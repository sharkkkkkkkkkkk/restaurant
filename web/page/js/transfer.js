let toptext = document.querySelector(".toptext").innerHTML;
let bottomtext = document.querySelector(".bottomtext");
let address ;
let text;

if(toptext=== "注册成功！"){
    address = "./sign_in.jsp";
    text = "秒后进入登陆界面";
}
else if(toptext==="登录成功！"){
    address = "../indexServlet";
    text = "秒后进入首页";
}
else
{
    address = "./sign_up.jsp";
    text = "秒后返回注册界面";
}


bottomtext.innerHTML = 3+text;
let i = 2;
var timer = setInterval(function() {
    if(i==0){
        window.location.href = address;
    }
    else{
        bottomtext.innerHTML = i+text;
        i--;
    }

}, 1000);