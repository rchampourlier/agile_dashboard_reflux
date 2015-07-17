Reflux            = require 'reflux'
IssuesFilterActions = require '../../actions/issues/issues_filter_actions'

IssuesFilterStore = Reflux.createStore

  init: -> this.listenToMany IssuesFilterActions

  onAddFilter: (filter) ->
    console.log 'IssuesStore onAddFilter -> ', filter

  onAddCategory: (category) ->
    console.log 'IssuesStore onAddCategory -> ', category

  onAddStatus: (status) ->
    console.log 'IssuesStore onAddStatus -> ', status

  getInitialState: -> []

module.exports = IssuesFilterStore
