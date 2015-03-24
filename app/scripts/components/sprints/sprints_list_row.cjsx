React  = require 'react'
Router = require 'react-router'
Link = Router.Link

SprintsListRowComponent = React.createClass

  getDefaultProps: -> { data: {} }

  render: ->
    return (
      <div className="sprint-list-item">
        <Link to="sprintIssues" params={{sprintName: this.props.data.name}}>
          <strong>{this.props.data.name}</strong>
        </Link>
      </div>
    )

module.exports = SprintsListRowComponent
