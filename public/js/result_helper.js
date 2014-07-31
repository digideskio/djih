/*function getVote(int)
{
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("poll").innerHTML=xmlhttp.responseText;
    }
  }
  alert(int);
xmlhttp.open("GET","poll_vote.php?vote="+int,true);
xmlhttp.send();


/* chat box in eventView.handlebars */
var myDataRef;          
/*var currentdate = new Date(); 
      var datetime = currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/" 
                + currentdate.getFullYear() + " @ "  
                + currentdate.getHours() + ":"  
                + currentdate.getMinutes();
*/
var name='Negar';
var poll_id= $('#poll_id').val();
var myDataRef = new Firebase('https://shining-fire-755.firebaseio.com/'+poll_id);    

      
$('#sendMessageBtn').click(function(e) {

        name = $('#user_name').val();
      

       
        var text = $('#messageInput').val();
        myDataRef.push({name: name, text: text});
        $('#messageInput').val('');
});
myDataRef.on('child_added', function(snapshot) {
    var message = snapshot.val();
    displayChatMessage(message.name, message.text);
    });
      
var lastMessage=0;
      var lastWriter;
      function displayChatMessage(name, text) {
        
        if(lastWriter!=name){
            lastMessage=(lastMessage+1)%2;
            var div1 = $('<div/>',{"id":"m"+lastMessage}).text(text).prepend('<br>').prepend($('<strong/>').text(name+':'));
            div1.css('padding-left','5%');
            div1.appendTo($('#messageList'));
            
        }else{
            var div1 = $('<div/>',{"id":"m"+lastMessage}).text(text);
            div1.css('padding-left','5%');
            div1.appendTo($('#messageList'));
        }
        lastWriter=name;
        $('#messageList')[0].scrollTop = $('#messageList')[0].scrollHeight;
      };


/*delete vote*/

$(document).ready(function() {
  initializePage();
})

function initializePage() {


  $("#event_delete").click(confirm_delete);


} 

function confirm_delete(e){

  var r=confirm("Are you sure you want to delete this Hangout?");
  if (r==true)
  {
     deleteEvent(e);
  }
  else
  {
   
  }
};
function deleteEvent(e){
  /*$.post('/eventDelete/delete_event', function() {
          window.location.href = '/';
        });*/
        $.post('/project/'+poll_id+'/delete', function() {
          window.location.href = '/';
        });
};