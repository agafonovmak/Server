`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewQrRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    @store.createRecord('qr')

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'qrTemplates', @store.findAll('qr/template')

`export default NewQrRoute`
