`import { moduleForModel, test } from 'ember-qunit'`

moduleForModel 'rewards-history', 'Unit | Model | rewards history', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
