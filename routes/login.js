var profile = require('./profile');

var pg = require('pg');
var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };

exports.view = function(req, res){

    var data = [];

    // GET - loading login page
    if (req.method == 'GET'){
        req.session.user = null; // log the user out
        res.render('login', data);
        return;
    }

    // POST - process form data
    var name = req.body.name.split("'").join("''");
    var password = req.body.password.split("'").join("''");

    //console.log(name);
    //console.log(password);

    // query database to see if such user exists
    var client = new pg.Client(params);
    var query = "select id, name, email, photo from users where name = '" + name + "' and password = '" + password + "'";
    //console.log(query);
    client.connect();
    //console.log("connected client");
    client.query(query, function(err, result) {
        if (err) console.log(err);
        //console.log("response from sql server");
        // If user found, add user information to session
        if (result["rowCount"] == 1){
            client.end();

            var user = result.rows[0];
            req.session.user = user;
            data["user"] = user;

            res.redirect('/myevents');
        }

        // If no user data found
        else {
            data["message"] = "Invalid Login Credentials. Please Try Again.";
            client.end();
            res.render('login', data);
        }
    });
};