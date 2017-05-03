`import Ember from 'ember'`

FileUploaderComponent = Ember.Component.extend

  tmpFile: null

  fileObserver: Ember.observer 'tmpFile', ->
    file = @$('input').prop('files')[0]
    @set 'file', file

`export default FileUploaderComponent`
