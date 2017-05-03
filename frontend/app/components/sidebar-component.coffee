`import Ember from 'ember'`

SidebarComponent = Ember.Component.extend

  didInsertElement: ->
    $('.button-collapse').sideNav
      menuWidth: 330
      edge: 'left'
      closeOnClick: false

    @$('.collapsible-header').click ->
      $('.collapsible-header.active').not(this).click()

`export default SidebarComponent`

