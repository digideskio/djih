exports.view = function(req, res){
    var date = new Date();
    var dateString = (date.getMonth()+1) + "/" + date.getDate();
    var data = [];
    data['date'] = dateString;
    res.render('food_agency', data);
};
