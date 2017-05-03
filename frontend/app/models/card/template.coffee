`import DS from 'ember-data'`

CardTemplate = DS.Model.extend
  name:                  DS.attr 'string'
  freeFreezingDaysCount: DS.attr 'string'
  club:                  DS.belongsTo 'club'

`export default CardTemplate`
