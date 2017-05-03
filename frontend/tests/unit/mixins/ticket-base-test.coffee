`import Ember from 'ember'`
`import TicketBaseMixin from '../../../mixins/ticket-base'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | ticket base'

# Replace this with your real tests.
test 'it works', (assert) ->
  TicketBaseObject = Ember.Object.extend TicketBaseMixin
  subject = TicketBaseObject.create()
  assert.ok subject
