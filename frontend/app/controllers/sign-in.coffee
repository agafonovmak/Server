`import Ember from 'ember'`

SignInController = Ember.Controller.extend
  session: Ember.inject.service()
  hasAuthErrors: false

  actions:
    authenticate: ->
      @set('hasAuthErrors', false)
      identification = @get 'email'
      password       = @get 'password'
      @get('session').authenticate('authenticator:devise', identification, password).then(=>
        @transitionToRoute 'root'
      ).catch (=>
        @set('hasAuthErrors', true)
      )

`export default SignInController`
