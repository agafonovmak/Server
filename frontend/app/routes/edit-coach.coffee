`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditCoachRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('coach', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default EditCoachRoute`
