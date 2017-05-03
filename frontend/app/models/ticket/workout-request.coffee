`import DS from 'ember-data'`
`import TicketBaseModelMixin from '../../mixins/ticket-base-model'`

TicketWorkoutRequest = DS.Model.extend TicketBaseModelMixin,

  name:                DS.attr 'string'
  email:               DS.attr 'string'
  mobile:              DS.attr 'string'
  workoutTemplateName: DS.attr 'string'
  totalSeatsCount:     DS.attr 'string'
  availableSeatsCount: DS.attr 'string'

  user:                DS.belongsTo 'user'

`export default TicketWorkoutRequest`
