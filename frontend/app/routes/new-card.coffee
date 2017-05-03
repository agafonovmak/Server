`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewCardRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('card')
    @get('session.currentUser').then (user) ->
      if user.get('isManager')
        model.set 'club', user.get('clubs.firstObject')
    model.set 'expirationDate', moment().format('DD-MM-YYYY')
    model

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'clubs', @store.findAll('club')
    controller.set 'users', @store.findAll('user')

`export default NewCardRoute`
