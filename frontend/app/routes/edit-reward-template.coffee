`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditRewardTemplateRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('reward/template', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default EditRewardTemplateRoute`
