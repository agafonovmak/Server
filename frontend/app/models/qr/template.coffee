`import DS from 'ember-data'`

QrTemplate = DS.Model.extend
  name:        DS.attr 'string'
  description: DS.attr 'string'
  score:       DS.attr 'number'
  cooldown:    DS.attr 'string'

  franchise:   DS.belongsTo 'franchise'

`export default QrTemplate`
