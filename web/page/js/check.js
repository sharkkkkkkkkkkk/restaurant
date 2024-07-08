var paybutton = document.querySelector(".paybutton")
var blur = document.querySelector(".blur")
var close = document.querySelector(".close")


paybutton.addEventListener("click",()=>{
    blur.style.zIndex = 99
})

close.addEventListener("click",()=>{
    blur.style.zIndex = -1
})