`import Ember from 'ember'`

StaticSelectComponent = Ember.Component.extend

  didRender: ->
    if @get('value') != undefined
      @$("select").val(@get('value'))
    @$('select').material_select()

  actions:
    setValue: ->
      @set 'value', @$('select').val()

`export default StaticSelectComponent`

