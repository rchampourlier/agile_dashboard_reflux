Reflux     = require 'reflux'
IssuesAPI  = require '../../lib/issues_api'

# IssuesListActions:
#   - load(queryOptions): loads matching issues
#
IssuesListActions = Reflux.createActions
  load: { asyncResult: true }

# @param queryOptions [Object]
#   - sprint_name [String]
#
IssuesListActions.load.listen (queryOptions) ->
  IssuesAPI.query queryOptions, this.completed, this.failed

module.exports = IssuesListActions
