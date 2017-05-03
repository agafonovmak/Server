`import DS from 'ember-data'`

WorkoutImage = DS.Model.extend

  file:     DS.attr 'file'
  fileUrl:  DS.attr 'string'
  template:  DS.belongsTo 'workout/template'

`export default WorkoutImage`
