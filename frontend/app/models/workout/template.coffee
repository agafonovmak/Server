`import DS from 'ember-data'`

WorkoutTemplate = DS.Model.extend

  name:                 DS.attr 'string'
  description:          DS.attr 'string'
  duration:             DS.attr 'string'
  seatsCount:           DS.attr 'string'
  gym:                  DS.attr 'string'
  shareUrl:             DS.attr 'string'
  isNeedManagerConfirm: DS.attr 'boolean'

  club:                 DS.belongsTo 'club'
  images:               DS.hasMany 'workout/image'

`export default WorkoutTemplate`
