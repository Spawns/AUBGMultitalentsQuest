//= require jquery.js
//= require jquery-ui
//= require jquery_ujs
//= require jquery.countdown
//= require foundation
//= require wow
$(document).ready(function() {
  var top;
        $(document).foundation();

   //parallax background resizing
    $('.parallax-content').css('top', $('.parallax-background').height() + 'px');
    $('.parallax-content').scrollLeft(0);
    $('.parallax-background').load(function(){
         top = $(this).height();
        $('.parallax-content').css('top', top);

    });

    $(window).resize(function() {
        top = $('.parallax-background').height();
        $('.parallax-content').css('top', top);
    });

    //

    $(document).on('close.fndtn.reveal', '[data-reveal]', function () {
        $('iframe').attr("src", " ");
        $('iframe').remove();
    });

    $(document).on('click tap', '.close-reveal-modal, .reveal-modal-bg', function() {
        return $('[data-reveal]').foundation('reveal', 'close');
    });

    //wow
    new WOW().init();

    //scroll down arrow
    if(  top > $(window).height() ) {
        $('.down-arrow').fadeIn(300);
    }

    $(window).scroll(function() {
        scrollTop = $(window).scrollTop();


        if(isOnScreen($('.landing-page-heading'))) {
            $('#videos').addClass('animated slideInRight');
            $('#news').addClass('animated  slideInLeft');
        }

        if(isOnScreen($('.whatis'))) {
            $('.whatis').addClass('animated slideInRight delay-3s');
        }

        if(isOnScreen($('.timer-sign-link'))){
            $('.timer-sign-link').addClass('animated slideInUp delay-3d5s');
        }

        if(isOnScreen($('.social-container'))) {
            $('.social-text').addClass('animated slideInLeft delay-3s');
        }


    })

});


function isOnScreen(element) {
    var elementOffsetTop = element.offset().top;
    var elementHeight = element.height();

    var screenScrollTop = $(window).scrollTop();
    var screenHeight = $(window).height();

    var scrollIsAboveElement = elementOffsetTop + elementHeight - screenScrollTop >= 0;
    var elementIsVisibleOnScreen = screenScrollTop + screenHeight - elementOffsetTop >= 0;

    return scrollIsAboveElement && elementIsVisibleOnScreen;
}

