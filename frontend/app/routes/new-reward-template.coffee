`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewRewardTemplateRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('reward/template')
    @get('session.currentUser').then (user) ->
      model.set 'club', user.get('selectedClub')
    model

`export default NewRewardTemplateRoute`
