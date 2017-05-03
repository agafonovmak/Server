`import DS from 'ember-data'`

Workout = DS.Model.extend

  STATUSES: ['default', 'new', 'hot', 'best']

  status:              DS.attr 'string'
  datetime:            DS.attr 'string'
  aasmState:           DS.attr 'string'
  cancelReason:        DS.attr 'string'
  price:               DS.attr 'number', defaultValue: 0
  availableSeatsCount: DS.attr 'number'
  title:               DS.attr 'string'
  start:               DS.attr 'string'
  end:                 DS.attr 'string'

  name:                 DS.attr 'string'
  description:          DS.attr 'string'
  duration:             DS.attr 'string'
  seatsCount:           DS.attr 'string'
  gym:                  DS.attr 'string'
  shareUrl:             DS.attr 'string'
  isNeedManagerConfirm: DS.attr 'boolean'

  type:         DS.belongsTo 'workout/type'
  template:     DS.belongsTo 'workout/template'
  club:         DS.belongsTo 'club'

  users:        DS.hasMany 'user'
  coaches:      DS.hasMany 'coach'

  formattedDateTime: Ember.computed 'datetime', ->
    moment(@get('datetime')).format('DD.MM.YYYY hh:mm')

`export default Workout`
