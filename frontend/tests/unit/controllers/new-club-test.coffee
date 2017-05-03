`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'controller:new-club', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  controller = @subject()
  assert.ok controller
