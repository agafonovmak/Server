`import Ember from 'ember'`

ItemDescriptionComponent = Ember.Component.extend

  isTooLongDescription: Ember.computed.gt 'description.length', 60

  shortDescription: Ember.computed 'description', ->
    @get('description').substring(0, 60)+'...'

  didInsertElement: ->
    @$('.tooltipped').tooltip({delay: 50})

`export default ItemDescriptionComponent`

