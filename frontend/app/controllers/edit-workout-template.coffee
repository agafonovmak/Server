`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

EditWorkoutTemplateController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'workout-templates'
        @scrollToTop()
        @showToast('Шаблон успешно сохранен!')

    deleteImage: (image) ->
      if confirm('Удалить изображение?')
        image.destroyRecord()

`export default EditWorkoutTemplateController`
