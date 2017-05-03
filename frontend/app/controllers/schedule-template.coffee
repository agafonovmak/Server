`import Ember from 'ember'`

ScheduleTemplateController = Ember.Controller.extend

  fcHeader: Ember.computed ->
    left: "agendaWeek"
    right: ""

  events: Ember.computed 'model.scheduleWorkouts.length', 'model.scheduleWorkouts.@each.name',
    'model.scheduleWorkouts.@each.start', 'model.scheduleWorkouts.@each.end', 'model.scheduleWorkouts.isFulfilled',->
      if @get('model.scheduleWorkouts')?
        @get('model.scheduleWorkouts').map (event) =>
          {
            title: event.get('name')
            start: event.get('start')
            end: event.get('end')
          }

`export default ScheduleTemplateController`
