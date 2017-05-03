`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewNewsController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  actions:
    setType: (type) ->
      @set 'model.type', type

    save: ->
      @get('model').save().then (model) =>
        @transitionToRoute 'show-news', model.id
        @scrollToTop()
        @showToast('Новость успешно создана!')

`export default NewNewsController`
