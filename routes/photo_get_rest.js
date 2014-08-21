// var pg = require('pg');
// var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };

// http://djih-rest.herokuapp.com/get_photos

exports.view = function(req, res){
    var data = [];
    data['self.url'] = '/photo_get_rest';

    if (!req.query.sort_by){
        req.query.sort_by = 'none';
    }

    var request = require('request');
    request('http://djih-rest.herokuapp.com/get_photos?sort_by=' + req.query.sort_by, function(error, response, body){
        json_data = JSON.parse(body);
        photos = json_data['photos'];
        console.log(photos);
        data['photos'] = photos;

        console.log('sort by: ' + json_data['sort_by']);

        res.render('photo_get_rest', data);
    })
};
