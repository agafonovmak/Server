`import Ember from 'ember'`
`import ScrollToTopMixin from '../../../mixins/scroll-to-top'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | scroll to top'

# Replace this with your real tests.
test 'it works', (assert) ->
  ScrollToTopObject = Ember.Object.extend ScrollToTopMixin
  subject = ScrollToTopObject.create()
  assert.ok subject
