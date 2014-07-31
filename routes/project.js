var pg = require('pg');
var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };


exports.deleteProject = function(req, res) {
var poll_id=req.params.id;
console.log(poll_id);
res.send(200);
res.redirect('/');
 var query = "delete from poll where id="+poll_id;
    var client = new pg.Client(params);
    client.connect();
   
    console.log("here!");
    client.query(query, function(err) {
         if (err) console.log(err);
        client.end();
        res.send(200);
        res.render('myevents');
    });
}