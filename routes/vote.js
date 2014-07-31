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

  var action = req.query.action;
  var pollid = req.query.pollid;
  var voteid = req.query.voteid;

  if (pollid == null || pollid == '') {
    res.redirect('/events');
    return;
  }

  if (action == null || action == '') {
    res.redirect('/eventView/' + pollid);
    return;
  }

  if (action != 'vote' && action != 'change' && action != 'delete') {
    res.redirect('/eventView/' + pollid);
  }

  if ((action == 'change' || action == 'delete') && (voteid == null || voteid == '')) {
    res.redirect('/eventView/' + pollid);
  }

  // check for valid event poll before processing action
  // load poll information
  var query = "select p.*, u.name, u.photo from poll p, users u where p.id = " + pollid + " and p.type = 1 and p.expr > now() and p.askerid = u.id";
  var client = new pg.Client(params);
  client.connect();
  client.query(query, function(err, result) {
    if (err) console.log(err);

    // poll not found or poll expired
    if (result.rowCount <= 0){
      client.end();
      res.redirect('/eventView/' + pollid);
      return;
    }

    data['pollInfo'] = result.rows[0];
    console.log(data['pollInfo']);

    // load choices
    query = "select c.id, c.choice, count(v.id) as count from choices c left join votes v on c.id = v.choiceid where c.pollid = " + pollid + " and c.type = 1 group by c.id, c.choice order by count desc";
    client.query(query, function(err, result){
      if (err) console.log(err);

      data['choices'] = result.rows;

      // load event history
      query = "select v.*, c.choice, c.type, u.name, u.photo from votes v, choices c, users u where v.pollid = " + pollid + " and v.choiceid = c.id and c.type = 1 and v.userid = u.id order by v.time desc";
      client.query(query, function(err, result) {
        if (err) console.log(err);
        // console.log(result);

        if(result.rowCount > 0){
          data["choice_info"] = result.rows;
        }

        // for vote flow, that's all we need
        if (action == 'vote') {
          client.end();
          data['vote'] = true;
          data['action'] = 'Vote on Event Location';
          res.render('vote', data);
          return;
        }

        // for delete and change, load previous vote
        query = "select v.id, c.choice, v.comment from votes v, choices c where v.pollid = " + pollid + " and v.userid = " + user['id'] + " and v.choiceid = c.id and c.type = 1";
        client.query(query, function(err, result) {
          if (err) console.log(err);
          client.end();
          if (result.rowCount > 0){
            data["myVote"] = result.rows[0];
          }

          if (action == 'change'){
            data['changevote'] = true;
            data['action'] = 'Change My Vote';
          }

          if (action == 'delete'){
            data['deletevote'] = true;
            data['action'] = 'Delete My Vote';
          }
          res.render('vote',data);
          return;
        });
      });
    });
  });	
};


