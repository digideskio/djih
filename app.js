
/**
 * Module dependencies.
 */

var express = require('express');
var http = require('http');
var path = require('path');
var Promise = require('bluebird');
var handlebars = require('express3-handlebars')
var app = express();


// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine('handlebars', handlebars());
app.set('view engine', 'handlebars');
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.cookieParser('djih secret key'));
app.use(express.session());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.favicon(path.join(__dirname, 'public', 'camera.ico'))); 



// define routes
var cover = require('./routes/cover');
var car = require('./routes/car');
var dashboard = require('./routes/dashboard');
var photo = require('./routes/photo');
var photo_get_rest = require('./routes/photo_get_rest');
var photo_get_exif = require('./routes/photo_get_exif');
var food_freelancer = require('./routes/food_freelancer');
var food_agency = require('./routes/food_agency');
var version2 = require('./routes/version2');
var album = require('./routes/album');
var food = require('./routes/food');


// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

// Add routes here
//app.get('/', photo.view);
app.get('/', version2.view);
// app.get('/car', car.view);
// app.get('/dashboard', dashboard.view);
// app.get('/photo', photo.view);
// app.get('/photo_get_rest', photo_get_rest.view);
// app.get('/photo_get_exif', photo_get_exif.view);
// app.get('/food_freelancer', food_freelancer.view);
// app.get('/food_agency', food_agency.view);


// version 2
app.get('/v2', function(req,res){res.redirect('/')});
app.get('/travel', version2.view);
app.get('/food', food.view);
app.get('/blog', version2.view);
app.get('/aboutme', version2.view);
app.get('/album', function(req,res){res.redirect('/')});
app.get('/album/:albumid', album.view);


http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
