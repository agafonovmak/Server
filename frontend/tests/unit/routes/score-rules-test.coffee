`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:score-rules', 'Unit | Route | score rules', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
