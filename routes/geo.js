var utils = require('./utils');

require('dotenv').load();
var pg = require('pg');

var table_query = 'SELECT id, info, earth_distance(ll_to_earth($1, $2), ll_to_earth(lat, lon)) as distance FROM test_geo ORDER BY distance ASC;'
var insert_query = 'INSERT INTO test_geo (info, lat, lon) values ($1, $2, $3);'

exports.view = function(req, res){
    var data = [];
    data.shouldInitGeo = true;
    var lat = req.body.lat || '';
    var lon = req.body.lon || '';
    data.lat = lat;
    data.lon = lon;
    data.entries = null;

    if (lat !== '' && lon !== '') {
        data.shouldInitGeo = false;
    }

    // GET - loading login page
    if (req.method == 'GET'){
        console.log(data);
        res.render('geo', data);
        return;
    }

    // POST
    var sauce = req.body.sauce;
    if (sauce !== 'danieljih') {
        console.log(data);
        res.render('geo', data);
        return;
    }

    var msg = req.body.msg || '';

    console.log(lat);
    console.log(lon);
    console.log(msg);

    data.shouldInitGeo = false;
    data.lat = lat;
    data.lon = lon;

    // if msg empty, then load table
    if (msg === '') {
        pg.connect(process.env.DATABASE_URL, function(err, client, done) {
            client.query(table_query, [lat, lon], function(err, result) {
                done();
                console.log(result);

                data.entries = result.rows;
                res.render('geo', data);
            });
        });
        return;
    }

    pg.connect(process.env.DATABASE_URL, function(err, client, done) {
        client.query(insert_query, [msg, lat, lon], function(err, result) {
            client.query(table_query, [lat, lon], function(err, result) {
                done();
                console.log(result);

                var entries = result.rows;
                for (var i = 0; i < result.rowCount; i++) {
                    entries[i].distance = int(entries[i].distance);
                }

                data.entries = entries;
                res.render('geo', data);
            })
        });
    });

    // pg.connect(process.env.DATABASE_URL, function(err, client, done) {
    //     client.query(album_query, function(err, result) {
    //         done();
    //         if (err) {
    //             console.err(err); response.send("Error " + err);
    //         } else {
    //             var albums = result.rows;
    //             for (var i = 0; i < result.rowCount; i++) {
    //                 var album = albums[i];

    //                 if (utils.isValidAlbum(album.id)) {
    //                     album.show_link = true;
    //                 }

    //                 // strip off country from location string
    //                 var city = album.location;
    //                 var comma = city.indexOf(',');
    //                 if (comma >= 0) {
    //                     city = city.substring(0, comma);
    //                 }
    //                 album.city = city;

    //                 // format date to Month Year
    //                 var date = new Date(album.date);
    //                 date = months[date.getMonth()] + ' ' + date.getFullYear();
    //                 album.date = date;
    //             }

    //             data.albums = albums;
    //             res.render('version2', data);
    //         }
    //     })
    // });
    res.render('geo', data);
};
