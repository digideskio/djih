var pg = require('pg');
var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };

exports.view = function(req, res){

    var data = [];

    // pull in form fields
    var name = req.body.name;
    var email = req.body.email;
    var password = req.body.password;
    var profilepic = req.body.profilepic;

    // validate fields
    var missingFields = false;

    if (name == null || name == ""){
        missingFields = true;
        data['missingName'] = true;
    }
    else{
        data['name'] = name;
    }

    if (email == null || email == ""){
        missingFields = true;
        data['missingEmail'] = true;
    }
    else {
        email = email.replace(/\s/g, '');
        data['email'] = email;
        if ((email.toLowerCase().indexOf('@stanford.edu') < 0) && (email.toLowerCase().indexOf('@alumni.stanford.edu') < 0)){
            missingFields = true;
            data['missingEmail'] = true;
        }
    }

    if (password == null || password == ""){
        missingFields = true;
        data['missingPassword'] = true;
    }
    else {
        data['password'] = password;
    }

    if (profilepic == null || profilepic == ""){
        profilepic = "";
        data['profilepic'] = "";
    }
    else {
        profilepic = profilepic.toLowerCase().replace(/\s/g, '');
        data['profilepic'] = profilepic;
        if ((profilepic.indexOf('.jpg') < 0) && (profilepic.indexOf('.gif') < 0) && (profilepic.indexOf('.jpeg') < 0) && (profilepic.indexOf('.png') < 0)){
            missingFields = true;
            data['invalidProfilePic'] = true;
        }
    }

    if (missingFields){
        data['missingFields'] = true;
        res.render('addAccount', data);
    }
    
    
    // scrub fields for single quotations
    name = name.split("'").join("''");
    email = email.split("'").join("''");
    password = password.split("'").join("''");
    profilepic = profilepic.split("'").join("''");

    // check if user already exists
    var query = "select * from users where name = '" + name + "'";
    var client = new pg.Client(params);
    client.connect();
    client.query(query, function(err, result) {
        if (err) console.log(err);

        if (result.rowCount > 0){
            client.end();
            data['nameTaken'] = true;
            res.render('addAccount', data);
            return;
        }

        // if everything works, add user
        query = "insert into users(name, password, email, photo) values ('" + name + "', '" + password + "', '" + email + "', '" + profilepic + "')" 
        console.log(query);
        client.query(query, function(err, result){
            if (err) console.log(err);

            // grab user data and load into session
            query = "select id, name, email, photo from users where name = '" + name + "' and password = '" + password + "'";
            client.query(query, function(err, result){
                if (err) console.log(err);

                client.end();

                var user = result.rows[0];
                req.session.user = user;
                data["user"] = user;
                
                res.render('createAccount', data);
                return;
            });
        });
    });
};