`import DS from 'ember-data'`
`import TicketBaseModelMixin from '../../mixins/ticket-base-model'`

TicketGuestVisit = DS.Model.extend TicketBaseModelMixin,

  name:             DS.attr 'string'
  email:            DS.attr 'string'
  mobile:           DS.attr 'string'
  comment:          DS.attr 'string'
  time:             DS.attr 'string'

  formattedTime: Ember.computed 'time', ->
    moment(@get('time')).format('DD.MM.YYYY HH:mm')

`export default TicketGuestVisit`
