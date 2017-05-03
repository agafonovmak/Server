`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:edit-panel-account', 'Unit | Route | edit panel account', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
