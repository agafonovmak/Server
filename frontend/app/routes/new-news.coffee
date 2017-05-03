`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewNewsRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('news')
    @get('session.currentUser').then (user) ->
      model.set 'user', user
      model.set 'club', user.get('selectedClub')
    model

`export default NewNewsRoute`
