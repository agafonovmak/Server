`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

EditTrainingPackageController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'training-packages'
        @scrollToTop()
        @showToast('Пакет успешно сохранен!')

`export default EditTrainingPackageController`
