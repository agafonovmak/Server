`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  session: Ember.inject.service()

  init: ->
    @_super()
    Ember.run.schedule 'afterRender', this, ->
      $('.dropdown-button').dropdown()

  actions:
    invalidateSession: ->
      @get('session').invalidate()
      @transitionToRoute 'root'

    gotoRoot: ->
      @transitionToRoute 'root'

`export default ApplicationController`
