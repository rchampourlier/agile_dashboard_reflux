React = require 'react'
Router = require 'react-router'
Route = Router.Route
Routes = Router.Routes
DefaultRoute = Router.DefaultRoute

Layout = require './components/layout'
Home = require './components/home'
Sprints = require './components/sprints'

routes = (
	<Route name="layout" path="/" handler={Layout}>
		<DefaultRoute handler={Home} />
    <Route name="sprints" path="/sprints" handler={Sprints} />
	</Route>
)

exports.start = ->
	Router.run routes, (Handler) ->
		React.render <Handler />, document.getElementById('content')
