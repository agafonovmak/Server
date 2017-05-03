`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewRewardTemplateController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'reward-templates'
        @scrollToTop()
        @showToast('Шаблон приза успешно создан!')

`export default NewRewardTemplateController`
