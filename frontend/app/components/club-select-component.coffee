`import Ember from 'ember'`

ClubSelectComponentComponent = Ember.Component.extend

  store: Ember.inject.service()

  didRender: ->
    @$('select').material_select()

  actions:
    setValue: ->
      val = Ember.A()
      @get('store').findRecord(@get('optionType'), @$('select').val()).then (value) =>
        val.pushObject value
        @set 'value', val

`export default ClubSelectComponentComponent`

