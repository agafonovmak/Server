`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewTrainingPackageController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'training-packages'
        @scrollToTop()
        @showToast('Пакет успешно создан!')

`export default NewTrainingPackageController`
