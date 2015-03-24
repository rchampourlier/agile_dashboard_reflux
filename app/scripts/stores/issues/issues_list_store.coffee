Reflux            = require 'reflux'
IssuesListActions = require '../../actions/issues/issues_list_actions'

IssuesListStore = Reflux.createStore

  init: ->
    this.listenToMany IssuesListActions

  onLoad: ->

  onLoadCompleted: (issues) ->
    this.trigger(issues)

  onLoadError: (error) ->

  getInitialState: -> []

module.exports = IssuesListStore
