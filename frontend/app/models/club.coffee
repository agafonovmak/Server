`import DS from 'ember-data'`

Club = DS.Model.extend

  name:          DS.attr 'string'
  description:   DS.attr 'string'
  phone:         DS.attr 'string'
  address:       DS.attr 'string'
  websiteLink:   DS.attr 'string'
  vkLink:        DS.attr 'string'
  twitterLink:   DS.attr 'string'
  facebookLink:  DS.attr 'string'
  instagramLink: DS.attr 'string'

  clubShedule:   DS.belongsTo 'club/shedule'
  cardTemplates: DS.hasMany 'card/template'
  franchise:     DS.belongsTo 'franchise'
  selectedAdmin: DS.belongsTo 'user', { inverse: 'selectedClub' }
  users:         DS.hasMany   'user'
  clubImages:    DS.hasMany   'club/image'

`export default Club`
