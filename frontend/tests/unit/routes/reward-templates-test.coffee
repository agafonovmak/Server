`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:reward-templates', 'Unit | Route | reward templates', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
