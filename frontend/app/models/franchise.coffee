`import DS from 'ember-data'`

Franchise = DS.Model.extend
  name:                DS.attr 'string'
  description:         DS.attr 'string'
  firstLevelMinScore:  DS.attr 'number'
  secondLevelMinScore: DS.attr 'number'
  thirdLevelMinScore:  DS.attr 'number'
  fourthLevelMinScore: DS.attr 'number'
  fifthLevelMinScore:  DS.attr 'number'
  cardExpirationDateNotifyDaysCount:  DS.attr 'number'

  users:               DS.hasMany   'user'

`export default Franchise`
