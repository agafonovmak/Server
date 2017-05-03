`import { moduleForModel, test } from 'ember-qunit'`

moduleForModel 'ticket/workout-request', 'Unit | Model | ticket/workout request', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
