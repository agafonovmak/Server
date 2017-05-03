`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditScoreRuleRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('score-rule', params.id)

  afterModel: ->
    $('.material-tooltip').remove()


`export default EditScoreRuleRoute`
