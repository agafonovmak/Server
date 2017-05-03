`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`

ScheduleTemplatesController = Ember.Controller.extend ToastMixin,

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

    show: (template) ->
      @transitionToRoute 'schedule-template', template.id

    destroy: (template) ->
      if confirm('Удалить шаблон расписания?')
        template.destroyRecord()
        @showToast('Шаблон расписания успешно удален!')

`export default ScheduleTemplatesController`
