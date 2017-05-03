`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditWorkoutTemplateRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('workout/template', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default EditWorkoutTemplateRoute`
