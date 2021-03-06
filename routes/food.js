require('dotenv').load();
var pg = require('pg');

var photo_query = "SELECT id, filename, dropbox_url, title, location, camera, focal_length, aperture, shutter_speed, iso, date_taken, width, height FROM test_photos WHERE category = 'food' ORDER BY RANDOM();";


exports.view = function(req, res){
    var data = [];
    data.album_id = 'food';
    data.API_KEY = process.env.AMPLITUDE_API_KEY || '850a8c4c4b49f343859014651aec1a20';
    data.food = true; // activates sidebar link background

    // fetch food photos
    pg.connect(process.env.DATABASE_URL, function(err, client, done) {
        client.query(photo_query, function(err, result) {
            done();
            if (err) {
                console.log(err); res.send('Error ' + err);
            } else {
                data.photos = result.rows;
                res.render('food', data);
            }
        });
    });
};
