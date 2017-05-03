`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewFranchiseController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then (model) =>
        @transitionToRoute 'franchise', model.id
        @scrollToTop()
        @showToast('Франшиза успешно создана!')

`export default NewFranchiseController`
