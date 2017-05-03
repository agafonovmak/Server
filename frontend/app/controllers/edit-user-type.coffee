`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

EditUserTypeController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'user-types'
        @scrollToTop()
        @showToast('Тип аккаунта успешно сохранен!')

`export default EditUserTypeController`
