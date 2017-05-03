`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import RouteMixin from 'ember-cli-pagination/remote/route-mixin'`

CardsRoute = Ember.Route.extend AuthenticatedRouteMixin, RouteMixin,
  queryParams:
    scope:
      refreshModel: true
    page:
      refreshModel: true
    perPage:
      refreshModel: true

  beforeModel: ->
    @store.unloadAll('card')

  model: (params) ->
    @findPaged('card', params)

`export default CardsRoute`
