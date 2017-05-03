`import Ember from 'ember'`

RoleCheckComponentComponent = Ember.Component.extend

  isChecked: false

  didInsertElement: ->
    @set 'isChecked', @get('role._internalModel') in @get('roles.content.canonicalState')

  onCheck: Ember.observer 'isChecked', ->
    if @get('isChecked')
      @get('roles').pushObject(@get('role'))
    else
      @get('roles').removeObject(@get('role'))

`export default RoleCheckComponentComponent`
