`import Ember from 'ember'`

TicketBaseModelMixin = Ember.Mixin.create
  moderatorComment:    DS.attr 'string'
  aasmState:           DS.attr 'string'
  createdAt:           DS.attr 'string'

  club:  DS.belongsTo 'club'
  user:  DS.belongsTo 'user'

  formattedStatus: Ember.computed 'aasmState', ->
    switch @get('aasmState')
      when 'opened'
        return 'Открыт'
      when 'closed'
        return 'Закрыт'
      else
        return 'Отклонен'

  formattedCreatedAt: Ember.computed 'createdAt', ->
    moment(@get('createdAt')).format('DD.MM.YYYY HH:mm')

  formattedModeratorComment: Ember.computed 'moderatorComment', ->
    if @get 'moderatorComment'
      @get 'moderatorComment'
    else
      'Коментария нет'

  statusClass: Ember.computed 'aasmState', ->
    @get('aasmState') + ' status-badge'

  isOpened: Ember.computed.equal 'aasmState', 'opened'

`export default TicketBaseModelMixin`
