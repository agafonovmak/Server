`import Ember from 'ember'`

ToastMixinMixin = Ember.Mixin.create

  showToast: (message) ->
    Materialize.toast(message, 3000, 'rounded')

`export default ToastMixinMixin`
