`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewTrainingPackageRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('training-package')
    @get('session.currentUser').then (user) ->
      model.set 'club', user.get('selectedClub')
    model

`export default NewTrainingPackageRoute`
