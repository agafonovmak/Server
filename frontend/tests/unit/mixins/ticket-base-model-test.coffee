`import Ember from 'ember'`
`import TicketBaseModelMixin from '../../../mixins/ticket-base-model'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | ticket base model'

# Replace this with your real tests.
test 'it works', (assert) ->
  TicketBaseModelObject = Ember.Object.extend TicketBaseModelMixin
  subject = TicketBaseModelObject.create()
  assert.ok subject
