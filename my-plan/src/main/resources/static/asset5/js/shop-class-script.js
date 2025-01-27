// navbar fixedtop
$(document).ready(function () {
    var navbar = $('#navbar');
    var navbarOffset = navbar.offset().top;

    $(window).scroll(function () {
        if ($(window).scrollTop() >= navbarOffset) {
            navbar.addClass('nav-fixed');
        } else {
            navbar.removeClass('nav-fixed');
        }
    });
});

// navbar hover
const nht = $(".nav-hover-text");
const nhc = $(".nav-hover-container");
for (let x = 0; x < nht.length; x++) {
    nht[x].addEventListener(
        "mouseover",
        (event) => {
            nht[x].setAttribute("style", "background-color: white; border-radius: 20px;");
            nhc[x].setAttribute("style", "color: black;");
        });
    nht[x].addEventListener(
        "mouseout",
        (event) => {
            nht[x].setAttribute("style", "");
            nhc[x].setAttribute("style", "");
        });
}

// navbar cart hover
$("#nav-cart").hide();
const ncht = $("#nav-cart-hover-text");
const nchc = $("#nav-cart-hover-container");
ncht[0].addEventListener(
    "mouseover",
    (event) => {
        ncht[0].setAttribute("style", "background-color: white; border-radius: 20px;");
        nchc[0].setAttribute("style", "color: black;");
        $("#nav-cart").show();
    });
ncht[0].addEventListener(
    "mouseout",
    (event) => {
        ncht[0].setAttribute("style", "");
        nchc[0].setAttribute("style", "");
        $("#nav-cart").hide();
    });

// navbar cart sum
const cop = $(".cart-order-price");
const coc = $(".cart-order-count");
const cos = $(".cart-order-sum");
for (let x = 0; x < cop.length; x++) {
    price = cop[x].textContent.slice(1);
    cos[x].innerHTML = `$${price * coc[x].textContent}`;
}

// sidebar hover
const sht = document.querySelectorAll(".sidebar-hover-text");
const shc = document.querySelectorAll(".sidebar-hover-container");
for (let x = 0; x < shc.length; x++) {
    shc[x].addEventListener(
        "mouseover",
        (event) => {
            shc[x].setAttribute("style", "background-color: #F6A185;");
            sht[x].setAttribute("style", "color: white;");
        });
    shc[x].addEventListener(
        "mouseout",
        (event) => {
            shc[x].setAttribute("style", "");
            sht[x].setAttribute("style", "");
        });
}