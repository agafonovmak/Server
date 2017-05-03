`import Ember from 'ember'`

TicketBaseControllerMixin = Ember.Mixin.create
  queryParams: ['scope', 'page', 'perPage']
  scope: null
  page: 1
  perPage: 10

  isNullState:    Ember.computed.equal 'scope', null
  isOpenState:    Ember.computed.equal 'scope', 'opened'
  isCloseState:   Ember.computed.equal 'scope', 'closed'
  isDeclineState: Ember.computed.equal 'scope', 'declined'

  paginationContent: Ember.computed 'model.meta.current_page', 'model.meta.total_pages', ->
    {
      page: @get('model.meta.current_page')
      totalPages: @get('model.meta.total_pages')
    }

  isPaginationEnabled: Ember.computed.gt 'model.meta.total_pages', 1

  actions:
    setState: (newState) ->
      @set 'page', 1
      @set 'scope', newState

    changePage: (num) ->
      @set('page', num)

`export default TicketBaseControllerMixin`
