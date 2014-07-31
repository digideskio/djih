'use strict';



// Call this function when the page loads (the "ready" event)
$(document).ready(function() {
	initializePage();
})



function initializePage() {
  
  $("#addOptionBtn").click(addOptionBtn);
} 

function addOptionBtn(e) {
   e.preventDefault();
}