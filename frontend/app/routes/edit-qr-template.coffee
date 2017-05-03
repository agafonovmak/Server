`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditQrTemplate = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('qr/template', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default EditQrTemplate`
