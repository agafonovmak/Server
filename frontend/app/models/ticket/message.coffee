`import DS from 'ember-data'`
`import TicketBaseModelMixin from '../../mixins/ticket-base-model'`

TicketMessage = DS.Model.extend TicketBaseModelMixin,

  text:            DS.attr 'string'
  email:           DS.attr 'string'
  mobile:          DS.attr 'string'

`export default TicketMessage`
