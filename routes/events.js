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

    //var query = "select p.id, p.askerid, p.expr < now() as expired, p.title, p.description, p.minpeople, p.expr, extract(day from p.expr-now()) as dayleft, extract(hour from p.expr-now()) as hourleft, extract(minute from p.expr-now()) as minuteleft, a.name, a.photo, count(v.id) as people from poll p left outer join votes v on p.id = v.pollid, users a where p.type = 1 and p.askerid = a.id group by p.id, p.askerid, expired, p.title, p.description, p.minpeople, expr, dayleft, hourleft, minuteleft, a.name, a.photo order by p.expr asc";
    var query = "select p.id, p.askerid, p.expr < now() as expired, p.title, p.description, p.minpeople, p.expr, extract(day from p.expr-now()) as dayleft, extract(hour from p.expr-now()) as hourleft, extract(minute from p.expr-now()) as minuteleft, a.name, a.photo, count(v.id) as people from poll p left outer join votes v on p.id = v.pollid, users a where p.type = 1 and p.askerid = a.id and p.expr >= now() group by p.id, p.askerid, expired, p.title, p.description, p.minpeople, expr, dayleft, hourleft, minuteleft, a.name, a.photo order by p.expr-now() asc";
    var client = new pg.Client(params);
    client.connect();
    client.query(query, function(err, result) {
       
        client.end();
        if (result.rowCount > 0) {
            var events = result.rows;
            //console.log(events);
            for (var i = 0; i < result.rowCount; i++){
                if (events[i].expired){
                    continue;
                }

                if (events[i].dayleft > 0){
                    timeleft = events[i].dayleft + " days left";
                }
                else if (events[i].hourleft > 0){
                    timeleft = events[i].hourleft + " hours left";
                }
                else {
                    timeleft = events[i].minuteleft + " minutes left";
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

            data["events"] = events;
        }
        res.render('events', data);
    });
    
};