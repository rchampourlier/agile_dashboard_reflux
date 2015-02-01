Rest = require 'rest'
Mime = require 'rest/interceptor/mime'

class SprintsService

  constructor: ->
    @url = 'http://rackup.dev/api/sprints'
    @client = Rest.wrap(Mime)

  query: ->
    @client({ path: @url })

module.exports = new SprintsService()
