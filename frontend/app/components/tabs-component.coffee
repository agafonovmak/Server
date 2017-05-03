`import Ember from 'ember'`

TabsComponentComponent = Ember.Component.extend

  didRender: ->
    @$('ul.tabs').tabs()

`export default TabsComponentComponent`

