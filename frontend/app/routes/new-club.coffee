`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewClubRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('club')
    @get('session.currentUser').then (user) ->
      model.set 'franchise', user.get('franchise')
      model.get('users').pushObject(user)
    model

`export default NewClubRoute`
