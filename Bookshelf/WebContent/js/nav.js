const toggleNav = () => {
    let nav = document.getElementsByTagName("nav")[0];
    let menu = document.getElementsByClassName("mobile-btn")[0];

    menu.addEventListener("click", function(){
        nav.classList.toggle("mobile-active");
    })
}

toggleNav();