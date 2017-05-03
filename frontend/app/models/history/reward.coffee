`import DS from 'ember-data'`

HistoryReward = DS.Model.extend

  TYPES:  {
    'issued':  'Выдан'
    'waiting': 'Зарезервирован'
    'active':  'Возвращен'
  }

  datetime:       DS.attr 'string'
  type:           DS.attr 'string'

  franchise:      DS.belongsTo 'franchise'
  club:           DS.belongsTo 'club'
  client:         DS.belongsTo 'user'
  rewardTemplate: DS.belongsTo 'reward/template'

  formattedDateTime: Ember.computed 'datetime', ->
    moment(@get('datetime')).format('DD.MM.YYYY H:m')

  formattedType: Ember.computed 'type', ->
    @get('TYPES')[@get('type')]

`export default HistoryReward`
