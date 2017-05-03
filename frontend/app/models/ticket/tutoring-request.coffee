`import DS from 'ember-data'`
`import TicketBaseModelMixin from '../../mixins/ticket-base-model'`

TicketTutoringRequest = DS.Model.extend TicketBaseModelMixin,

  name:             DS.attr 'string'
  email:            DS.attr 'string'
  mobile:           DS.attr 'string'

  user:             DS.belongsTo 'user'

`export default TicketTutoringRequest`
