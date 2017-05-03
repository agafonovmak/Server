`import DS from 'ember-data'`
`import TicketBaseModelMixin from '../../mixins/ticket-base-model'`

TicketFreezing = DS.Model.extend TicketBaseModelMixin,
  from: DS.attr 'string'
  to:   DS.attr 'string'

  formattedFrom: Ember.computed 'from', ->
    moment(@get('from')).format('DD.MM.YYYY HH:mm')

  formattedTo: Ember.computed 'to', ->
    moment(@get('to')).format('DD.MM.YYYY HH:mm')

`export default TicketFreezing`
