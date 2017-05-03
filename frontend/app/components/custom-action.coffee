`import Ember from 'ember'`

CustomActionComponent = Ember.Component.extend
  tagName: 'span'
  classNames: ['custom-action-wrapper']

  iconClass: Ember.computed 'icon', ->
    "fa #{@get('icon')}"

  didInsertElement: ->
    @$('.tooltipped').tooltip({delay: 50})

  actions:
    appendAction: ->
      @sendAction('action', @get('model'))

`export default CustomActionComponent`

