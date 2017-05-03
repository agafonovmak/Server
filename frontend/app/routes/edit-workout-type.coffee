`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditWorkoutTypeRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('workout/type', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default EditWorkoutTypeRoute`
