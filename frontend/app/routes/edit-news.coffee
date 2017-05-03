`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditNewsRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('news', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default EditNewsRoute`
