# dependencies
passport = require('passport');
home = require('./../routes/lib/home');
vote = require './../routes/lib/vote'

# check to see if user is logged in
restrict = (req, res, next) ->
	if (req.user)
		next();
	else
		res.redirect('/login');
	return

# checks if user is an admin
isAdmin = (req, res, next) ->
	if (req.user.role == 'admin')
		next();
	else
		res.redirect('/');
	return

# routes
module.exports = (app) ->
	app.get('/', home.index);
	app.get('/login', home.login);
	app.post '/login',
	passport.authenticate('local', {failureRedirect: '/login'}), 
	(req, res) ->
		res.redirect('/')
		return
	app.get('/logout', restrict, home.logout);
	app.get('/about', home.about);
	app.get('/about/tos', home.tos);
	app.get('/register', home.getRegister);
	app.post('/register', home.postRegister);
	app.get('/checkExists', home.checkExists);
	app.get('/profile', restrict, home.profile);
	app.get('/vote', vote.vote)
	return
