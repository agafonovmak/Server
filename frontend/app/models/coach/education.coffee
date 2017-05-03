`import DS from 'ember-data'`

CoachEducation = DS.Model.extend

  name: DS.attr 'string'
  coach: DS.belongsTo 'coach'

`export default CoachEducation`
