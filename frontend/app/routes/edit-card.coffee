`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditCardRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('card', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'cardTemplates', @store.findAll('card/template')

`export default EditCardRoute`
