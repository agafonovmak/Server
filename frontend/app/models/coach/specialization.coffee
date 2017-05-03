`import DS from 'ember-data'`

CoachSpecialization = DS.Model.extend

  name: DS.attr 'string'
  coach: DS.belongsTo 'coach'

`export default CoachSpecialization`
