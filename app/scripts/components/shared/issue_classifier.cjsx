_      = require 'lodash'
React  = require 'react'

# Displays the details of a sprint.
IssueClassifierComponent = React.createClass

  colorForStatus: (value) ->
    switch value
      when 'Open' then 'danger'
      when 'In Development' then 'warning'
      when 'In Review' then 'info'
      when 'In Functional Review' then 'info'
      when 'Ready for Release' then 'success'
      else 'success'

  cssClasses: (type, value) ->
    classes = [@props.className, 'label']
    switch type
      when 'status'
        classes.push 'label-' + this.colorForStatus(value)
      when 'type'
        classes.push 'label-default'
      when 'category'
        classes.push 'label-primary'
    classes.join ' '

  handleOnClick: ->
    console.log @props
    @props.onAdd(@props.type, @props.value)

  render: ->
    return (
      <span className={this.cssClasses(@props.type, @props.value)}
        onClick={@handleOnClick}>
        {@props.value}
      </span>
    )

module.exports = IssueClassifierComponent
