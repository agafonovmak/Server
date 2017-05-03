`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewClubController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    save: ->
      @get('model').save().then (model) =>
        @transitionToRoute 'club', model.id
        @scrollToTop()
        @showToast('Клуб успешно создан!')

`export default NewClubController`
