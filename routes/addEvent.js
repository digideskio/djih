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

    var data = []
    data["user"] = user;

    if (req.method == 'GET'){
        res.render('addEvent', data);
        return;
    }

    // POST - came from pollOptions back button
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

    res.render('addEvent', data);
};