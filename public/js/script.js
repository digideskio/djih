$(document).ready(function() {
  var resizeLiOnResize = function() {
    $("img.img-album").each(
      function() {
        var maxWidth = -1;
        $('img.img-album').each(function() {
          maxWidth = Math.max(maxWidth, $(this).width());
        }).height(maxWidth / 3 * 2);
      }
    );
  };

  $(window).resize(function() {
    resizeLiOnResize();
  });

  $('#close-sidebar').click(function(e) {
    e.preventDefault();
    $('.body-wrapper').toggleClass('toggled');
    resizeLiOnResize();
  });

  $('#toggle-sidebar').click(function(e) {
    e.preventDefault();
    $('.body-wrapper').toggleClass('toggled');
    resizeLiOnResize();
  });

  $('#content').scroll(function() {
    if ($('#content').scrollTop() > $('#masthead').height()) {
      $("#header-background").addClass('visible');
    } else {
      $("#header-background").removeClass('visible');
    }
  });

  $('#jump-button').bind('click', function(event) {
    var jumpPos = $('#masthead').height() + 1;
    $('#content').animate({ scrollTop: jumpPos}, 1500, 'easeInOutExpo');
    event.preventDefault();
  });

  // resize all li to 3:2 ratio
  var resizeLiOnLoad = function() {
  $('img.img-album').load(
    function (){
      var maxWidth = -1;
      $('img.img-album').each(function () {
        maxWidth = Math.max(maxWidth, $(this).width());
      }).height(maxWidth / 3 * 2);
    });
  };
  resizeLiOnLoad();
});