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

  var resizeCoverPhotoOnResize = function() {
    var width = $('#masthead-photo').width();
    $('#masthead-photo').height(width / 1440 * 757);
  }

  $(window).resize(function() {
    resizeLiOnResize();
    resizeCoverPhotoOnResize();
  });

  $('#close-sidebar').click(function(e) {
    e.preventDefault();
    var timeout = 500;
    if ($(window).width() <= 768) {
      timeout = 0;
    }
    $('.body-wrapper').toggleClass('toggled');
    setTimeout(resizeLiOnResize, timeout);
    setTimeout(resizeCoverPhotoOnResize, timeout);
  });

  $('#toggle-sidebar').click(function(e) {
    e.preventDefault();
    var timeout = 500;
    if ($(window).width() <= 768) {
      timeout = 0;
    }
    $('.body-wrapper').toggleClass('toggled');
    setTimeout(resizeLiOnResize, timeout);
    setTimeout(resizeCoverPhotoOnResize, timeout);
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

  // resize cover photo to be 1440x757
  var resizeCoverPhotoOnLoad = function() {
    $('#masthead-photo').load(function(){
      var width = $(this).width();
      $(this).height(width / 1440 * 757);
    });
  };
  resizeCoverPhotoOnLoad();

});