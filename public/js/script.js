$(document).ready(function() {
  $('#close-sidebar').click(function(e) {
    e.preventDefault();
    $('.body-wrapper').toggleClass('toggled');
  });

  $('#toggle-sidebar').click(function(e) {
    e.preventDefault();
    $('.body-wrapper').toggleClass('toggled');
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
});