Reflux            = require 'reflux'
IssuesFilterActions = require '../../actions/issues/issues_list_actions'

IssuesFilterStore = Reflux.createStore

  init: -> this.listenToMany IssuesFilterActions

  onAddCategory: (category) ->
    console.log 'IssuesStore onAddCategory -> ', category

  onAddStatus: (status) ->
    console.log 'IssuesStore onAddStatus -> ', status

  getInitialState: -> []

module.exports = IssuesListStore
