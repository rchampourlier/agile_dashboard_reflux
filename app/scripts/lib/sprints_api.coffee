_ = require 'lodash'
Superagent = require 'superagent'

URL = window.API_HOST + "/api/sprints"

Utils =

  sortSprintsList: (sprints) ->
   _.sortBy(sprints, sprints.name).reverse()

# The SprintsAPI provides methods to fetch sprints
# from the API. Each method returns a promise.
SprintsAPI =

  # Load all sprints
  # @return a promise
  #
  # GET /api/sprints
  loadAll: (successCallback, failureCallback) ->
    Superagent
      .get URL
      .end (response) =>
        if response.ok
          console.log 'SprintsAPI#loadAll => SUCCESS'
          rawSprints = response.body
          sortedSprints = Utils.sortSprintsList(rawSprints)
          successCallback(sortedSprints)
        else
          console.log 'SprintsAPI#loadAll => FAILED'
          failureCallback(response.error)

module.exports = SprintsAPI
