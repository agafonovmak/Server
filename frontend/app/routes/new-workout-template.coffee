`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewWorkoutTemplateRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('workout/template')
    @get('session.currentUser').then (user) ->
      model.set 'club', user.get('selectedClub')
    model

`export default NewWorkoutTemplateRoute`
