$(document).ready(function() {
  $('#close-sidebar').click(function(e) {
    e.preventDefault();
    $('#sidebar').hide(400);
    $('#header').delay(400).show(400);
  });

  $('#toggle-sidebar').click(function(e) {
    e.preventDefault();
    $('#header').hide(400);
    $('#sidebar').delay(400).show(400);
  });

  /*
  $('#content').scroll(function() {
    if ($('#content').scrollTop() > 50) {
      $("#header-background").addClass('scrolling');
    } else {
      $("#header-background").removeClass('scrolling');
    }
  });
  */
});