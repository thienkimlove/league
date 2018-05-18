
(function($){
 jQuery(document).ready(function(){
  $("#scroll-wrapper").click(function() {
            //alert("hnfghdfsgfd");
            $('html, body').animate({
              scrollTop: $("#homepage").offset().top
            }, 1000);
          });
});
})(jQuery);

(function($){
 jQuery(document).ready(function(){
  $("#scroll-wrapper3").click(function() {
            //alert("hnfghdfsgfd");
            $('html, body').animate({
              scrollTop: $("#features").offset().top
            }, 1000);
          });
});
})(jQuery);


    // scroll-to-top button show and hide
    jQuery(document).ready(function(){
      jQuery(window).scroll(function(){
        if (jQuery(this).scrollTop() > 100) {
          jQuery('.scrollup').fadeIn();
        } else {
          jQuery('.scrollup').fadeOut();
        }
      });
    // scroll-to-top animate
    jQuery('.scrollup').click(function(){
      jQuery("html, body").animate({ scrollTop: 0 }, 600);
      return false;
    });


  });

    
     
