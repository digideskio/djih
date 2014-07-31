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

    // Need to validate data from forms
    var missingFields = false;

    // Poll type - event or question
    var type = req.body.type; // get the poll type
    data["type"] = type;

    // User input title / question
    var title = req.body.title;
    if (!title || title == ''){
        data["missingTitle"] = true;
        missingFields = true;
    }
    else {
        data["title"] = title;
    }

    // User input description
    var description = req.body.description;
    if (!description || description == ''){
        data["missingDescription"] = true;
        missingFields = true;
    }
    else {
        data["description"] = description;
    }

    // Validate choices based on poll type
    if (type == 'event'){
        data['isEvent'] = true;

        // Validate places
        var numPlaces = 0;
        var place1 = req.body.place1;
        if (place1 && place1 != ''){
            numPlaces = numPlaces + 1;
            data["place1"] = place1;
        }
        var place2 = req.body.place2;
        if (place2 && place2 != ''){
            numPlaces = numPlaces + 1;
            data["place2"] = place2;
        }
        var place3 = req.body.place3;
        if (place3 && place3 != ''){
            numPlaces = numPlaces + 1;
            data["place3"] = place3;
        }
        if (numPlaces < 2){
            data["needMorePlaces"] = true;
            missingFields = true;
        }
    }

    if (missingFields){
        data["missingFields"] = true;
        res.render('addEvent', data);
        return;
    }

    // all fields acceptable, continue to next page
    else {
        res.render('pollOptions', data);
    }
};