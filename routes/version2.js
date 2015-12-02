// var pg = require('pg');
// var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };

var Promise = require('bluebird');
var request = Promise.promisify(require('request'));
var get_photos_url = 'http://djih-rest.herokuapp.com/get_photos?sort_by=';

exports.view = function(req, res){
    var data = [];
    data['self.url'] = '/photo';

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

            // isolate year from date taken
            var year = photo['date_taken'];
            var slashLocation = year.lastIndexOf('/');
            if (slashLocation >= 0) {
                year = year.substring(slashLocation+1);
            }
            photo['year'] = year;
        }

        data['photos'] = photos;
        res.render('version2', data);
    })
    .catch(function(e){
        console.log(e);
    });
};