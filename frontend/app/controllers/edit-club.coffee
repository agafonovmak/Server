`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

EditClubController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  timepickerOptions: Ember.computed ->
    {format: "HH:i"}

  actions:
    save: ->
      @get('shedule').then (shedule) =>
        shedule.save()
      @get('model').save().then =>
        @transitionToRoute 'club', @get('model.id')
        @scrollToTop()
        @showToast('Клуб успешно сохранен!')

    deleteImage: (image) ->
      if confirm('Удалить изображение?')
        image.destroyRecord()
        @showToast('Изображение успешно удалено!')

    setTime: ->
      @set ('model.clubShedule.weekdaysTimeStart'), $('#weekdaysTimeStart').val()
      @set ('model.clubShedule.weekdaysTimeStop'),  $('#weekdaysTimeStop').val()
      @set ('model.clubShedule.weekendTimeStart'),  $('#weekendTimeStart').val()
      @set ('model.clubShedule.weekendTimeStop'),   $('#weekendTimeStop').val()

`export default EditClubController`
