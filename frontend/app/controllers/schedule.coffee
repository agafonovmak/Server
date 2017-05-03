`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

ScheduleController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,
  session: Ember.inject.service()
  store:   Ember.inject.service()

  filteredModels: Ember.computed.filterBy 'model', 'isNew', false
  selectedScheduleTemplate: null
  selectedDate: null

  events: Ember.computed 'filteredModels.@each.id', 'filteredModels.@each.title',
    'filteredModels.@each.start', 'filteredModels.@each.end', ->
      @get('filteredModels').map (event) =>
        {
          id: event.get('id')
          title: event.get('title')
          start: event.get('start')
          end: event.get('end')
        }

  fcHeader: Ember.computed ->
    left: "month, agendaWeek, agendaDay",
    center: "title",
    right: "today, prev, next"

  actions:
    openModal: ->
      $('#workout-modal').openModal()

    openScheduleTemplateModal: ->
      $('#schedule-template-modal').openModal()

    saveWorkout: ->
      @get('workout').save().then =>
        $('#workout-modal').closeModal()
        @transitionToRoute 'schedule'
        @showToast('Групповая тренировка успешно добавлена!')
        @scrollToTop()

    setTemplate: (template) ->
      @set 'workout.name', template.get('name')
      @set 'workout.description', template.get('description')
      @set 'workout.duration', template.get('duration')
      @set 'workout.seatsCount', template.get('seatsCount')
      @set 'workout.gym', template.get('gym')
      @set 'workout.shareUrl', template.get('shareUrl')
      @set 'workout.isNeedManagerConfirm', template.get('isNeedManagerConfirm')
      return false

    eventRender: (event, element) ->
      element.find(".fc-title").append("<i class='fa fa-times'></i>")
      $(element.find(".fc-title .fa-times")).click =>
          if confirm('Удалить тренировку?')
            storedEvent = @get('store').peekRecord('workout', event.id)
            storedEvent.destroyRecord()
            @transitionToRoute 'schedule'

    fillViaTemplate: ->
      @get('selectedScheduleTemplate.scheduleWorkouts').then (workouts) =>
        for s_workout in workouts.canonicalState
          workout = @get('store').createRecord('workout')
          workout.set 'status', s_workout.record.get('status')
          workout.set 'price',  s_workout.record.get('price')
          workout.set 'name', s_workout.record.get('name')
          workout.set 'description', s_workout.record.get('description')
          workout.set 'duration', s_workout.record.get('duration')
          workout.set 'seatsCount', s_workout.record.get('seatsCount')
          workout.set 'gym', s_workout.record.get('gym')
          workout.set 'shareUrl', s_workout.record.get('shareUrl')
          workout.set 'isNeedManagerConfirm', s_workout.record.get('isNeedManagerConfirm')
          workout.set 'type', s_workout.record.get('type')
          workout.set 'template', s_workout.record.get('template')
          workout.set 'club', s_workout.record.get('club')
          workout.set 'coaches', s_workout.record.get('coaches')
          datetime =  moment(@get('selectedDate'), 'DD.MM.YYYY').add(s_workout.record.get('day'), 'days')
          datetime.hour(parseInt(s_workout.record.get('time').substring(0,2)))
          datetime.minute(parseInt(s_workout.record.get('time').substring(3,5)))
          workout.set 'datetime', datetime.format('DD.MM.YYYY HH:mm')
          workout.save()
        $('#schedule-template-modal').closeModal()
        @transitionToRoute('schedule')
        @showToast('Расписание успешно заполнено по шаблону!')
        @scrollToTop()

`export default ScheduleController`
