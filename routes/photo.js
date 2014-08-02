// var pg = require('pg');
// var params = { host: 'ec2-54-225-101-119.compute-1.amazonaws.com', port: '5432', user: 'fijgchjkjpensc', password: 'zdGW3MUStdxwzq3nMGi5LQdT-Z', database: 'd26hna95h4r3en', ssl: true };


exports.view = function(req, res){

    var photo_ids = ['DSC_0052', 'DSC_0070', 'DSC_0089', 'DSC_0115'];

    var data = [];
    data['photo_id'] = photo_ids
    res.render('photo', data);
};
