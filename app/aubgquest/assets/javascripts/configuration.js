//= require jquery.js
//= require jquery-ui
//= require jquery_ujs
//= require jquery.remotipart
//= require foundation
//= require ckeditor/init
//= require days
//= require jsapi
//= require chartkick
function sideNav() {
    if ($(window).width() < 769) {

    } else {

    }
}

$(window).resize(function() {
    sideNav();
});


$(document).ready(function(){
    $(document).foundation();
    $(document).foundation('offcanvas', 'reflow');
});