


candidates = {

}

module.exports = {
	vote: (req, res) ->
		res.render 'vote.jade', {
			title: 'Sign up at'+app.locals.config.name,

		}
		return
}