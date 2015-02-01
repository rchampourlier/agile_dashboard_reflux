React = require 'react'
SprintsService = require '../services/sprints'

sprints = SprintsService.query().then (response) ->
  console.log 'response: ', response

SprintsComponent = React.createClass

  render: ->
    return (
      <div>
        <h1>Sprints</h1>
      </div>
    )

module.exports = SprintsComponent
