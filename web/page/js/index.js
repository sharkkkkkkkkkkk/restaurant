let left = document.querySelector(".button-left")
let right = document.querySelector(".button-right")
let m = document.querySelectorAll(".m")
let images = document.querySelector(".images")

let index = 0;
let time
function clear(){
    for(let i = 0 ; i < m.length ; i++){
        m[i].style.backgroundColor="rgba(255, 255, 255, 0.5)"
        m[i].style.border="solid rgba(255, 255, 255, 0.5) 5px"
    }
}


function position(){
    images.style.left = (index*-100)+"%"
    clear()
    m[index].style.backgroundColor="black"
    m[index].style.border="solid black 5px"
}



function add(){
    if(index >= m.length - 1){
        index = 0
    }else{
        index++
    }
}

function desc(){
    if(index < 1){
        index = m.length-1
    }
    else{
        index--
    }
}

function timer(){
    time = setInterval(()=>{
        index++
        desc()
        add()
        position()
    },3000)
    m[index].style.backgroundColor="black"
    m[index].style.border="solid black 5px"
}

right.addEventListener("click",()=>{
    add()
    position()
    clearInterval(time)
    timer()
})

left.addEventListener("click",()=>{
    desc()
    position()
    clearInterval(time)
    timer()
})


for(let i = 0 ; i < m.length ; i++){
    m[i].addEventListener("click",()=>{
        index = i;
        position();
        clearInterval(time)
        timer()
    })
}

timer()
