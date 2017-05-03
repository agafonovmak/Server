`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewWorkoutTypeController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'workout-types'
        @scrollToTop()
        @showToast('Тип групповой тренировки успешно создан!')

`export default NewWorkoutTypeController`
