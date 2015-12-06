// var pg = require('pg');
// var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };

// var Promise = require('bluebird');
// var request = Promise.promisify(require('request'));
// var get_photos_url = 'http://djih-rest.herokuapp.com/get_photos?sort_by=';
var pg = require('pg');

var album_query = "SELECT a.location, a.date, p.filename, p.width, p.height FROM albums AS a INNER JOIN photos AS p ON a.cover_photo_id = p.id WHERE a.category = 'travel' ORDER BY date DESC;";
var months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
]

exports.view = function(req, res){
    var data = [];
    pg.connect(process.env.DATABASE_URL, function(err, client, done) {
        client.query(album_query, function(err, result) {
            done();
            if (err) {
                console.err(err); response.send("Error " + err);
            } else {
                var albums = result.rows;
                for (var i = 0; i < result.rowCount; i++) {
                    var album = albums[i];

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


    /*

    if (!req.query.sort_by){
        req.query.sort_by = 'none';
    }
    var url = get_photos_url + req.query.sort_by;

    request(url).then(function(response){
        var photos = JSON.parse(response[1])['photos'];

        // format data for display
        var numPhotos = photos.length;
        for (var i = 0; i < numPhotos; i++) {
            var photo = photos[i];

            // strip off country from location string
            var location = photo['city'];
            var commaLocation = location.indexOf(',');
            if (commaLocation >= 0) {
                location = location.substring(0, commaLocation);
            }
            photo['city'] = location;

            // format date to Month Year
            var dateTaken = new Date(photo['date_taken']);
            dateTaken = months[dateTaken.getMonth()] + ' ' + dateTaken.getFullYear();
            photo['date_taken'] = dateTaken;
        }

        data['photos'] = photos;
        res.render('version2', data);
    })
    .catch(function(e){
        console.log(e);
    });
*/
};