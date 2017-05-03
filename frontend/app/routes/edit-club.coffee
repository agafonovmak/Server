`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditClubRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('club', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

  setupController: (controller, model) ->
    controller.set 'model',   model
    controller.set 'shedule', model.get('clubShedule')

`export default EditClubRoute`
