`import DS from 'ember-data'`

Coach = DS.Model.extend

  name:                 DS.attr 'string'
  imageUrl:             DS.attr 'string'
  shareUrl:             DS.attr 'string'
  image:                DS.attr 'file'
  removeImage:          DS.attr 'boolean'
  conductingPersonal:   DS.attr 'boolean', defaultValue: true
  conductingGroup:      DS.attr 'boolean'

  club:                 DS.belongsTo 'club'
  coachEducations:      DS.hasMany 'coach/education'
  coachAchievements:    DS.hasMany 'coach/achievement'
  coachSpecializations: DS.hasMany 'coach/specializations'

  workouts:             DS.hasMany 'workout'

`export default Coach`
