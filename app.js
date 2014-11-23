
/**
 * Module dependencies.
 */

var express = require('express');
var http = require('http');
var path = require('path');
var handlebars = require('express3-handlebars')
var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine('handlebars', handlebars());
app.set('view engine', 'handlebars');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.cookieParser('djih secret key'));
app.use(express.session());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));


// define routes
var cover = require('./routes/cover');
var car = require('./routes/car');
var dashboard = require('./routes/dashboard');
var photo = require('./routes/photo');
var photo_get_rest = require('./routes/photo_get_rest');
var photo_get_exif = require('./routes/photo_get_exif');
var food_freelancer = require('./routes/food_freelancer');
var food_agency = require('./routes/food_agency');

//var myevents = require('./routes/myevents');
//var events = require('./routes/events');
//var people = require('./routes/people');
//var profile = require('./routes/profile');
//var login = require('./routes/login');
//var createAccount = require('./routes/createAccount');
//var addAccount = require('./routes/addAccount');
//var addEvent = require('./routes/addEvent');
//var pollOptions = require('./routes/pollOptions');
//var createEvent = require('./routes/createEvent');
//var eventView = require('./routes/eventView');
//var vote = require('./routes/vote');
//var submitVote = require('./routes/submitVote');
//var eventDelete = require('./routes/eventDelete');
//var project = require('./routes/project');


// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

// Add routes here
app.get('/', cover.view);
app.get('/car', car.view);
app.get('/dashboard', dashboard.view);
app.get('/photo', photo.view);
app.get('/photo_get_rest', photo_get_rest.view);
app.get('/photo_get_exif', photo_get_exif.view);
app.get('/food_freelancer', food_freelancer.view);
app.get('/food_agency', food_agency.view);


//app.get('/myevents', myevents.view);
//app.get('/events', events.view);
//app.get('/people', people.view);
//app.get('/profile/:id', profile.view);
//app.get('/profile', profile.view);
//app.get('/login', login.view);
//app.get('/addEvent', addEvent.view);
//app.get('/pollOptions', addEvent.view);
//app.get('/createEvent', addEvent.view);
//app.get('/eventView/:id', eventView.view);
//app.get('/vote', vote.view);
//app.get('/submitVote', myevents.view);
//app.get('/addAccount', addAccount.view);
//app.get('/myeventsalt', myevents.altview);

// POST REQUESTS - Form submission
//app.post('/login', login.view);
//app.post('/pollOptions', pollOptions.view);
//app.post('/profile/:id', profile.view);
//app.post('/addEvent', addEvent.view);
//app.post('/createEvent', createEvent.view);
//app.post('/submitVote', submitVote.view);
//app.post('/createAccount', createAccount.view);

//app.post('/eventDelete/delete_event', eventDelete.delete_event);
//app.post('/project/:id/delete', project.deleteProject);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
