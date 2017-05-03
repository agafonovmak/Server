`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewWorkoutTypeRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    @store.createRecord('workout/type')

`export default NewWorkoutTypeRoute`
