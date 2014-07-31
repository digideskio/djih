var pg = require('pg');
var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };


/* PEOPLE PAGE
 * List all the people in the community
 */

exports.view = function(req, res){

    // force login
    var user = req.session.user;
    if (user == null){
        res.redirect('/login');
        return;
    }

    var data = [];
    data['user'] = user;

    // query for all users in db
    var client = new pg.Client(params);
    client.connect();
    client.query('select id, name, photo from users where id != ' + user['id'] + ' order by id', function(err, result) {
        client.end();
        data['people'] = result.rows;
        res.render('people', data);
    });
};