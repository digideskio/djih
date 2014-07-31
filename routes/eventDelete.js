var pg = require('pg');
var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };


exports.delete_event= function(req,res){
	//var poll_id=req.params.id;


    var query = "delete from polls where id="+poll_id;
    var client = new pg.Client(params);
    client.connect();
    alert("here!");
    console.log("here!");
    client.query(query, function(err, result) {
        client.end();
        res.render('myevents', data);
    });
}