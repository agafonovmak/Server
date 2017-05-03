`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`

CoachesController = Ember.Controller.extend ToastMixin,
  session: Ember.inject.service()
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

    show: (coach) ->
      @transitionToRoute 'coach', coach.id

    edit: (coach) ->
      @transitionToRoute 'edit-coach', coach.id

    destroy: (coach) ->
      if confirm('Удалить тренера?')
        coach.destroyRecord()
        @showToast('Тренер удален!')

`export default CoachesController`
