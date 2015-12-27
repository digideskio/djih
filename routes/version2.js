// var Promise = require('bluebird');
// var request = Promise.promisify(require('request'));
require('dotenv').load();
var pg = require('pg');

var album_query = "SELECT a.id, a.location, a.date, p.filename, p.width, p.height FROM albums AS a INNER JOIN photos AS p ON a.cover_photo_id = p.id WHERE a.category = 'travel' ORDER BY date DESC;";
var months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
]

var isFinishedAlbum = function(id) {
    return (id >= 1 && id <= 24);
}

exports.view = function(req, res){
    var data = [];
    data['API_KEY'] = process.env.AMPLITUDE_API_KEY || '850a8c4c4b49f343859014651aec1a20';
    pg.connect(process.env.DATABASE_URL, function(err, client, done) {
        client.query(album_query, function(err, result) {
            done();
            if (err) {
                console.err(err); response.send("Error " + err);
            } else {
                var albums = result.rows;
                for (var i = 0; i < result.rowCount; i++) {
                    var album = albums[i];

                    if (isFinishedAlbum(album.id)) {
                        album.show_link = true;
                    }

                    // strip off country from location string
                    var city = album['location'];
                    var comma = city.indexOf(',');
                    if (comma >= 0) {
                        city = city.substring(0, comma);
                    }
                    album['city'] = city;

                    // format date to Month Year
                    var date = new Date(album['date']);
                    date = months[date.getMonth()] + ' ' + date.getFullYear();
                    album['date'] = date;
                }

                data['albums'] = albums;
                res.render('version2', data);
            }
        })
    });
};
