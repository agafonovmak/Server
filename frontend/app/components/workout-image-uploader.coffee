`import Ember from 'ember'`

WorkoutImageUploader = Ember.Component.extend
  store: Ember.inject.service('store')
  tmpFile: null

  fileObserver: Ember.observer 'tmpFile', ->
    file = @$('input').prop('files')[0]
    if !Ember.isEmpty(file)
      image = @get('store').createRecord('workout/image')
      image.set 'template', @get('workout')
      image.set 'file', file
      image.save()

`export default WorkoutImageUploader`

