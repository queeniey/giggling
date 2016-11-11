/*!
 * jQuery imagesLoaded plugin v1.0.4
 * http://github.com/desandro/imagesloaded
 *
 * MIT License. by Paul Irish et al.
 */

(function($, undefined) {

  // $('#my-container').imagesLoaded(myFunction)
  // or
  // $('img').imagesLoaded(myFunction)

  // execute a callback when all images have loaded.
  // needed because .load() doesn't work on cached images

  // callback function gets image collection as argument
  //  `this` is the container

  $.fn.imagesLoaded = function( callback ) {
    var $this = this,
        $images = $this.find('img').add( $this.filter('img') ),
        len = $images.length,
        blank = 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==';

    function triggerCallback() {
      callback.call( $this, $images );
    }

    function imgLoaded( event ) {
      if ( --len <= 0 && event.target.src !== blank ){
        setTimeout( triggerCallback );
        $images.unbind( 'load error', imgLoaded );
      }
    }

    if ( !len ) {
      triggerCallback();
    }

    $images.bind( 'load error',  imgLoaded ).each( function() {
      // cached images don't fire load sometimes, so we reset src.
      if (this.complete || this.complete === undefined){
        var src = this.src;
        // webkit hack from http://groups.google.com/group/jquery-dev/browse_thread/thread/eee6ab7b2da50e1f
        // data uri bypasses webkit log warning (thx doug jones)
        this.src = blank;
        this.src = src;
      }
    });

    return $this;
  };
})(jQuery);
/* end of jQuery imagesLoaded plugin v1.0.4  */



jQuery(document).ready(function($) {

//thumbnail resize. short side will be 149px
$('.thumbnail').each(function(){
	$(this).hide();	//first hide, then resize, and then show. otherwise you can see the images resizing and blinking
	$(this).imagesLoaded(function(){
		if( $(this).width() > $(this).height()) {
			$(this).height(149).show();
		} else {
			$(this).width(149).show();
		}
	});
});

//external link
//$("a[href]:not([href^='http://myfairland.net'], [href^='#'])").addClass("outlink").attr("target","_blank");

//$("a[href]:not([href^='http://" + window.location.host + "'])").not("a[href^='#']").addClass("outlink").attr("target","_blank");


//search form effect
$("#search").click(function(){						 
		if ($("#search-form").filter(':hidden').length == 1)	
			$("#search-form").animate({left: "-150px", opacity: "toggle"}, 300);
		else
			$("#search-form").animate({left: "-170px", opacity: "toggle"}, 300);
		return false;
});


//menus effect. problematic now
//	$(".menu>li").mouseover(function(){
//		$(this).children("ul").animate({left: "+=20px", opacity: "toggle"}, 300);
//	}).mouthout(function(){
//		$(this).children("ul").animate({left: "-=20px", opacity: "toggle"}, 300);
//	});


});
