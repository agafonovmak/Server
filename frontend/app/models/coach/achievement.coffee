`import DS from 'ember-data'`

CoachAchievement = DS.Model.extend

  name: DS.attr 'string'
  coach: DS.belongsTo 'coach'

`export default CoachAchievement`
