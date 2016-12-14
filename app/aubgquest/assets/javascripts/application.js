//= require jquery.js
//= require jquery-ui
//= require jquery_ujs
//= require jquery.countdown
//= require foundation
//= require contact_form




$(document).on("page:load ready", function(){
    $("input.datepicker").datepicker({changeYear: true , yearRange: '1950:2000' , nextText: 'Next Month', prevText: 'Previous Month'});
});

$(document).ready(function() {
    $(document).foundation();
  $(window).resize(function(){

    if ($(window).width() < 1280 ) {
      $('nav').removeAttr('id');
    } else if ( $(window).width() > 1280 ) {
      $('nav').attr('id' , 'access');
    
    };
  });

});




