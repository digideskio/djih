$(document).ready(function() {
  initializePage();


});

function initializePage() {
	
    $("#event_tr").click( event_click );
};

var id= $('#event_id').val();
function event_click(e) {
	
	//ga('send', 'event', 'label', 'click');
	window.location.href = 'eventView/'+id
	//get <td> element values here!!??
};