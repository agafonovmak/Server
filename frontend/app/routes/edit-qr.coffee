`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditQrRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('qr', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'qrTemplates', @store.findAll('qr/template')

`export default EditQrRoute`
