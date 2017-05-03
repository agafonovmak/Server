`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewPanelAccountRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('user')
    @get('session.currentUser').then (user) ->
      unless user.get('isOwner')
        user.get('franchise').then (franchise) ->
          model.set 'franchise', franchise
      unless user.get('isOwner')
        user.get('selectedClub').then (club) ->
          model.get('clubs').pushObject(club)
    model

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'userTypes', @get('store').findAll('user-type')
    controller.set 'franchises', @get('store').findAll('franchise')
    controller.set 'clubs', @get('store').findAll('club')

`export default NewPanelAccountRoute`
