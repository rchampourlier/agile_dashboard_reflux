_ = require 'lodash'
Superagent = require 'superagent'

URL = window.API_HOST + "/api/issues"

# The IssuesAPI provides methods to fetch sprints
# from the API. Each method returns a promise.
IssuesAPI =

  # Query issues with filter criteria.
  #
  # @param [Object] queryOptions
  # @param [Function] successCallback
  # @param [Function] failureCallback
  # @return a promise
  #
  # GET /api/issues
  query: (queryOptions, successCallback, failureCallback) ->
    Superagent
      .get URL
      .query queryOptions
      .end (response) =>
        if response.ok
          console.log 'IssuesAPI#query => SUCCESS'
          issues = response.body
          successCallback(issues)
        else
          console.log 'IssuesAPI#query => FAILED'
          failureCallback(response.error)

module.exports = IssuesAPI
