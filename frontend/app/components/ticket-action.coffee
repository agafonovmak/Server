`import Ember from 'ember'`

TicketActionComponent = Ember.Component.extend
  tagName: 'span'
  classNames: ['ticket-action']
  classNameBindings: ['sendingAction']
  moderatorComment: null
  isCloseAction: Ember.computed.equal 'sendingAction', 'close'
  modalHeader: Ember.computed 'sendingAction', ->
    if @get('isCloseAction')
      'Закрытие запроса'
    else
      'Отклонение'

  modalId: Ember.computed 'ticket', ->
    @get('ticket.id') + @get('sendingAction')

  modalIdHref: Ember.computed 'modalId', ->
    '#'+@get('modalId')

  tooltipTitle: Ember.computed 'sendingAction', ->
    if @get('isCloseAction')
      'Закрыть тикет'
    else
      'Отклонить тикет'

  didInsertElement: ->
    @$('.modal-trigger').leanModal()
    @$('.tooltipped').tooltip({delay: 50})

  actions:
    appendAction: ->
      @set 'ticket.moderatorComment', @get('moderatorComment')
      @sendAction('sendingAction', @get('ticket'))

`export default TicketActionComponent`

