`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewCoachRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('coach')
    @get('session.currentUser').then (user) ->
      model.set 'club', user.get('selectedClub')
    model

`export default NewCoachRoute`
