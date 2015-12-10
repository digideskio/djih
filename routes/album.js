// var Promise = require('bluebird');
// var request = Promise.promisify(require('request'));
var pg = require('pg');
var format = require('string-format');
format.extend(String.prototype);

var album_query = 'SELECT a.location, a.date, a.category, p.filename, p.width, p.height FROM albums AS a INNER JOIN photos AS p ON a.cover_photo_id = p.id WHERE a.id = {0}';
// var photo_query = 'SELECT p.filename, p.title, p.location, p.camera, p.focal_length, p.aperture, p.shutter_speed, p.iso, p.date_taken, p.width, p.height FROM album_photos AS a INNER JOIN photos AS p ON a.photo_id = p.id WHERE a.album_id = {0} ORDER BY p.date_taken, p.filename ASC;';
var photo_query = 'SELECT p.id, p.filename, p.title, p.location, p.camera, p.focal_length, p.aperture, p.shutter_speed, p.iso, p.date_taken, p.width, p.height FROM album_photos AS a INNER JOIN photos AS p ON a.photo_id = p.id WHERE a.album_id = {0} ORDER BY RANDOM();';

var isValidAlbum = function(id) {
    return id >= 1 && id <= 6;
}

var months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
]


exports.view = function(req, res){
    var data = [];
    var albumid = parseInt(req.params.albumid);

    // invalid albumid
    if (!isValidAlbum(albumid)) {
        res.redirect('/v2');
    }

    // fetch album info and cover
    pg.connect(process.env.DATABASE_URL, function(err, client, done) {
        client.query(album_query.format(albumid), function(err, result) {
            if (err) {
                done();
                console.log(err); res.send('Error ' + err);
            } else {
                if (result.rowCount != 1) {
                    done();
                    var err = 'Could not find album info for albumid {0}'.format(albumid);
                    console.log(err); res.send('Error: ' + err);
                } else {

                    // fetch album info
                    var album = result.rows[0];
                    // data.album_location = album.location;
                    // data.album_date = album.date;
                    data.cover_photo = album.filename;
                    data[album.category] = true;
                    
                    // strip off country from location string
                    var city = album.location;
                    var comma = city.indexOf(',');
                    if (comma >= 0) {
                        city = city.substring(0, comma);
                    }
                    data.city = city;

                    // format date to Month Year
                    var date = new Date(album.date);
                    date = months[date.getMonth()] + ' ' + date.getFullYear();
                    data.date = date;


                    // fetch photos
                    client.query(photo_query.format(albumid), function(err, result) {
                        done();
                        if (err) {
                            console.log(err); res.send('Error ' + err);
                        } else {

                            var photos = result.rows;
                            data.photos = photos;

                            res.render('album', data);
                        }
                    });
                }
            }
        });
    });




    /*
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
*/


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