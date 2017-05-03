`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditPanelAccountRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('user', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'userTypes', @get('store').findAll('user-type')

`export default EditPanelAccountRoute`
