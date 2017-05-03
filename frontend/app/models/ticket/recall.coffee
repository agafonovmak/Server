`import DS from 'ember-data'`
`import TicketBaseModelMixin from '../../mixins/ticket-base-model'`

TicketRecall = DS.Model.extend TicketBaseModelMixin,

  reason:          DS.attr 'string'
  mobile:          DS.attr 'string'
  comment:         DS.attr 'string'

`export default TicketRecall`
