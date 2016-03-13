var utils = require('./utils');

require('dotenv').load();
var pg = require('pg');
var format = require('string-format');
format.extend(String.prototype);

var album_from_photo_id_query = 'SELECT album_id FROM test_album_photos WHERE photo_id = {0}';
var album_query = 'SELECT a.location, a.date, a.category, a.cover_photo_id, p.filename, p.width, p.height FROM test_albums AS a INNER JOIN test_photos AS p ON a.cover_photo_id = p.id WHERE a.id = {0}';
var photo_query = 'SELECT p.id, p.filename, p.dropbox_url, p.title, p.location, p.camera, p.focal_length, p.aperture, p.shutter_speed, p.iso, p.date_taken, p.width, p.height FROM test_album_photos AS a INNER JOIN test_photos AS p ON a.photo_id = p.id WHERE a.album_id = {0} ORDER BY RANDOM();';

var months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
]

exports.view = function(req, res){
    var data = [];
    data.API_KEY = process.env.AMPLITUDE_API_KEY || '850a8c4c4b49f343859014651aec1a20';

    var photoid = parseInt(req.params.photoid);

    if (!utils.isValidPhoto(photoid)) {
        res.redirect('/');
        return;
    }

    data.from_photo = true;

    pg.connect(process.env.DATABASE_URL, function(err, client, done) {
        client.query(album_from_photo_id_query.format(photoid), function(err, result) {
            if (err) {
                done();
                console.log(err); res.send('Error ' + err);
            } else {
                if (result.rowCount != 1) {
                    done();
                    var err = 'Could not find album info for photoid {0}'.format(photoid);
                    console.log(err); res.send('Error: ' + error);
                } else {

                    var albumid = result.rows[0].album_id;

                    // invalid albumid
                    if (!utils.isValidAlbum(albumid)) {
                        done();
                        res.redirect('/');
                        return;
                    }

                    data.album_id = albumid;
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
                                data.cover_photo_id = album.cover_photo_id;
                                data.cover_photo_width = album.width;
                                data.cover_photo_height = album.height;
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
                                        var numPhotos = photos.length;

                                        // if first photo is cover photo, swap with last,
                                        // so on mobile you don't see the same photo twice
                                        if (photos[0].id == data.cover_photo_id && numPhotos > 1) {
                                            var swapIndex = utils.randomInt(1, numPhotos-1);
                                            photo = photos[0];
                                            photos[0] = photos[swapIndex];
                                            photos[swapIndex] = photo;
                                        }

                                        data.photos = photos;

                                        // find index of specified photo
                                        data.gallery_index = 0;
                                        for (var i = 0; i < numPhotos; i++) {
                                            if (photos[i].id == photoid) {
                                                data.gallery_index = i;
                                                var photo = photos[i];
                                                data.photo = photo;

                                                var date = new Date(photo.date_taken);
                                                data.photo.date = months[date.getMonth()] + ' ' + date.getDate() + ', ' + date.getFullYear();
                                            }
                                        }

                                        res.render('photo', data);
                                    }
                                });
                            }
                        }
                    });
                }
            }
        })
    });
};
