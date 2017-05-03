`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewUserTypeRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('user-type')
    @get('session.currentUser').then (user) ->
      model.set 'club', user.get('selectedClub')
    model

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'roles', @store.findAll('role')

`export default NewUserTypeRoute`
