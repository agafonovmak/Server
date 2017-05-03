`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewScheduleTemplate = Ember.Route.extend AuthenticatedRouteMixin,
  session: Ember.inject.service()

  model: ->
    @store.createRecord('schedule-template')

  setupController: (controller, model) ->
    controller.set 'model',     model
    controller.set 'types',     @store.findAll('workout/type')
    controller.set 'templates', @store.findAll('workout/template')
    controller.set 'coaches',   @store.findAll('coach')
    @get('session.currentUser').then (user) ->
      model.set 'club', user.get('selectedClub')
      controller.set 'selectedClub', user.get('selectedClub')

  actions:
    didTransition: ->
      Ember.run.schedule 'afterRender', this, ->
        $('.fc-agendaWeek-button').click().hide()

`export default NewScheduleTemplate`
