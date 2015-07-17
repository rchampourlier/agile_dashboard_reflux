Reflux     = require 'reflux'

# IssuesFilterActions:
#   - addFilter
#
IssuesFilterActions = Reflux.createActions(
  [ 'addFilter' ]
)

IssuesFilterActions.addFilter.listen () ->
  console.log 'addFilter.listen'

module.exports = IssuesFilterActions
