$(document).ready(function() {
  $('#close-sidebar').click(function(e) {
    e.preventDefault();
    $('.body-wrapper').toggleClass('toggled');
    // $('#sidebar').hide(400);
    // $('#header').delay(400).slideDown(400);
    return false;
  });

  $('#toggle-sidebar').click(function(e) {
    e.preventDefault();
    $('.body-wrapper').toggleClass('toggled');
    // $('#header').slideUp(400);
    // $('#sidebar').delay(400).show(400);
    return false;
  });

  var galleryPosition = $('.gallery').position().top;

  $('#content').scroll(function() {
    if ($('#content').scrollTop() > galleryPosition) {
      $("#header-background").addClass('visible');
    } else {
      $("#header-background").removeClass('visible');
    }
  });
});