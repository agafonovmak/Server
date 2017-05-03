`import Ember from 'ember'`
`import TicketBaseControllerMixin from '../../../mixins/ticket-base-controller'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | ticket base controller'

# Replace this with your real tests.
test 'it works', (assert) ->
  TicketBaseControllerObject = Ember.Object.extend TicketBaseControllerMixin
  subject = TicketBaseControllerObject.create()
  assert.ok subject
