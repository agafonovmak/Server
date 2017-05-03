`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:edit-training-packages', 'Unit | Route | edit training packages', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
