`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`

RewardsHistoryController = Ember.Controller.extend ToastMixin,
  queryParams: ['scope', 'page', 'perPage']
  scope: null
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

    show: (history) ->
      @transitionToRoute 'reward-history', history.id

    destroy: (history) ->
      if confirm('Удалить запись?')
        history.destroyRecord()
        @showToast('Запись успешно удалена!')

`export default RewardsHistoryController`
