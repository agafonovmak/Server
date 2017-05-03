`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

EditNewsController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  textTabActive:    Ember.computed.gt 'model.body.length', 0
  youtubeTabActive: Ember.computed.gt 'model.youtubeVideoUrl.length', 0
  imageTabActive:   Ember.computed.gt 'model.imageUrl.length', 0

  actions:
    setType: (type) ->
      @set 'model.type', type

    save: ->
      @get('model').save().then (model)=>
        @transitionToRoute 'show-news', model.id
        @scrollToTop()
        @showToast('Новость успешно сохранена!')

    deleteImage: ->
      @set 'model.imageUrl', null
      @set 'model.removeFile', true
      @showToast('Изображение помечено как удаленное!')
      return false

`export default EditNewsController`
