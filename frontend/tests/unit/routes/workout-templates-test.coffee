`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:workout-templates', 'Unit | Route | workout templates', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
