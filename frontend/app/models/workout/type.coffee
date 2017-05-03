`import DS from 'ember-data'`

WorkoutType = DS.Model.extend

  title:       DS.attr 'string'
  description: DS.attr 'string'

`export default WorkoutType`
