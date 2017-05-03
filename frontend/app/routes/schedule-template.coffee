`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

ScheduleTemplateRoute = Ember.Route.extend AuthenticatedRouteMixin,

  beforeModel: ->
    @store.unloadAll('schedule-workout')

  model: (params)->
    @store.findRecord('schedule-template', params.id)

  afterModel: ->
    $('.material-tooltip').remove()

  actions:
    didTransition: ->
      Ember.run.schedule 'afterRender', this, ->
        $('.fc-agendaWeek-button').click().hide()

`export default ScheduleTemplateRoute`
