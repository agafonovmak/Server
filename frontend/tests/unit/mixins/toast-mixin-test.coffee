`import Ember from 'ember'`
`import ToastMixinMixin from '../../../mixins/toast-mixin'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | toast mixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  ToastMixinObject = Ember.Object.extend ToastMixinMixin
  subject = ToastMixinObject.create()
  assert.ok subject
