`import Ember from 'ember'`

PanelAccountsController = Ember.Controller.extend
  session: Ember.inject.service()
  queryParams: ['scope', 'page', 'perPage']
  scope: 'not_clients'
  page: 1
  perPage: 10

  paginationContent: Ember.computed 'model.meta.current_page', 'model.meta.total_pages', ->
    {
      page: @get('model.meta.current_page')
      totalPages: @get('model.meta.total_pages')
    }

  isPaginationEnabled: Ember.computed.gt 'model.meta.total_pages', 1

  actions:
    changePage: (num) ->
      @set('page', num)

    edit: (account) ->
      @transitionToRoute 'edit-panel-account', account.id

    destroy: (account) ->
      if confirm('Удалить новость?')
        account.destroyRecord()

`export default PanelAccountsController`
