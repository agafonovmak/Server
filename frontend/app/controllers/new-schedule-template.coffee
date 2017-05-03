`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewScheduleTemplateController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,
  store: Ember.inject.service()

  scheduleWorkouts: []
  scheduleWorkout: null

  fcHeader: Ember.computed ->
    left: "agendaWeek"
    right: ""

  events: Ember.computed 'scheduleWorkouts.length', 'scheduleWorkouts.@each.name',
    'scheduleWorkouts.@each.start', 'scheduleWorkouts.@each.end', ->
      @get('scheduleWorkouts').map (event) =>
        {
          model: event
          title: event.get('name')
          start: event.get('start')
          end: event.get('end')
        }

  isCanAddWorkout: Ember.observer 'scheduleWorkout', 'scheduleWorkout.name', 'scheduleWorkout.start', 'scheduleWorkout.end', ->
    $('#addWorkout').attr('disabled', (Ember.isEmpty(@get('scheduleWorkout.name')) && Ember.isEmpty(@get('scheduleWorkout.start')) && Ember.isEmpty(@get('scheduleWorkout.end'))))

  actions:
    openModal: ->
      @set 'scheduleWorkout', @get('store').createRecord('schedule-workout')
      @set 'scheduleWorkout.club', @get('selectedClub')
      $('#workout-modal').openModal()

    clearWorkout: ->
      @get('scheduleWorkout').deleteRecord()
      $('#workout-modal').closeModal()

    addWorkout: ->
      @get('scheduleWorkouts').pushObject(@get('scheduleWorkout'))
      $('#workout-modal').closeModal()

    setTemplate: (template) ->
      @set 'scheduleWorkout.name', template.get('name')
      @set 'scheduleWorkout.description', template.get('description')
      @set 'scheduleWorkout.duration', template.get('duration')
      @set 'scheduleWorkout.seatsCount', template.get('seatsCount')
      @set 'scheduleWorkout.gym', template.get('gym')
      @set 'scheduleWorkout.shareUrl', template.get('shareUrl')
      @set 'scheduleWorkout.isNeedManagerConfirm', template.get('isNeedManagerConfirm')
      return false

    save: ->
      @get('model').save().then (model) =>
        @get('scheduleWorkouts').forEach (workout) =>
          workout.set 'scheduleTemplate', @get('model')
          workout.save()
        @transitionToRoute 'schedule-templates'
        @scrollToTop()
        @showToast('Шаблон расписания успешно создан!')

    eventRender: (event, element) ->
      element.find(".fc-title").append("<i class='fa fa-times'></i>")
      $(element.find(".fc-title .fa-times")).click =>
        if confirm('Удалить тренировку?')
          @get('scheduleWorkouts').removeObject(event.model)
          @showToast('Тренировка успешно удалена!')


`export default NewScheduleTemplateController`
