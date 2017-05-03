`import Ember from 'ember'`

IfCanComponent = Ember.Component.extend
  subjectType: null
  subjectId:   null
  action:      null
  store:  Ember.inject.service()
  session: Ember.inject.service()
  tagName: ''
  permissionModel: null

  permission: Ember.computed 'session.isAuthenticated', 'subjectType', 'subjectId', 'action', ->
    if @get('session.isAuthenticated')
      id = {
        subject_type: @get('subjectType')
        subject_id: @get('subjectId')
        action: @get('action')
      }
      @set 'permissionModel', @get('store').find('permission', JSON.stringify(id))
      @get 'permissionModel'

`export default IfCanComponent`
