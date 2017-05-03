`import DS from 'ember-data'`

ScheduleTemplate = DS.Model.extend

  name: DS.attr 'string'

  club:             DS.belongsTo 'club'
  scheduleWorkouts: DS.hasMany 'schedule-workout'

`export default ScheduleTemplate`
