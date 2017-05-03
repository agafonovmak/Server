`import Ember from 'ember'`

DatetimepickerComponentComponent = Ember.Component.extend

  oldValue: null

  didInsertElement: ->
    @$('.datepicker').pickadate
      selectMonths: true
      selectYears: 15
      format: 'dd-mm-yyyy'
      monthsFull: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь']
      monthsShort: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь']
      today: 'Сегодня'
      clear: 'Очистить'
      close: 'Закрыть'
      firstDay: 1
      weekdaysFull: ['Воскресение', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота']

    picker = @$('.datepicker').pickadate('picker')
    picker.set('select', moment(@get('value')).format(''), { format: 'dd-mm-yyyy' })
    @set 'oldValue', picker.get('select').pick

    picker.on set: =>
      if @get('oldValue') != picker.get('select').pick
        @set 'oldValue', picker.get('select').pick
        @set 'value', moment(picker.get('select').pick).format('DD-MM-YYYY')


`export default DatetimepickerComponentComponent`

