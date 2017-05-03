`import { moduleForModel, test } from 'ember-qunit'`

moduleForModel 'score-rule', 'Unit | Model | score rule', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
