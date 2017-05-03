`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewScoreRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    @store.createRecord('score-rule')

`export default NewScoreRoute`
