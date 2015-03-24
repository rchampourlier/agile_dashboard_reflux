Reflux             = require 'reflux'
SprintsListActions = require '../../actions/sprints/sprints_list_actions'

SprintsListStore = Reflux.createStore

  init: ->
    this.listenToMany SprintsListActions

  onLoad: ->

  onLoadCompleted: (sprints) ->
    this.trigger(sprints)

  onLoadError: (error) ->

  getInitialState: -> []

module.exports = SprintsListStore
