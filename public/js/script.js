$(document).ready(function() {
  $('#close-sidebar').click(function(e) {
    e.preventDefault();
    $('.body-wrapper').toggleClass('toggled');
  });

  $('#toggle-sidebar').click(function(e) {
    e.preventDefault();
    $('.body-wrapper').toggleClass('toggled');
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