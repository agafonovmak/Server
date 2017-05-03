`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditUserTypeRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('user-type', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'roles', @store.findAll('role')

`export default EditUserTypeRoute`
