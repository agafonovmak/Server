`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

FranchiseRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('franchise', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default FranchiseRoute`
