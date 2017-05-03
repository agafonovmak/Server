`import Ember from 'ember'`
`import ToastMixin from '../mixins/toast-mixin'`
`import ScrollToTopMixin from '../mixins/scroll-to-top'`

NewUserTypeController = Ember.Controller.extend ToastMixin, ScrollToTopMixin,

  defaultRoles: Ember.computed.filterBy 'roles', 'type', 'default'
  readerRoles:  Ember.computed.filterBy 'roles', 'type', 'reader'
  writerRoles:  Ember.computed.filterBy 'roles', 'type', 'writer'

  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'user-types'
        @scrollToTop()
        @showToast('Тип аккаунта успешно создан!')

`export default NewUserTypeController`
