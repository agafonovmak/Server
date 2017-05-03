`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import RouteMixin from 'ember-cli-pagination/remote/route-mixin'`

FreezingRoute = Ember.Route.extend AuthenticatedRouteMixin, RouteMixin,
  queryParams:
    scope:
      refreshModel: true
    page:
      refreshModel: true
    perPage:
      refreshModel: true

  beforeModel: ->
    @store.unloadAll('ticket/freezing')

  model: (params) ->
    @findPaged('ticket/freezing', params)

`export default FreezingRoute`
