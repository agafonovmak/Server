`import DS from 'ember-data'`

Card = DS.Model.extend

  number:                         DS.attr 'string'
  aasmState:                      DS.attr 'string'
  expirationDate:                 DS.attr 'string'
  availableFreeFreezingDaysCount: DS.attr 'number'

  user:     DS.belongsTo 'user'
  club:     DS.belongsTo 'club'
  template: DS.belongsTo 'card/template'

  formattedExpirationDate: Ember.computed 'expirationDate', ->
    moment(@get('expirationDate')).format('DD.MM.YYYY')

  formattedAasmState: Ember.computed 'aasmState', ->
    switch @get('aasmState')
      when 'active'
        return 'Активная'
      when 'inactive'
        return 'Неактивна'
      else
        return 'Заморожена'

`export default Card`
