var flag = 0;


function change (){//灯光模式
    let psw = document.getElementById('password');
    let psw1 = document.getElementById('password1');
    let psweye = document.getElementById('changeeye');
    let changebody = document.getElementById('body');
    let circle = document.getElementById('circle');
    let centerbox = document.getElementById('centerbox');
    let text = document.querySelectorAll('td .text');
    let botton = document.getElementById('botton');
    let line = document.getElementsByClassName('hr');
    if(flag==1)
    {
        psw.type='password';
        psw1.type='password';
        psweye.src="../page/icon&picture/隐藏.png";
        changebody.style.background=""
        changebody.style.background="linear-gradient(limegreen,transparent),linear-gradient(90deg,skyblue,transparent),linear-gradient(-90deg,coral,transparent);";
        circle.style.display="none";
        centerbox.style.backgroundColor="rgba(216, 216, 216, 0.6)";
        text[0].style.backgroundColor='rgba(216, 216, 216, 0.6)' ;
        text[4].style.backgroundColor='rgba(216, 216, 216, 0.6)';
        text[0].style.border='solid 1px black ';
        text[4].style.border='solid 1px black ';
        line[0].style.margin='19.92px 0';
        line[1].style.border='white 1px solid';
        botton.style.display='inline';
        flag=0;
    }
    else
    {
        psw.type='text';
        psw1.type='text';
        psweye.src="../page/icon&picture/显示.png";
        changebody.style.background="black"
        circle.style.display="inline";
        centerbox.style.backgroundColor="rgba(216, 216, 216, 0)";
        text[0].style.backgroundColor='rgba(216, 216, 216, 0)';
        text[4].style.backgroundColor='rgba(216, 216, 216, 0)';
        text[0].style.border='0px';
        text[4].style.border='0px';
        botton.style.display='none';
        line[0].style.margin='20.92px 0';
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
        msg.style.top='205px'
        warning(username);
        return false;
    }
    username.style.border='solid 1px black ' ;
    username.parentNode.parentNode.children[2].innerHTML='';
    username.parentNode.parentNode.children[2].style.display='none';
    return true;
}

function checkpassword(){//验证密码
    let password = document.getElementById('password');
    let reg = /^.{6,16}$/;
    let result = reg.test(password.value);
    let msg = document.getElementById('passwordmsg');
    if(password.value==''){
        msg.innerHTML = '<font color="red">密码不能为空</font>'
        msg.style.display='inline'
        msg.style.top='272px'
        warning(password);
        return false;
    }
    else if(!result){
        msg.innerHTML = '<font color="red">密码请设置6~16位字符</font>'
        msg.style.display='inline'
        msg.style.top='222px'
        warning(password);
        return false;
    }
    password.style.border='solid 1px black ' ;
    password.parentNode.parentNode.children[2].innerHTML='';
    password.parentNode.parentNode.children[2].style.display='none';
    checkpassword1();
    return true;
}
function checkpassword1(){//验证密码重复
    let password = document.getElementById('password');
    let password1 = document.getElementById('password1');
    let result = (password.value==password1.value);
    let msg = document.getElementById('password1msg');
    if(password1.value==''){
        msg.innerHTML = '<font color="red">请重复密码</font>'
        msg.style.display='inline'
        msg.style.top='338px'
        warning(password1);
        return false;
    }
    else if(!result){
        msg.innerHTML = '<font color="red">两次输入的密码不同</font>'
        msg.style.display='inline'
        msg.style.top='286px'
        warning(password1);
        return false;
    }
    password1.style.border='solid 1px black ' ;
    password1.parentNode.parentNode.children[2].innerHTML='';
    password1.parentNode.parentNode.children[2].style.display='none';
    return true;
}


function check(){//检查合法性
    let result1 = checkusername();
    let result2 = checkpassword();
    let result3 = checkpassword1();
    return (result1&&result2&&result3);
}
