`import Ember from 'ember'`

UserTypesController = Ember.Controller.extend
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
    edit: (userType) ->
      @transitionToRoute 'edit-user-type', userType.id

    destroy: (userType) ->
      if confirm('Удалить запись?')
        userType.destroyRecord()

`export default UserTypesController`
