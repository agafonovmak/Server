`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

EditRewardTemplateController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'reward-templates'
        @scrollToTop()
        @showToast('Шаблон приза успешно сохранен!')

    deleteImage: ->
      @set 'model.fileUrl', null
      @set 'model.removeFile', true
      return false

`export default EditRewardTemplateController`
