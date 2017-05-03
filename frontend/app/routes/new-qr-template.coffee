`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewQrTemplate = Ember.Route.extend AuthenticatedRouteMixin,
  session: Ember.inject.service()

  model: ->
    model = @store.createRecord('qr/template')
    @get('session.currentUser').then (user) ->
      model.set 'franchise', user.get('franchise')
    model

`export default NewQrTemplate`
