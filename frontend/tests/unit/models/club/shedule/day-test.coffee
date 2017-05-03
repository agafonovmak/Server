`import { moduleForModel, test } from 'ember-qunit'`

moduleForModel 'club/shedule/day', 'Unit | Model | club/shedule/day', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
