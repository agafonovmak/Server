`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditCardTemplateRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('card/template', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default EditCardTemplateRoute`
