var pg = require('pg');
var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };

exports.view = function(req, res) {

  // force login
  var user = req.session.user;
  if (user == null)
  {
    res.redirect('/login');
    return;
  }

  var data = [];
  data['user'] = user;

  // get form info
  var action = req.body.action;
  var pollid = req.body.pollid;
  var voteid = req.body.voteid;
  var choiceid = req.body.voteChoice;
  var comment = req.body.comment;
  if (comment == null) comment = '';
  comment.split("'").join("''");

  data['pollid'] = pollid;
  
  // submit vote
  if (action == 'vote'){
    var query = "insert into votes (pollid, userid, choiceid, comment, time) values (" + pollid + ", " + user['id'] + ", " + choiceid + ", '" + comment + "', now())";
    console.log(query);
    var client = new pg.Client(params);
    client.connect();
    client.query(query, function(err, result) {
      if (err) console.log(err);
      console.log(result);

      data['action'] = 'Submit Vote';
      data['voteSuccess'] = true;
      res.render('submitVote', data);
      return;
    });
  }

  // change vote
  if (action == 'change'){
    var query = "update votes set (choiceid, comment, time) = (" + choiceid + ", '" + comment + "', now()) where pollid = " + pollid + " and id = " + voteid + " and userid = " + user['id'];
    console.log(query);
    var client = new pg.Client(params);
    client.connect();
    client.query(query, function(err, result) {
      if (err) console.log(err);
      console.log(result);

      data['action'] = 'Change Vote';
      data['changeSuccess'] = true;
      res.render('submitVote', data);
      return;
    });
  }

  // delete vote
  if (action == 'delete'){
    var query = "delete from votes where id = " + voteid + " and pollid = " + pollid + " and userid = " + user['id'];
    console.log(query);
    var client = new pg.Client(params);
    client.connect();
    client.query(query, function(err, result) {
      if (err) console.log(err);
      console.log(result);

      data['action'] = 'Delete Vote';
      data['deleteSuccess'] = true;
      res.render('submitVote', data);
      return;
    });
  }

};


