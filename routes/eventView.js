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

  // console.log(req.session.movebutton);
  if (req.session.movebutton){
    data['movebutton'] = true;
  }

  var id = req.params.id;
  data['id']=id;
  var referer = req.headers['referer']; // get referer for back url
  data['backUrl'] = referer;

  // load poll information
  var query = "select p.id, p.askerid, p.title, p.description, p.minpeople, p.expr < now() as expired, extract(day from p.expr-now()) as dayleft, extract(hour from p.expr-now()) as hourleft, extract(minute from p.expr-now()) as minuteleft, u.name, u.photo, count(v.id) as people from poll p left outer join votes v on p.id = v.pollid, users u where p.id = " + id + " and p.askerid = u.id group by p.id, p.askerid, p.title, p.description, p.minpeople, expired, dayleft, hourleft, minuteleft, u.name, u.photo";
  var client = new pg.Client(params);
  client.connect();
  client.query(query, function(err, result) {
    if (err) console.log(err);

    // find a poll?

    if (result.rowCount > 0) {
        pollInfo = result.rows[0];
        data["pollInfo"] = pollInfo;
        if(pollInfo['askerid'] == user['id']){
          data['myPoll'] = true;
        }

        if (pollInfo.minpeople == 0){
          data['nolimit'] = true;
        }
        else{
          data['limit'] = true;
          data['spotleft'] = pollInfo.minpeople - Number(pollInfo.people);
          if (pollInfo.minpeople - Number(pollInfo.people) == 0){
            data['nospotleft'] = true;
          }
        }

        if (pollInfo.dayleft > 0){
            timeleft = pollInfo.dayleft + " days left";
        }
        else if (pollInfo.hourleft > 0){
            timeleft = pollInfo.hourleft + " hours left";
        }
        else {
            timeleft = pollInfo.minuteleft + " minutes left";
        }
        pollInfo.timeleft = timeleft;
    }
    else
    {
      client.end();
      data['error'] = 'Could not find event id ' + id;
      res.render('pollView', data);
      return;
    }
    // load poll results
    //  console.log("inside eventView.js");
		query = "select c.choice, count(v.id) as count from choices c left join votes v on c.id = v.choiceid where c.pollid = " + id + " and c.type = 1 group by c.choice order by count desc";
    client.query(query, function(err, result) {
      if (err) console.log(err);
      // console.log(result);

      if (result.rowCount > 0) {
        data["choices"] = result.rows;

        // look for the max choice
        var choices = result.rows;
        var maxcount = -1;
        var maxchoice = "";

        for (var i = 0; i < result.rowCount; i++){
          if (choices[i].count > maxcount){
            maxcount = choices[i].count;
            maxchoice = choices[i].choice;
          }
        }

        data["maxcount"] = maxcount;
        data["maxchoice"] = maxchoice;
        // console.log("Max choice = " +  maxchoice + " with count of " + maxcount);
      }

      // load poll history
      query = "select v.*, c.choice, c.type, u.name, u.photo from votes v, choices c, users u where v.pollid = " + id + " and v.choiceid = c.id and c.type = 1 and v.userid = u.id order by v.time desc";
      client.query(query, function(err, result) {
        if (err) console.log(err);
     //   console.log(result);

        if(result.rowCount > 0){
          data["choice_info"] = result.rows;
        }

        // load my vote
        query = "select c.id, c.choice, v.comment from votes v, choices c where v.pollid = " + id + " and v.userid = " + user['id'] + " and v.choiceid = c.id and c.type = 1";
       // console.log(query);
        client.query(query, function(err, result) {
          if (err) console.log(err);
         // console.log(result);
          client.end();
          if (result.rowCount > 0){
            data["myVote"] = result.rows[0];
          }

          // console.log(data);        
          res.render('eventView',data);
             return;
        });
      });
    });
  });	
};


