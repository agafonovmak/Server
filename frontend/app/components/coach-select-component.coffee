`import Ember from 'ember'`

CoachSelectComponentComponent = Ember.Component.extend

  store: Ember.inject.service()

  didRender: ->
    @$('select').material_select()

  actions:
    addCoach: ->
      @get('store').findRecord('coach', @$('select').val()).then (coach) =>
        @get('model.coaches').pushObject(coach)

`export default CoachSelectComponentComponent`

