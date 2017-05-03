`import Ember from 'ember'`

WorkoutTypesController = Ember.Controller.extend
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

    edit: (type) ->
      @transitionToRoute 'edit-workout-type', type.id

    destroy: (type) ->
      if confirm('Удалить запись?')
        type.destroyRecord()

`export default WorkoutTypesController`
