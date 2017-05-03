`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

EditPanelAccountController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'panel-accounts'
        @scrollToTop()
        @showToast('Аккаунт успешно сохранен!')

`export default EditPanelAccountController`
