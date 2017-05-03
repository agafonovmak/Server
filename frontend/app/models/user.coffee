`import DS from 'ember-data'`

User = DS.Model.extend
  email:        DS.attr 'string'
  name:         DS.attr 'string'
  mobile:       DS.attr 'string'
  age:          DS.attr 'number'

  password:             DS.attr 'string'
  passwordConfirmation: DS.attr 'string'

  isAdmin:        DS.attr 'boolean'
  isOwner:        DS.attr 'boolean'
  isAdminOrOwner: DS.attr 'boolean'

  rolesList:     DS.attr()

  userType:     DS.belongsTo 'user-type'
  franchise:    DS.belongsTo 'franchise'
  selectedClub: DS.belongsTo 'club', { inverse: 'selectedAdmin' }
  clubs:        DS.hasMany   'club'

  selectedClubName: Ember.computed 'selectedClub', 'selectedClub.isFulfilled', ->
    @get('selectedClub.name')

`export default User`
