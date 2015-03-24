React = require 'react'

ReadableTimeComponent = React.createClass

  propTypes:
    time: React.PropTypes.number.isRequired

  formatTime: (seconds) ->
    seconds = parseInt seconds, 10

    minute = 60
    hour = minute * 60
    day = hour * 8
    week = day * 5

    format = (number, string) ->
      "#{number}#{string}"

    round0 = (value) -> Math.floor(value)
    round1 = (value) -> Number(value.toFixed(1))

    switch
      when seconds < hour then format(round0(seconds / minute), 'm')
      when seconds < day then format(round1(seconds / hour), 'h')
      else format(round1(seconds / day), 'd')

  render: ->
    return (
      <span>{this.formatTime(this.props.time)}</span>
    )

module.exports = ReadableTimeComponent
