// var pg = require('pg');
// var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };

// http://djih-rest.herokuapp.com/get_photos

exports.view = function(req, res){

    var request = require('request');
    request('http://djih-rest.herokuapp.com/get_photos', function(error, response, body){
        photos = JSON.parse(body)['photos']
        console.log(photos);

        var data = [];
        data['photos'] = photos;

        res.render('photo_get_rest', data);
    })
};
