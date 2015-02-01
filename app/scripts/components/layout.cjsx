React          = require 'react'
Router         = require 'react-router'
RouteHandler   = Router.RouteHandler

Navbar  = require('react-bootstrap/Navbar')
Nav     = require('react-bootstrap/Nav')
NavItem = require('react-bootstrap/NavItem')

brand = "Agile Dashboard"

Layout = React.createClass
  render: ->
    return (
      <div className="App">
        <RouteHandler />
        <Navbar brand={brand} staticTop className="bs-docs-nav" role="banner" toggleNavKey={0}>
          <Nav className="bs-navbar-collapse" role="navigation" eventKey={0} id="top">
            <NavItem href="#">Sprints</NavItem>
            <NavItem href="#">Worklogs</NavItem>
            <NavItem href="#">Issues</NavItem>
          </Nav>
        </Navbar>
      </div>
    )

module.exports = Layout
