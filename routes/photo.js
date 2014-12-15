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

    request(url).then(function(content){
        data['photos'] = JSON.parse(content[1])['photos'];;
        res.render('photo_get_rest', data);
    });
};