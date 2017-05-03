`import Ember from 'ember'`

RewardTemplatesController = Ember.Controller.extend

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

    show: (rewardTemplate) ->
      @transitionToRoute 'reward-template', rewardTemplate.id

    edit: (rewardTemplate) ->
      @transitionToRoute 'edit-reward-template', rewardTemplate.id

    destroy: (rewardTemplate) ->
      if confirm('Удалить шаблон приза?')
        rewardTemplate.destroyRecord()

`export default RewardTemplatesController`
