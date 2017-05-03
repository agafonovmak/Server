`import Ember from 'ember'`

ScheduleMondaysDatepickerComponent = Ember.Component.extend

  didRender: ->
    @$('.datepicker').datetimepicker
      format: 'd.m.Y'
      lang: 'ru'
      timepicker: false
      disabledWeekDays: [2, 3, 4, 5, 6, 7, 0]
      dayOfWeekStart: 1

`export default ScheduleMondaysDatepickerComponent`
