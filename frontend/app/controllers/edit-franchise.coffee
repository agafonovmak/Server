`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

EditFranchiseController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then (model)=>
        @transitionToRoute 'franchise', model.id
        @scrollToTop()
        @showToast('Франшиза успешно сохранена!')

`export default EditFranchiseController`
