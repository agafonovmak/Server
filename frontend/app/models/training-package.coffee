`import DS from 'ember-data'`

TrainingPackage = DS.Model.extend

  name:          DS.attr 'string'
  trainingCount: DS.attr 'number'
  price:         DS.attr 'number'

  club:          DS.belongsTo 'club'

`export default TrainingPackage`
