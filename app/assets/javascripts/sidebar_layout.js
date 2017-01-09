//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require foundation


$(document).ready(function(){
    $(document).foundation();
    $('#dropdown li ').each(function(){
        $(this).click(function(){
            $(this).children('.day-events').toggle(300);
            var arrow = $(this).children('h4').children('.row').children('.right').children('#bg');
            if (arrow.attr("src") == "https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_keyboard_arrow_down_48px-24.png") {
               arrow.attr("src", "https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_keyboard_arrow_up_48px-24.png");
            } else {
                arrow.attr("src", "https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_keyboard_arrow_down_48px-24.png");
            }
            $(document).foundation('equalizer', 'reflow');
        });
    });
});

$(document).on('scroll', ( function(){
    var headerHeight = $('.full-heder').height() + $('.breadcrumb-container').height();
    var scrollTopHeight = $(document).scrollTop();
    var sidebarHeight = $('.sidebar-lg').outerHeight(true) + $('.side-nav').outerHeight(true);

    $('.sidebar-lg').css('top' , headerHeight - scrollTopHeight > 0 ? headerHeight - scrollTopHeight : 0);

    if ($(document).height() - scrollTopHeight - $('.footer').outerHeight() < sidebarHeight)
        $('.sidebar-lg').css('top' , $(document).height() - scrollTopHeight - $('.footer').outerHeight() - sidebarHeight);
}));
