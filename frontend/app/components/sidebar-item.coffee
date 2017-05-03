`import Ember from 'ember'`

SidebarItemComponent = Ember.Component.extend
  tagName: 'li'

  didRender: ->
    $('.collapsible').collapsible()

`export default SidebarItemComponent`

