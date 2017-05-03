`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

RewardHistoryRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('history/reward', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default RewardHistoryRoute`
