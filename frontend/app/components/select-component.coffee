`import Ember from 'ember'`

SelectComponentComponent = Ember.Component.extend

  store: Ember.inject.service()

  didRender: ->
    if @get('value') != undefined
      @$("select").val(@get('value.id'))
    @$('select').material_select()

  actions:
    setValue: ->
      @get('store').findRecord(@get('optionType'), @$('select').val()).then (value) =>
        @set 'value', value
        if @get('onSelect')
          @sendAction('onSelect', value)

`export default SelectComponentComponent`

