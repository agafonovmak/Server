`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewWorkoutTemplateController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'workout-templates'
        @scrollToTop()
        @showToast('Шаблон групповой тренировки успешно создан!')

`export default NewWorkoutTemplateController`
