`import Ember from 'ember'`

JqueryTimepickerComponent = Ember.Component.extend

  didRender: ->
    @$('input#timepicker').timepicker
      timeFormat: 'H:i'
      minTime: '08:00'
      maxTime: '22:00'

`export default JqueryTimepickerComponent`
