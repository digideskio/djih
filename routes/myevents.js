var pg = require('pg');
var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };


exports.view = function(req, res){

    // force login
    var user = req.session.user;
    if (user == null)
    {
        res.redirect('/login');
        return;
    }

    var data = [];
    data["user"] = user;
    data["altview"] = false;

    var query = "select p.id, p.expr < now() as expired, extract(day from p.expr-now()) as dayleft, extract(hour from p.expr-now()) as hourleft, extract(minute from p.expr-now()) as minuteleft, p.minpeople, p.askerid, p.title, p.description, p.expr, a.name, a.photo, count(v.id) as people from poll p left join votes v on p.id = v.pollid, users a where p.askerid = a.id and p.type = 1 and p.expr >= now() and p.id in (select distinct t.id from (select p.id from poll p where askerid = " + user['id'] + " union select v.pollid from votes v where v.userid = " + user['id'] + ") as t) group by p.id, expired, dayleft, hourleft, minuteleft, p.minpeople, p.askerid, p.title, p.description, p.expr, a.name, a.photo order by p.expr-now() asc";
    var client = new pg.Client(params);
    client.connect();
    client.query(query, function(err, result) {
        var events = [];
        if (result.rowCount > 0) {
            events = result.rows;
            for (var i = 0; i < result.rowCount; i++){
                events[i].urgent=false;
                if (events[i].expired){
                    continue;
                }

                if (events[i].dayleft > 0){
                    timeleft = events[i].dayleft + " days left";
                        if (events[i].dayleft == 1)
                            events[i].urgent=true
                }
                else if (events[i].hourleft > 0){
                    timeleft = events[i].hourleft + " hours left";
                     events[i].urgent=true
                }
                else {
                    timeleft = events[i].minuteleft + " minutes left";
                     events[i].urgent=true
                }
                events[i].timeleft = timeleft;

                if (events[i].minpeople == 0){
                    events[i].spots = "Open";
                    events[i].nospots = false;
                    continue;
                }

                events[i].spots = "Open: " + (events[i].minpeople - Number(events[i].people)) + " spots left";
                events[i].nospots = (events[i].minpeople - Number(events[i].people)) == 0;
            }
        }

        query = "select p.id, p.expr < now() as expired, extract(day from p.expr-now()) as dayleft, extract(hour from p.expr-now()) as hourleft, extract(minute from p.expr-now()) as minuteleft, p.minpeople, p.askerid, p.title, p.description, p.expr, a.name, a.photo, count(v.id) as people from poll p left join votes v on p.id = v.pollid, users a where p.askerid = a.id and p.type = 1 and p.expr < now() and p.id in (select distinct t.id from (select p.id from poll p where askerid = " + user['id'] + " union select v.pollid from votes v where v.userid = " + user['id'] + ") as t) group by p.id, expired, dayleft, hourleft, minuteleft, p.minpeople, p.askerid, p.title, p.description, p.expr, a.name, a.photo order by p.expr desc";
        client.query(query, function(err, result) {
            client.end();

            var exprevents = [];
            if (result.rowCount > 0) {
                exprevents = result.rows;
            }
            events = events.concat(exprevents);

            for (var i = 0; i < events.length; i++){
                events[i].altview = false;


            }


            data["events"] = events;
            res.render('myevents', data);
        });

    });
    
};


exports.altview = function(req, res){

    // force login
    var user = req.session.user;
    if (user == null)
    {
        res.redirect('/login');
        return;
    }

    var data = [];
    data["user"] = user;
    data["altview"] = true;
    console.log(data);
    console.log("I am in altview");

    var query = "select p.id, p.expr < now() as expired, extract(day from p.expr-now()) as dayleft, extract(hour from p.expr-now()) as hourleft, extract(minute from p.expr-now()) as minuteleft, p.minpeople, p.askerid, p.title, p.description, p.expr, a.name, a.photo, count(v.id) as people from poll p left join votes v on p.id = v.pollid, users a where p.askerid = a.id and p.type = 1 and p.expr >= now() and p.id in (select distinct t.id from (select p.id from poll p where askerid = " + user['id'] + " union select v.pollid from votes v where v.userid = " + user['id'] + ") as t) group by p.id, expired, dayleft, hourleft, minuteleft, p.minpeople, p.askerid, p.title, p.description, p.expr, a.name, a.photo order by p.expr-now() asc";
    var client = new pg.Client(params);
    client.connect();
    client.query(query, function(err, result) {
        var events = [];
        if (result.rowCount > 0) {
            events = result.rows;

            for (var i = 0; i < result.rowCount; i++){
                 events[i].urgent=false;
                if (events[i].expired){
                    continue;
                }

                if (events[i].dayleft > 0){
                    timeleft = events[i].dayleft + " days left";
                    if (events[i].dayleft == 1)
                        events[i].urgent=true;
                }
                else if (events[i].hourleft > 0){
                    timeleft = events[i].hourleft + " hours left";
                    events[i].urgent=true;
                }
                else {
                    timeleft = events[i].minuteleft + " minutes left";
                    events[i].urgent=true;
                }
                events[i].timeleft = timeleft;

                if (events[i].minpeople == 0){
                    events[i].spots = "Open";
                    events[i].nospots = false;
                    continue;
                }
                // console.log(events[i]);

                events[i].spots = "Open: " + (events[i].minpeople - Number(events[i].people)) + " spots left";
                events[i].nospots = (events[i].minpeople - Number(events[i].people)) == 0;
            }
            // data["events"] = events;
        }

        query = "select p.id, p.expr < now() as expired, extract(day from p.expr-now()) as dayleft, extract(hour from p.expr-now()) as hourleft, extract(minute from p.expr-now()) as minuteleft, p.minpeople, p.askerid, p.title, p.description, p.expr, a.name, a.photo, count(v.id) as people from poll p left join votes v on p.id = v.pollid, users a where p.askerid = a.id and p.type = 1 and p.expr < now() and p.id in (select distinct t.id from (select p.id from poll p where askerid = " + user['id'] + " union select v.pollid from votes v where v.userid = " + user['id'] + ") as t) group by p.id, expired, dayleft, hourleft, minuteleft, p.minpeople, p.askerid, p.title, p.description, p.expr, a.name, a.photo order by p.expr desc";
        client.query(query, function(err, result) {
            client.end();

            var exprevents = [];
            if (result.rowCount > 0) {
                exprevents = result.rows;
            }
            events = events.concat(exprevents);

            for (var i = 0; i < events.length; i++){
                events[i].altview = true;
            }

            data["events"] = events;
            res.render('myevents', data);
        });

    });
    
};
