var flag = 0;
function change () {//灯光模式
    let psw = document.getElementById('password');
    let psweye = document.getElementById('changeeye');
    let changebody = document.getElementById('body');
    let circle = document.getElementById('circle');
    let centerbox = document.getElementById('centerbox');
    let botton = document.getElementById('botton');
    let line = document.getElementsByClassName('hr');
    if(flag == 1) {
        psw.type='password';
        psweye.src="../page/icon&picture/隐藏.png";
        changebody.style.background="";
        changebody.style.background="linear-gradient(limegreen,transparent),linear-gradient(90deg,skyblue,transparent),linear-gradient(-90deg,coral,transparent);";
        circle.style.display="none";
        centerbox.style.backgroundColor="rgba(216, 216, 216, 0.6)";
        line[1].style.border='white 1px solid';
        botton.style.display='inline';
        flag=0;
    }
    else
    {
        psw.type='text';
        psweye.src="../page/icon&picture/显示.png";
        changebody.style.background="black"
        circle.style.display="inline";
        centerbox.style.backgroundColor="rgba(216, 216, 216, 0)";
        botton.style.display='none';
        line[1].style.border='white 0px solid';
        flag=1;
    }
}
function warning(element){//警告框
    element.style.border=' solid 2px red ';
    setTimeout(function () {
        element.style.animation='shake 0.2s ease 1';
    }, 200);
    element.style.animation='';
}

function checkusername(){//验证用户名
    let username = document.getElementById('username');
    let msg = document.getElementById('usernamemsg');
    if(username.value==''){
        msg.innerHTML = '<font color="red">用户名不能为空</font>'
        msg.style.display='inline'
        msg.style.top='132px'
        msg.style.left='500px'
        warning(username);
        return false;
    }
    username.style.border='solid 1px black ' ;
    username.parentNode.parentNode.children[2].innerHTML='';
    username.parentNode.parentNode.children[2].style.display='none';
    return true;
}


function checkpassword(){//验证密码
    let username = document.getElementById('password');
    let msg = document.getElementById('passwordmsg');
    if(username.value==''){
        msg.innerHTML = '<font color="red">密码不能为空</font>'
        msg.style.display='inline'
        msg.style.top='198px'
        msg.style.left='500px'
        warning(username);
        return false;
    }
    username.style.border='solid 1px black ' ;
    username.parentNode.parentNode.children[2].innerHTML='';
    username.parentNode.parentNode.children[2].style.display='none';
    return true;
}


function check(){//检查合法性
    let result1 = checkusername();
    let result2 = checkpassword();

    return (result1&&result2);
}