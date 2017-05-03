`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import RouteMixin from 'ember-cli-pagination/remote/route-mixin'`

RewardTemplatesRoute = Ember.Route.extend AuthenticatedRouteMixin, RouteMixin,

  queryParams:
    scope:
      refreshModel: true
    page:
      refreshModel: true
    perPage:
      refreshModel: true

  beforeModel: ->
    @store.unloadAll('reward/template')

  model: (params) ->
    @findPaged('reward/template', params)

`export default RewardTemplatesRoute`
