React = require 'react'
Router = require 'react-router'
Route = Router.Route
Routes = Router.Routes
DefaultRoute = Router.DefaultRoute

Layout = require './components/layout'
Home = require './components/home'
SprintsList = require './components/sprints/sprints_list'
IssuesList = require './components/issues/issues_list'
WorklogsIndex = require './components/worklogs/index'
IssuesIndex = require './components/issues/index'

routes = (
	<Route name="layout" path="/" handler={Layout}>
		<DefaultRoute handler={Home} />
    <Route name="sprints" path="/sprints" handler={SprintsList}>
      <Route name="sprintIssues" path="/sprints/:sprintName" handler={IssuesList} />
    </Route>
    <Route name="worklogs" path="/worklogs" handler={WorklogsIndex} />
    <Route name="issues" path="/issues" handler={IssuesIndex} />
	</Route>
)

exports.start = ->
	Router.run routes, (Handler) ->
		React.render <Handler />, document.getElementById('content')
