`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

NewFranchiseRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ->
    @store.createRecord('franchise')

`export default NewFranchiseRoute`
