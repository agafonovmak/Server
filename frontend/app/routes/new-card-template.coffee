`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewCardTemplateRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    model = @store.createRecord('card/template')
    @get('session.currentUser').then (user) ->
      if user.get('isManager')
        model.set 'club', user.get('clubs').content.canonicalState[0]
    model

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'clubs', @store.findAll('club')

`export default NewCardTemplateRoute`
