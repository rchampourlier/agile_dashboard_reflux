_      = require 'lodash'
React  = require 'react'
Router = require 'react-router'

Reflux               = require 'reflux'
IssuesListStore      = require '../../stores/issues/issues_list_store'
IssuesListActions    = require '../../actions/issues/issues_list_actions'
IssuesFilterActions  = require '../../actions/issues/issues_filter_actions'

# Components
ReadableTime    = require '../../components/shared/readable_time'
IssueClassifier = require '../../components/shared/issue_classifier'

# Displays the details of a sprint.
IssuesListComponent = React.createClass

  mixins: [Router.State, Reflux.ListenerMixin]

  baseIssuesListQueryOptions: ->
    sprint_name: this.getParams().sprintName

  # @param issuesList [Object]
  #   - statistics
  #   - issues
  onIssuesListChange: (issuesList) ->
    this.setState issuesList

  componentWillMount: ->
    this.setState { statistics: {}, issues: [] }
    IssuesListActions.load this.baseIssuesListQueryOptions()

  componentDidMount: ->
    this.listenTo IssuesListStore, @onIssuesListChange

  # Handles dynamic route changes
  componentWillReceiveProps: ->
    sprintName = this.getParams().sprintName
    IssuesListActions.load this.baseIssuesListQueryOptions()

  render: ->
    return (
      <div>
        <h3>Statistics</h3>
        <ul>
          <li>{@state.statistics.count} issues</li>
          <li>Timespent: <ReadableTime time={@state.statistics.timespent} /></li>
          <li>Remaining estimate: <ReadableTime time={@state.statistics.time_estimate} /></li>
        </ul>
      </div>
      <div>
        <h3>Issues</h3>
        <table className="table table-hover">
          <tbody>
            {_.map @state.entries, (issue) =>
              <tr key={issue.key}><td>
                <div className="header">
                  <strong>{issue.key}&nbsp;</strong>
                  <span>{issue.summary}</span>
                  <IssueClassifier
                    className="pull-right"
                    type="status"
                    value={issue.status}
                    onAdd={IssuesFilterActions.addFilter}/>
                </div>
                <div className="details">
                  <IssueClassifier
                    type="category"
                    value={issue.category}
                    onAdd={IssuesFilterActions.addFilter} />
                  <IssueClassifier type="type" value={issue.type} />
                </div>
              </td></tr>
            }
          </tbody>
        </table>
        <h4>Filter</h4>
        <ul>
        </ul>
      </div>
    )

module.exports = IssuesListComponent
