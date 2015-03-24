Reflux = require 'reflux'
SprintsAPI = require '../../lib/sprints_api'

SprintsListActions = Reflux.createActions
  load: { asyncResult: true }

SprintsListActions.load.listen ->
  SprintsAPI.loadAll this.completed, this.failed

module.exports = SprintsListActions
