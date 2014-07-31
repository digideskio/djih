var pg = require('pg');
var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };


/* PROFILE PAGE - /UserID
 * 1) View profile information of User ID
 * 2) View and post comments about User ID
 */

exports.view = function(req, res){

    // force user to login
    var user = req.session.user;
    if (user == null)
    {
        res.redirect('/login');
        return;
    }

    // if no id inputted, use user's own id    
    var id = req.params.id;
    if (id == null)
    {
        id = user['id'];
    }

    var data = [];
    data['user'] = user;
    data['profileID'] = id;

    // if viewing own profile, show logout button
    if (id == user['id']){
        data['myProfile'] = true;
    }

    // POST REQUEST --> post comment to person's profile
    // need to check 2 things:
    // 1) different user
    // 2) comment is not blank
    if (req.method == 'POST'){

        var comment = req.body.comment;
        if (id == user['id'] || comment == null || comment == ''){
            res.redirect('/profile/' + id);
            return;
        }

        // insert comment and reload page        
        comment = comment.split("'").join("''"); // escape single quotes for psql
        var query = "insert into comments(commenterid, userid, comment) values (" + user['id'] + ", " + id + ", '" + comment + "')";
        var client = new pg.Client(params);
        client.connect();
        client.query(query, function(err, result) {
            client.end();
            if (err) console.log(err);
            res.redirect('/profile/' + id);
            return;
        });    
    }

    // GET REQUEST --> View person's profile
    // query for profile information
    var client = new pg.Client(params);
    client.connect();
    client.query('select u.id, u.name, u.email, u.photo from users u where u.id = ' + id, function(err, result) {
        if (err) console.log(err);
        
        // if no users found
        if (result['rowCount'] < 1) {
            client.end();
            res.render('profile', data);
            return;
        }

        data['profile'] = result.rows[0];

        // query for comments
        client.query('select c.commenterid, c.comment, u.name, u.photo from comments c, users u where c.userid = ' + id + ' and c.display and c.commenterid = u.id order by c.id desc', function(err, result) {
            client.end();
            if (err) console.log(err);
            if (result['rowCount'] > 0) {
                data['comments'] = result.rows;
            }
            res.render('profile', data);
        });
    });
};