`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:edit-qr-template', 'Unit | Route | edit qr template', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
