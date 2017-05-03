`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

EditTrainingPackageRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: (params)->
    @store.findRecord('training-package', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

`export default EditTrainingPackageRoute`
