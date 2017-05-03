`import Ember from 'ember'`

ClubImageUploader = Ember.Component.extend
  store: Ember.inject.service('store')
  tmpFile: null

  fileObserver: Ember.observer 'tmpFile', ->
    file = @$('input').prop('files')[0]
    if !Ember.isEmpty(file)
      image = @get('store').createRecord('club/image')
      image.set 'club', @get('club')
      image.set 'file', file
      image.save()

`export default ClubImageUploader`

