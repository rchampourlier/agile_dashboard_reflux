React          = require 'react'
Router         = require 'react-router'
RouteHandler   = Router.RouteHandler

Navbar      = require 'react-bootstrap/Navbar'
Nav         = require 'react-bootstrap/Nav'
NavItemLink = require 'react-router-bootstrap/lib/NavItemLink'

brand = "Agile Dashboard"

Layout = React.createClass
  render: ->
    return (
      <div className="App">
        <Navbar brand={brand} staticTop className="bs-docs-nav" role="banner" toggleNavKey={0}>
          <Nav className="bs-navbar-collapse" role="navigation" eventKey={0} id="top">
            <NavItemLink to="sprints">Sprints</NavItemLink>
            <NavItemLink to="worklogs">Worklogs</NavItemLink>
            <NavItemLink to="issues">Issues</NavItemLink>
          </Nav>
        </Navbar>
        <div className="container">
          <RouteHandler />
        </div>
      </div>
    )

module.exports = Layout
