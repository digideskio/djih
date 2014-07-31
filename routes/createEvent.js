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

    // pull in known form fields
    var title = req.body.title;
    var description = req.body.description;
    var place1 = req.body.place1;
    var place2 = req.body.place2;
    var place3 = req.body.place3;

    data["title"] = title;
    data["description"] = description;
    if (place1 != null && place1 != ""){
        data["place1"] = place1;
    }
    if (place2 != null && place2 != ""){
        data["place2"] = place2;
    }
    if (place3 != null && place3 != ""){
        data["place3"] = place3;
    }

    // Need to validate data from forms
    var missingFields = false;

    // Validate date and time
    var dateTime = req.body.eventDateTime;
    if (dateTime == null || dateTime == ''){
        missingFields = true;
        data['invalidDateTime'] = true;
    }
    else {
        data['dateTime'] = dateTime;
    }

    var maxPeople = req.body.maxPeople;
    if (maxPeople == null || !(!isNaN(parseFloat(maxPeople)) && isFinite(maxPeople)) || maxPeople < 0) {
        missingFields = true;
        data['invalidMaxPeople'] = true;
    }
    else {
        data['maxPeople'] = maxPeople;
    }

    if (missingFields){
        data["missingFields"] = true;
        res.render('pollOptions', data);
        return;
    }

    // all fields acceptable, insert into database
    else {

        // scrub input fields for single quotes to escape
        title = title.split("'").join("''");
        description = description.split("'").join("''");
        if (place1 != null){
            place1 = place1.split("'").join("''");
        }
        if (place2 != null){
            place2 = place2.split("'").join("''");
        }
        if (place3 != null){
            place3 = place3.split("'").join("''");
        }

        // insert into poll table, fetch row id
        // insert options into choices table

        var query = "insert into poll (askerid, type, title, description, expr, minpeople) values (" + user['id'] + ", 1, '" + title + "', '" + description + "', '" + dateTime + "', " + maxPeople + ")";
        var client = new pg.Client(params);
        client.connect();
        client.query(query, function(err, result) {
            if (err) console.log(err);

            // fetch the new id
            query = "select id from poll order by id desc limit 1";
            client.query(query, function(err, result){
                if (err) console.log(err);

                var pollid = result.rows[0]['id'];
                data['pollid'] = result.rows[0]['id'];
                var nPlaces = 0;
                query = 'insert into choices (pollid, type, choice) values ';
                if (place1 != null){
                    nPlaces++;
                    query += "(" + pollid + ", 1, '" + place1 + "')";
                }
                if (place2 != null){
                    if (nPlaces > 0){
                        query += ", ";
                    }
                    nPlaces++;
                    query += "(" + pollid + ", 1, '" + place2 + "')";
                }
                if (place3 != null){
                    if (nPlaces > 0){
                        query += ", ";
                    }
                    nPlaces++;
                    query += "(" + pollid + ", 1, '" + place3 + "')";
                }

                client.query(query, function(err, result){
                    if (err) console.log(err);
                    client.end();
                    res.render('createEvent', data);
                    return;                    
                });
            });
        }); 
    }
};