`import Ember from 'ember'`

JqueryDatetimepickerComponent = Ember.Component.extend

  didRender: ->
    @$('.datetimepicker').datetimepicker
      format:'d.m.Y H:i'
      lang:'ru'

`export default JqueryDatetimepickerComponent`
