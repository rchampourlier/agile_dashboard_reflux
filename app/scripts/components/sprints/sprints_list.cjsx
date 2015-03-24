React        = require 'react'
Router       = require 'react-router'
RouteHandler = Router.RouteHandler

Reflux             = require 'reflux'
SprintsListStore   = require '../../stores/sprints/sprints_list_store'
SprintsListActions = require '../../actions/sprints/sprints_list_actions'

Griddle        = require 'griddle-react'
SprintsListRow = require './sprints_list_row'

# Displays a list of sprints. The list is represented
# by a Griddle. Each sprint is in a custom row
# (SprintsListRow) which presents a link to the
# sprint's
SprintsListComponent = React.createClass

  # This handles unsubscribing the listener on component unmount
  mixins: [Reflux.ListenerMixin]

  onSprintsListChange: (sprints) ->
    this.setState { sprints: sprints }

  componentWillMount: ->
    this.setState { sprints: [] }
    SprintsListActions.load()

  componentDidMount: ->
    this.listenTo SprintsListStore, @onSprintsListChange

  render: ->
    return (
      <div className="sprints-list">
        <Griddle results={this.state.sprints} useCustomRowComponent="true" customRowComponent={SprintsListRow} />
        <RouteHandler />
      </div>
    )

module.exports = SprintsListComponent
