`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:new-reward-template', 'Unit | Route | new reward template', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
